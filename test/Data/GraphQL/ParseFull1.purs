module Test.Data.GraphQL.ParseFull1 where

import Prelude
import Data.Either (either)
import Data.GraphQL.AST (ObjectValue(..))
import Data.GraphQL.AST as AST
import Data.GraphQL.Parser as GP
import Data.Lens (class Wander, _Just)
import Data.Lens as L
import Data.Lens.Index as LI
import Data.Lens.Record as LR
import Data.List (singleton)
import Data.Maybe (Maybe(..))
import Data.Profunctor.Choice (class Choice)
import Data.Symbol (SProxy(..))
import Data.Tuple (uncurry)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Effect.Exception (throw)
import Test.Spec (SpecT, before, describe, it)
import Test.Spec.Assertions (shouldEqual)
import Text.Parsing.Parser (runParser)
import Text.Parsing.Parser.String (class StringLike)

parseDocument ∷ ∀ s. StringLike s ⇒ s → Aff (AST.Document)
parseDocument t = liftEffect (either (throw <<< show) pure (runParser t GP.document))

query =
  """query($id: ID!) {
    id
    user(id: $id, name: { equals: "bob" }, foo: "bar") {
      name
    }
  }

mutation MyMutation {
  id # then an inline fragment
  ... on User {
      friends {
        count
      }
    }
}

# tah dah!
""" ∷
    String

lensToQueryDefinition ∷ ∀ m. Choice m ⇒ Wander m ⇒ m AST.OperationDefinition AST.OperationDefinition → m AST.Document AST.Document
lensToQueryDefinition =
  ( uncurry L.prism' AST._Document
      <<< LI.ix 0
      <<< uncurry L.prism' AST._Definition_ExecutableDefinition
      <<< uncurry L.prism' AST._ExecutableDefinition_OperationDefinition
  )

getFirstQueryVarDef ∷ AST.Document → Maybe AST.VariableDefinition
getFirstQueryVarDef =
  L.preview
    $ ( lensToQueryDefinition
          <<< uncurry L.prism' AST._OperationDefinition_OperationType
          <<< LR.prop (SProxy ∷ SProxy "variableDefinitions")
          <<< L._Just
          <<< uncurry L.prism' AST._VariableDefinitions
          <<< LI.ix 0
      )

getNameDef ∷ AST.Document → Maybe AST.Argument
getNameDef =
  L.preview
    $ ( lensToQueryDefinition
          <<< uncurry L.prism' AST._OperationDefinition_OperationType
          <<< LR.prop (SProxy ∷ SProxy "selectionSet")
          <<< uncurry L.prism' AST._SelectionSet
          <<< LI.ix 1
          <<< uncurry L.prism' AST._Selection_Field
          <<< uncurry L.prism' AST._Field
          <<< LR.prop (SProxy ∷ SProxy "arguments")
          <<< _Just
          <<< uncurry L.prism' AST._Arguments
          <<< LI.ix 1
      )

testQuery ∷ ∀ m. Monad m ⇒ SpecT Aff Unit m Unit
testQuery =
  describe "test full query" do
    before (parseDocument query)
      $ do
          it "should parse $id:ID!" \doc → do
            getFirstQueryVarDef doc `shouldEqual` (Just $ AST.VariableDefinition { variable: AST.Variable "id", type: AST.Type_NonNullType (AST.NonNullType_NamedType $ AST.NamedType "ID"), defaultValue: Nothing })
          it "should parse name:{equals:\"bob\"}" \doc → do
            getNameDef doc `shouldEqual` (Just $ AST.Argument { name: "name", value: AST.Value_ObjectValue $ ObjectValue (singleton (AST.Argument { name: "equals", value: AST.Value_StringValue $ AST.StringValue "bob" })) })

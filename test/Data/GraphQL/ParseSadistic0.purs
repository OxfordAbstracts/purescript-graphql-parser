module Test.Data.GraphQL.ParseSadistic0 where

import Prelude
import Data.Either (either)
import Data.GraphQL.AST as AST
import Data.GraphQL.Parser as GP
import Effect.Aff (Aff)
import Test.Spec (SpecT, describe, it)
import Test.Spec.Assertions (shouldEqual, fail)
import Text.Parsing.Parser (runParser)

query =
  """{ Z999999 : Z999   @Z99 ( Z9999999 : "뾞" Z9 : "펕ㅻ" Z9__ : $Z9999 ) @Z ( Z9 : true Z9999999 : null Z999 : $Z99999 Z99 : null Z9999999 : [ false null "㋶ꔠ艄翗" ] ) @Z9 ( Z999 : { Z9 : false Z9 : { Z9999 : null Z9999 : 233568 } Z999_9 : null Z999 : null Z9999 : true Z999 : false } ) @Z9  @Z99999 ( Z99 : 0.4079264874606982 Z9999999 : "" Z99 : $Z999999 Z9 : [ null 0.28475046823022443 ] Z9999 : { Z9 : "Z9" Z9 : 865238 Z999999 : "Z9999" Z99999 : "Z99" Z9 : 0.20705605773583802 } Z9999 : null ) @Z99999 ( Z9999999 : { Z9 : [ "" [ -679623 $Z ] { Z : null } "" ] Z9 : [ 0.972630813239436 ] } Z999 : -136147 Z9999999 : "嵉즹篙릏" Z9999 : 0.2963733232097576 Z99 : { Z9 : "晃캂ㄼ踛" Z : null Z : [  ] Z : -903096 Z99999 : 0.8035609935426903 } ) @_9   {  Z99999 (  )  { Z9_9 : Z999 ( Z9999 : null Z9 : "㔉揆" Z999 : "" Z9 : $Z )  { Z99 : Z9   {  } ... Z  @Z99  @Z ( Z9 : true )  } ...     {  Z99 ( Z : null )  @Z99 ( Z9 : [  ] )  {  } } ... on Z999  { ... Z99  } ... Z  @Z99 ( Z99 : false Z99 : "" Z9 : null )  } Z9 : Z ( Z99 : "Z" Z99 : "Z" Z999_99 : null Z9 : false Z999 : -847508 Z999999 : false )   ... on Z999999  @Z99999   { ... on Z9  {  Z99 ( Z99 : "Z" )  @Z  @Z9 (  )   } ... Z9999    } } ... on Z99999  { ... Z99  @Z999 ( Z : 0.575622919749293 Z : null Z99 : { Z9999 : false Z99 : 0.43402963291575647 } Z9 : "Z" ) @Z999999 ( Z999 : 165296 Z99999 : true Z999 : "Z_99" Z9 : 0.9520399700626917 Z9999 : "서" ) @Z  @Z9999  @Z9999 ( Z99 : "" Z99 : null Z99999 : [ {  } 0.18022870699885707 true ] )  ... on Z  @Z999999  @Z ( Z99 : "氭蓵臨" Z9 : "Z999" Z9999 : false Z999 : null ) @Z9999 ( Z99999 : [ "Z9" ] Z999999 : [ 0.23149938286817603 $Z99 [ "" null ] 0.21311289361357358 ] Z9999 : "Z" Z9 : $Z999 Z_99 : [ -793239 "Z" ] )  { Z : Z9 ( Z99 : "Z99" Z99 : null Z9999 : null )  @Z99_9  @Z99 ( Z999 : $Z99 Z : { Z9 : [  ] } Z99_9 : 0.41953172274843403 Z9999 : "Z9" )  { ... Z99  @Z9 (  )  Z9 : Z ( Z9 : 0.836182736715387 )    {  } } }  Z9999   @Z99999 ( Z999 : "Z9" Z99 : "Z9999" Z99999 : { Z999 : $Z9 Z9999 : "읒" Z9 : true Z9 : [  ] } Z : null Z99999 : $Z_99 ) @Z9    Z : Z ( Z99999 : { Z9999 : "᫃" Z : true Z : null } Z9 : true )  @Z99999 ( Z999999 : true Z : { Z : null Z9 : true Z999 : -969889 Z9 : $Z99 } Z9999 : {  } _999 : "Z9" Z9 : {  } Z99 : [ { Z9 : {  } Z99 : [  ] } {  } $Z ] )  {  } ... on Z999999  @Z9 ( Z9 : $Z9999 Z_9 : [ true null ] Z9999 : "姖\\29" Z999 : "Z9999" ) @Z999 ( Z : 0.46380479469141217 Z99 : { Z : 166956 Z9 : null } Z99999 : { Z9 : null Z_999 : [ false ] Z : null } ) @Z999 ( Z9999 : "" Z999999 : "Z999" Z99 : {  } ) @Z_99999 ( Z99 : $Z99 Z999 : 0.4802650699765724 ) @Z999 ( Z : {  } Z9 : 514626 Z99999 : 0.10744267660539722 Z999 : null )  {  } ... Z999  } ... Z9999999_  @_999999  @Z9 ( Z99999 : 0.9729139124848479 Z999999 : { Z9_99 : -631801 Z99 : [  ] Z999 : [ 0.6842147087139145 ] Z999999 : { Z9 : [  ] Z999 : { Z99 : null Z99 : "" } Z9999 : 0.5500629849499384 _99 : 0.17829077931972723 } Z999 : 0.41082164990288284 } Z99 : null ) @Z (  ) @Z999999 (  ) @Z9999999 ( Z999 : $Z999 Z : $Z9999 Z99999999 : 0.6118729406091724 Z99 : null Z : true Z : "Z999" ) @Z99 ( Z99 : "㵀ꔱ瞎뎔" Z9999999 : null )  ... Z9  @Z9  @Z99999 ( Z99999999 : null Z99 : {  } Z999 : null Z : true ) @Z9 ( Z : true Z99 : "Z" Z9999 : 0.2192597427495102 Z9 : "Z999999" Z99999999 : 428559 Z99999 : false Z : 0.8863087859406642 Z : null ) @Z999999 ( Z : [ { _99 : [  ] Z9 : null } ] ) @Z99999999  @Z9999  @Z9999 ( Z9 : [ false 0.5977931714606439 ] Z999999 : 0.8410291014430249 Z : 869668 Z : [ "㙈齆" null 0.720802083947138 { Z_9 : "Z" } [ 483499 0.31544311219614146 ] ] Z999 : 755759 Z : false Z99999 : $Z Z : "�尓෪" )  ...   @Z  @Z9 ( Z99 : null Z9999999 : {  } Z99999 : "慒╏" Z_ : "㠁䢦唕ﱗ" ) @_9999 ( Z9999 : "�ꚳⷚ" Z9999 : { Z999 : false Z999999 : null Z99 : null } ) @Z99999999 ( Z : $Z9 Z : "蚦喙脝⯞Ꟍ" Z9999999 : null Z : [ [ 0.8266237912823556 0.07284331837335756 ] true ] Z : "≴્" ) @Z99 ( Z99 : $Z Z99 : "䤷䞣" ) @Z99999999   { ...   @Z9 (  )  { ... on Z99  @Z99 ( Z9999 : "Z99" )  { ... on Z99    {  } ... on Z  {  } } ... Z    ... on Z99  @Z9999 (  ) @Z9999 ( Z9999 : -498148 Z9999 : "" Z9 : $Z9 Z99 : $Z99 )  { Z9 : Z     {  } } }  Z   @Z99999 ( Z9_ : "Z999" Z999 : 0.31384074935402756 Z9999 : false Z999 : { Z9999 : "" Z99 : true Z99 : false Z : null } Z : -390163 ) @Z9  @Z9999   { ... Z9  @Z9999 ( Z_99 : null Z999 : "鹖뇈" ) @Z9 ( Z9999 : -528751 Z99 : { Z9 : 933454 Z9 : true } )  } ... on Z999  @Z99999 ( Z99999 : "Z999" Z9999 : "㾠摙㖚" Z999999 : "᭾髜믬ࠑ" Z999999 : 0.6020648617307026 Z99 : { Z : { Z9 : true Z9 : null } Z999 : 684254 Z99 : true } Z99 : { Z999 : { Z9 : -34080 Z9 : [  ] } Z : { Z9 : true Z99 : [  ] } Z9 : [ 0.6264860819217218 ] } ) @Z (  )  {  } ... on Z9  @Z9 (  ) @Z99999 (  ) @Z (  )  { ... Z9999    ...   @Z999 ( Z9999 : "馧ꦕ" ) @Z   { ... on Z    {  } } Z99 : Z   @Z99 ( Z999_ : { Z9 : {  } Z9 : "Z" } Z : $Z ) @Z999 ( Z9999 : 0.1402587514092488 Z9999 : true Z9 : $Z99 Z99 : false ) @Z9999 ( Z9999 : $Z99 Z999 : 0.4145121771909819 ) @Z9 (  )  { Z99 : Z9 ( Z9 : $Z )    {  } ...     {  } } } ... Z9999  @Z99  @Z99 (  )  } }""" ∷
    String

testSadistic0 ∷ ∀ m. Monad m ⇒ SpecT Aff Unit m Unit
testSadistic0 =
  describe "test full query" do
    it "should parse" do
      either (\s -> fail $ "Bad :: " <> (show s)) (\_ -> 1 `shouldEqual` 1) $ runParser query GP.selectionSet

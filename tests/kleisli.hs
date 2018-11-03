import Test.HUnit
import Test.Framework
import Test.Framework.Providers.HUnit
import KleisliExample

testMaybeExample :: Assertion
testMaybeExample = map h [1, 4, 0, -1] @?= [Just 0.5, Just 0.25, Nothing, Nothing]


main :: IO ()
main = defaultMainWithOpts
       [testCase "Maybe" testMaybeExample
       ]
       mempty   

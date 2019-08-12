import Test.HUnit
import Test.Framework
import Test.Framework.Providers.HUnit
import KleisliExample
import ContravariantExample
import FactorialExample

testContravariantExample :: Assertion
testContravariantExample = map (runPredicate strgt10) ["123", "12345678901"] @?= [False, True]

testMaybeExample :: Assertion
testMaybeExample = map h [1, 4, 0, -1] @?= [Just 0.5, Just 0.25, Nothing, Nothing]

testFactorialExample :: Assertion
testFactorialExample = map f [0, 1, 10] @?= [1, 1, 3628800]


main :: IO ()
main = defaultMainWithOpts
       [testCase "Contravariant" testContravariantExample,
        testCase "Maybe" testMaybeExample,
        testCase "Factorial" testFactorialExample
       ]
       mempty   

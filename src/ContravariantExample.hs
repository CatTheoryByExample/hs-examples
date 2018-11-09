module ContravariantExample ( strgt10, runPredicate ) where

import Data.Functor.Contravariant hiding (Predicate)

newtype Predicate a = Predicate { runPredicate :: a -> Bool}

intgt10 :: Predicate Int
intgt10 = Predicate ( \i -> i > 10 )

instance Contravariant Predicate where
    contramap f (Predicate p) = Predicate ( p . f )

strgt10 :: Predicate [Char]
strgt10 = contramap length intgt10

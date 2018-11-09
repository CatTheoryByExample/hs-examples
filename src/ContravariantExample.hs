module ContravariantExample ( strgt10, runPredicate ) where

import Data.Functor.Contravariant hiding (Predicate)

newtype Predicate a = Predicate { runPredicate :: a -> Bool}

instance Contravariant Predicate where
    contramap f (Predicate p) = Predicate ( p . f )

intgt10 :: Predicate Int
intgt10 = Predicate ( \i -> i > 10 )

strgt10 :: Predicate [Char]
strgt10 = contramap length intgt10

module MonadExample ( joinHeads ) where

-- Joins heads in the list of lists
joinHeads :: [[a]] -> [a]
joinHeads ys = ys >>= \xs -> [head xs]

module BetaDiff (betaDiff) where

import Numeric.SpecFunctions (logBeta)

h :: Int -> Int -> Int -> Int -> Double
h a1 b1 a2 b2 = exp $ logBeta (fromIntegral $ a1 + a2) (fromIntegral $ b1 + b2) -
                      logBeta a1' b1' -
                      logBeta a2' b2' 
  where a1' = fromIntegral a1
        b1' = fromIntegral b1
        a2' = fromIntegral a2
        b2' = fromIntegral b2

g :: Int -> Int -> Int -> Int -> Double
g a1 b1 a2 b2
  | a1 == a2 && b1 == b2 = 0.5 
  | a1 >  a2             = f (+) (a1 - 1) b1 a2 b2 (a1 - 1)
  | a1 <  a2             = f (-) a1 b1 (a2 - 1) b2 (a2 - 1)
  |             b1 >  b2 = f (-) a1 (b1 - 1) a2 b2 (b1 - 1)
  |             b1 <  b2 = f (+) a1 b1 a2 (b2 - 1) (b2 - 1)
  | otherwise            = -1
  where
    -- This expression is shared among each 4 cases with different arguments,
    -- so I broke it out into this function "f".
    -- First arg: plus or minus function to use
    -- last argument: denominator
    f (+/-) a1 b1 a2 b2 d = g a1 b1 a2 b2 +/-
                              (h a1 b1 a2 b2 / fromIntegral d)


betaDiff :: Int -> Int -> Int -> Int -> Double
betaDiff = g

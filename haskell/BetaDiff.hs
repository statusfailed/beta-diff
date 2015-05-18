module Beta (pBetaDiff) where

import Numeric.SpecFunctions (logBeta)

h :: Int -> Int -> Int -> Int -> Double
h a1 b1 a2 b2 = exp $ logBeta (fromIntegral $ a1 + a2) (fromIntegral $ b1 + b2) -
                      logBeta a1' b1' -
                      logBeta a2' b2' 
  where a1' = fromIntegral a1
        b1' = fromIntegral b1
        a2' = fromIntegral a2
        b2' = fromIntegral b2

-- Recursive scheme from paper
g :: Int -> Int -> Int -> Int -> Double
g a1 b1 a2 b2
  | a1 == a2 && b1 == b2 = 0.5 
  | a1 >  a2             = g (a1 - 1) b1 a2 b2 + (h (a1 - 1) b1 a2 b2 / fromIntegral (a1 - 1)) 
  | a1 <  a2             = g a1 b1 (a2 - 1) b2 - (h a1 b1 (a2 - 1) b2 / fromIntegral (a2 - 1)) 
  |             b1 >  b2 = g a1 (b1 - 1) a2 b2 - (h a1 (b1 - 1) a2 b2 / fromIntegral (b1 - 1)) 
  |             b1 <  b2 = g a1 b1 a2 (b2 - 1) + (h a1 b1 a2 (b2 - 1) / fromIntegral (b2 - 1)) 
  | otherwise            = -1


pBetaDiff :: Int -> Int -> Int -> Int -> Double
pBetaDiff = g

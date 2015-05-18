# Computing exact difference in beta distributions

This repo is a ported implementation of the C code in
[this repository](https://github.com/EmanueleRaineri/methyl_diff)

The code in question computes P(θ1 > θ2), where θ1 and θ2 are
probabilities drawn from two beta distributions with parameters
a1, b1, a2, b2.

There are two implementations. One in R, and one Haskell.
Neither is in a package on CRAN/Hackage.

# Example usage

In haskell,

~~~~
import BetaDiff

-- | Print P(X > Y), where
--  X ~ Beta(1, 3)
--  Y ~ Beta(2, 2)
main = print betaDiff 1 3 2 2
~~~~

h <- function(a1, b1, a2, b2) {
  tmp <- lbeta((a1+a2),(b1+b2)) -
    lbeta(a1,b1) -
    lbeta(a2,b2);
  
  exp(tmp);
}

g <- function(a1, b1, a2, b2){
  if (a1 == a2 && b1==b2 ) {
    res <- 0.5
  } else if (a1>a2) {
    res = g( (a1-1), b1, a2, b2 ) + 
      h ((a1 - 1), b1, a2, b2) / ( a1 - 1 )
  } else if (a2>a1) {
    res =  g (a1, b1, (a2-1), b2 ) - 
      h (a1, b1, (a2-1), b2 ) /  ( a2 - 1 )
  } else if( b1 > b2 ) {
    res =  g (a1 ,(b1-1) ,a2, b2 ) - 
      h (a1 ,(b1-1) ,a2, b2) /  ( b1 - 1 )
  } else if  ( b2 > b1 ) {
    res =  g( a1, b1, a2, ( b2 - 1 ) ) + 
      h (a1, b1, a2, ( b2 - 1 ) ) /   ( b2 - 1 )
  } else {
    res <- -1
  }
  res
}

# Use this one :-)
betaDiff <- g

## Testing
  	M<-matrix(rnorm(4),2,2)
   	A<-makeCacheMatrix()
  	A$set(M)
  	Minv<-cacheSolve(A)
## Checking
      chk<-M%*%Minv
      print(M)
      print(Minv)
      print(chk)
## Checking Cache
      MinvCache<-cacheSolve(A)
      chkCache<-M%*%MinvCache
      print(M)
      print(MinvCache)
      print(chkCache)


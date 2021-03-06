#!/usr/bin/env Rscript
# Author: Basilio Cieza

##########################
## Parameters to change ##
##########################

nres <- 185
mfirst <- 7
mend <- 46
options("scipen"=100, "digits"=4)

#############################
## Eigenvectors formatting ##
#############################

tab <- as.matrix(t(read.table("eigenvector.txt",header= F, sep="")))
eigen_vectors <- matrix(c(0,0,0),ncol = 3)
i <- c(-2,-1,0)
k <- 1
while(any(i <= nrow(tab))){
  i <- i + 3
  X <- t(as.matrix(c(tab[i[1]],tab[i[2]],tab[i[3]])))
  rownames(X) <- paste('X.',k,sep='')
  k <- k + 1
  eigen_vectors <- rbind(eigen_vectors,X)
}
eigen_vectors <-round(eigen_vectors[-c(1,nrow(eigen_vectors)),],digits = 4)
nfirst <- (mfirst-1)*nres + 1
nend <- mend*nres
mod_self <- data.frame(round(eigen_vectors[nfirst:nend,1:3],digits = 4))
write.table(format(mod_self, digits=4), file= "vector.output.txt")

############################
## Eigenvalues formatting ##
############################

val <- read.table('eigenvalue.txt')
temp <- sqrt(val)
write.table(format(temp, digits=9), file= "eigenvalue.txt",col.names=FALSE,row.names=FALSE,quote=FALSE)

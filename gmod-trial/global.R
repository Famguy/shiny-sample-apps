library(GEOquery)
library(lattice)
library(pcaMethods)

# gm1 <- getGEO('GSM1570843')
# gm2 <- getGEO('GSM1570844')
# gm3 <- getGEO('GSM1570845')
pcaplot <- function (gm1, gm2){
  
  gmt1 <- Table(gm1)
  gmt2 <- Table(gm2)  
  #gmt3 <- Table(gm3)  
  
  df <- data.frame(gmt1[2],gmt2[2])#,gmt3[2])
  df$VALUE <- as.numeric(df$VALUE)
  df$VALUE.1 <- as.numeric(df$VALUE.1)
  #df$VALUE.2 <- as.numeric(df$VALUE.2)
  
  dft <- as.data.frame(t(df))
  pca <- prcomp(dft)
  pcafig <- xyplot(PC2 ~ PC1 , data=as.data.frame(pca$x))
  pcafig
}

pcatable <- function (gm1, gm2){
  
  gmt1 <- Table(gm1)
  gmt2 <- Table(gm2)  

  df <- data.frame(gmt1[1],gmt1[2],gmt2[2])
  df[1:50,]
}
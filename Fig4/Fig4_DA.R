rm(list=ls())
library(dominanceanalysis)
ssps <- c("NCS1","NCS3","NCS5")
models <- c("cnr","gfd","ips","mir","mri")
for (k in 1:3)
{
  for (j in 1:5)
  {file <- paste('tgws_rgw_ngwcs', sep = "",models[j],ssps[k])
  data1 <- read.table(file, header=FALSE)
  colnames(data1) = c('tgws','rgw','ngw')
  data11 <- data1[97:116,]
  lm.1<-lm(tgws~.,data11)
  da<-dominanceAnalysis(lm.1)
  plot(da,which.graph='complete')
  file.out <- paste('tgws_rgw_ngwcs_DA', sep = "",models[j],ssps[k])
  dd=data.frame(da$contribution.average)
  write.table(dd, file = file.out, sep = "\t")}
  print(k)
}
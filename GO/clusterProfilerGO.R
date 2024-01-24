#install.packages("colorspace")
#install.packages("stringi")
#source("http://bioconductor.org/biocLite.R")
#biocLite("DOSE")
#biocLite("clusterProfiler")
#biocLite("pathview")

setwd("C:\\Users\\liaoliao\\Desktop\\GO")
library("clusterProfiler")
library("org.Hs.eg.db")
rt=read.table("id.txt",sep="\t",header=T,check.names=F)
rt=rt[is.na(rt[,"entrezID"])==F,]

cor=rt$logFC
gene=rt$entrezID
names(cor)=gene

#GO富集分析
kk <- enrichGO(gene = gene,OrgDb = org.Hs.eg.db, pvalueCutoff =0.05, qvalueCutoff = 0.05)
write.table(kk,file="GO.txt",sep="\t",quote=F,row.names = F)

#柱状图
tiff(file="barplot.tiff",width = 35,height = 45,units ="cm",compression="lzw",bg="white",res=600)
barplot(kk, drop = TRUE, showCategory =20)
dev.off()

#点图
tiff(file="dotplot.tiff",width = 25,height = 40,units ="cm",compression="lzw",bg="white",res=600)
dotplot(kk,showCategory = 20)
dev.off()



###Video source: http://study.163.com/u/biowolf
######Video source: https://shop119322454.taobao.com
######速科生物: http://www.biowolf.cn/
######作者邮箱：2740881706@qq.com
######作者微信: seqBio
######QQ群:  259208034
install.packages("colorspace")
install.packages("stringi")
if (!requireNamespace("BiocManager", quietly = TRUE))
     install.packages("BiocManager")

BiocManager::install("clusterProfiler")
#人类注释数据库
BiocManager::install("org.Hs.eg.db")
BiocManager::install("DOSE")
BiocManager::install("pathview")

setwd("C:\\Users\\liaoliao\\Desktop\\GO")
library("clusterProfiler")
library("org.Hs.eg.db")
rt=read.table("id.txt",sep="\t",header=T,check.names=F)
rt=rt[is.na(rt[,"entrezID"])==F,]

cor=rt$logFC
gene=rt$entrezID
names(cor)=gene

#GO富集分析
kk <- enrichGO(gene = gene,OrgDb = org.Hs.eg.db, pvalueCutoff =0.05, qvalueCutoff = 0.05)
write.table(kk,file="GO.txt",sep="\t",quote=F,row.names = F)

#柱状图
tiff(file="barplot.tiff",width = 35,height = 45,units ="cm",compression="lzw",bg="white",res=600)
barplot(kk, drop = TRUE, showCategory =40)
dev.off()

#点图
tiff(file="dotplot.tiff",width = 25,height = 40,units ="cm",compression="lzw",bg="white",res=600)
dotplot(kk,showCategory = 40)
dev.off()



###Video source: http://study.163.com/u/biowolf
######Video source: https://shop119322454.taobao.com
######速科生物: http://www.biowolf.cn/
######作者邮箱：2740881706@qq.com
######作者微信: seqBio
######QQ群:  259208034
library(org.Hs.eg.db)
library(clusterProfiler)#进行GO富集和KEGG富集
library(dplyr) #进行数据转换
library(ggplot2)#绘图
#导入数据，数据为一列基因名的文件
f <- read.table("C:\\Users\\liaoliao\\Desktop\\新建文件夹\\gene.txt",header=T,sep='\t')
 
#取所需列进行后续分析
x <-f[,1]
 
#利用bitr函数进行id转换，使用bioconductor的db系列包进行
hg<-bitr(x,fromType="SYMBOL",toType=c("ENTREZID","ENSEMBL","SYMBOL"),OrgDb="org.Hs.eg.db")
 
#查看hg的信息，三列信息包括ENTREZID、ENSEMBL、SYMBOL
head(hg)

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

#GO��������
kk <- enrichGO(gene = gene,OrgDb = org.Hs.eg.db, pvalueCutoff =0.05, qvalueCutoff = 0.05)
write.table(kk,file="GO.txt",sep="\t",quote=F,row.names = F)

#��״ͼ
tiff(file="barplot.tiff",width = 35,height = 45,units ="cm",compression="lzw",bg="white",res=600)
barplot(kk, drop = TRUE, showCategory =20)
dev.off()

#��ͼ
tiff(file="dotplot.tiff",width = 25,height = 40,units ="cm",compression="lzw",bg="white",res=600)
dotplot(kk,showCategory = 20)
dev.off()



###Video source: http://study.163.com/u/biowolf
######Video source: https://shop119322454.taobao.com
######�ٿ�����: http://www.biowolf.cn/
######�������䣺2740881706@qq.com
######����΢��: seqBio
######QQȺ:  259208034
install.packages("colorspace")
install.packages("stringi")
if (!requireNamespace("BiocManager", quietly = TRUE))
     install.packages("BiocManager")

BiocManager::install("clusterProfiler")
#����ע�����ݿ�
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

#GO��������
kk <- enrichGO(gene = gene,OrgDb = org.Hs.eg.db, pvalueCutoff =0.05, qvalueCutoff = 0.05)
write.table(kk,file="GO.txt",sep="\t",quote=F,row.names = F)

#��״ͼ
tiff(file="barplot.tiff",width = 35,height = 45,units ="cm",compression="lzw",bg="white",res=600)
barplot(kk, drop = TRUE, showCategory =40)
dev.off()

#��ͼ
tiff(file="dotplot.tiff",width = 25,height = 40,units ="cm",compression="lzw",bg="white",res=600)
dotplot(kk,showCategory = 40)
dev.off()



###Video source: http://study.163.com/u/biowolf
######Video source: https://shop119322454.taobao.com
######�ٿ�����: http://www.biowolf.cn/
######�������䣺2740881706@qq.com
######����΢��: seqBio
######QQȺ:  259208034
library(org.Hs.eg.db)
library(clusterProfiler)#����GO������KEGG����
library(dplyr) #��������ת��
library(ggplot2)#��ͼ
#�������ݣ�����Ϊһ�л��������ļ�
f <- read.table("C:\\Users\\liaoliao\\Desktop\\�½��ļ���\\gene.txt",header=T,sep='\t')
 
#ȡ�����н��к�������
x <-f[,1]
 
#����bitr��������idת����ʹ��bioconductor��dbϵ�а�����
hg<-bitr(x,fromType="SYMBOL",toType=c("ENTREZID","ENSEMBL","SYMBOL"),OrgDb="org.Hs.eg.db")
 
#�鿴hg����Ϣ��������Ϣ����ENTREZID��ENSEMBL��SYMBOL
head(hg)
#install.packages("RSQLite")
#if (!requireNamespace("BiocManager", quietly = TRUE))
#    install.packages("BiocManager")
#BiocManager::install("org.Hs.eg.db", version = "3.8")

setwd("C:\\Users\\lexb4\\Desktop\\TCMSP\\12.symbol2id")

library("org.Hs.eg.db")
rt=read.table("Drug_Disease.txt",sep="\t",check.names=F,header=F)
genes=as.vector(rt[,1])
entrezIDs <- mget(genes, org.Hs.egSYMBOL2EG, ifnotfound=NA)
entrezIDs <- as.character(entrezIDs)
out=cbind(rt,1,entrezID=entrezIDs)
colnames(out)=c("symbol","logFC","entrezID")
write.table(out,file="id.txt",sep="\t",quote=F,row.names=F)



###Video source: http://study.163.com/u/biowolf
######Video source: https://shop119322454.taobao.com
######速科生物: http://www.biowolf.cn/
######作者邮箱：2740881706@qq.com
######作者微信: seqBio
######QQ群:  259208034

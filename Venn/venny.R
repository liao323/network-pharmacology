#video source: https://shop119322454.taobao.com
#install.packages("VennDiagram")

setwd("C:\\Users\\liaoliao\\Desktop\\Venn")
files=dir()
files=c("Drug.txt","Disease.txt")
targetList=list()
for(i in 1:length(files)){
    inputFile=files[i]
    rt=read.table(inputFile,header=F)
    header=unlist(strsplit(inputFile,"\\.|\\-"))
    targetList[[header[1]]]=as.vector(rt[,1])
    uniqLength=length(unique(as.vector(rt[,1])))
    print(paste(header[1],uniqLength,sep=" "))
}

library(VennDiagram)
venn.diagram(targetList,filename="venny.tiff",imagetype = "tiff",
             fill=rainbow(length(targetList)),cat.cex=1)
intersectGenes=Reduce(intersect,targetList)
write.table(file="Drug_Disease.txt",intersectGenes,sep="\t",quote=F,col.names=F,row.names=F)


###Video source: http://study.163.com/u/biowolf
######Video source: https://shop119322454.taobao.com
######速科生物: http://www.biowolf.cn/
######作者邮箱：2740881706@qq.com
######作者微信: seqBio
######QQ群:  259208034

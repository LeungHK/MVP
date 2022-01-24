setwd()

mydata <- read.csv(file = 'bestHits_bloodmeal.contigs.blastx.nr.fmt6', sep = '\t', header = FALSE)
colnames(mydata) <- c("qseqid", "sseqid", "evalue", "pident", "staxid", "ssciname",
                      "scomname", "stitle", "sskingdom", "salltitles")

mycolumn <- table(mydata$scomname)

df2 <- subset(mydata, scomname %in% names(mycolumn[mycolumn > 7]))

freqtable <- sort(table(df2$scomname), increasing=T)

xlim <- c(0, 1.25*max(freqtable))
par(mar=c(5, 15, 3, 1))
xx <- barplot(freqtable, axisnames = TRUE, horiz = TRUE, las=2, xlim= xlim, 
              col = rainbow(20))

###labels: https://stackoverflow.com/questions/12481430/how-to-display-the-frequency-at-the-top-of-each-factor-in-a-barplot-in-r
text(y = xx, x = freqtable, label = freqtable, pos = 4, cex = 0.8, col = "red")


##Get JPEG of plot
jpeg(paste0("Plot_of_bestHits_bloodmeal_batson_158_blastx_nr.fmt6.jpg"), width = 1920, height = 1080)
xlim <- c(0, 1.15*max(freqtable))
par(mar=c(10, 45, 3, 1))
xx <- barplot(freqtable, axisnames = TRUE, horiz = TRUE, las=2, xlim= xlim, 
              col = rainbow(69), cex.axis=3, cex.names=3)

###labels: https://stackoverflow.com/questions/12481430/how-to-display-the-frequency-at-the-top-of-each-factor-in-a-barplot-in-r
text(y = xx, x = freqtable, label = freqtable, pos = 4, cex = 3, col = "red")

dev.off()

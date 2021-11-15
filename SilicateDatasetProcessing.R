####Load Data####
library(readxl)
library(tidyr)
library(dplyr)
library(ggplot2)

OceanData <- read_excel("C:/Users/Micah Lessnick/Desktop/School Work/Class Work/Fall 2021/CPO/FinalProj/OceanData.xlsx",
                        col_types = c("numeric", "text"))

TampaBayData <- read_excel("C:/Users/Micah Lessnick/Desktop/School Work/Class Work/Fall 2021/CPO/FinalProj/TampaBaySi.xlsx",
                           sheet = "final data", col_types = c("numeric", "text"))

ChesapeakeBayData <- read_excel("C:/Users/Micah Lessnick/Desktop/School Work/Class Work/Fall 2021/CPO/FinalProj/WaterQualityWaterQualityHUC8Chesapeake.xlsx", 
                                sheet = "Final data", col_types = c("numeric", "text"))

####Convert data to DF####
oceanDf <- as.data.frame(OceanData)
tampaDf <- as.data.frame(TampaBayData)
chesapeakeDf <- as.data.frame(ChesapeakeBayData)

#change df column names to match
colnames(oceanDf) <- c('Si', 'Class')
colnames(tampaDf) <- c('Si', 'Class')
colnames(chesapeakeDf) <- c('Si', 'Class')

####Combine data by columns into a single DF####
fullDataset <- rbind(oceanDf, tampaDf, chesapeakeDf)

####Export as csv####
write.csv(fullDataset, "C:\\Users\\Micah Lessnick\\Desktop\\School Work\\Class Work\\Fall 2021\\CPO\\FinalProj\\SiDataFull.csv", row.names = FALSE)

####Data visualization####
set.seed(17)
sampleSi <- slice_sample(fullDataset, n = 1000)
ggplot(sampleSi, aes(x = Si, y = Class, color = Class)) +
  geom_point()

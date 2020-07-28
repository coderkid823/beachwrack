#R Code?


wrackData <- read.csv(file.choose())
head(wrackData)
ls(wrackData)

library(ggplot2)
library(viridis)
###################
# GGPLOT SCRIPT


g <- ggplot(wrackData, aes(x=YEAR, y=BIOMASS)) + geom_point() + geom_smooth(method="lm")
plot(g)
g + ggtitle("Year x Biomass", subtitle="Using ggplot2") + xlab("YEAR") + ylab("BIOMASS")
#How to compare a character and numeric?


head(wrackData)
ls(wrackData)
ggplot(wrackData, aes(YEAR, SITE))+
  geom_point(aes(color = SITE)) +
 # geom_smooth(aes(color = TAXON_SPECIES, fill = TAXON_SPECIES), method = "lm") + 
  scale_color_viridis(discrete = TRUE, option = "D")+
  scale_fill_viridis(discrete = TRUE) +
  ggtitle("Year x SITE", subtitle="With the \"VIRIDIS\" package")


######
wrackType <- ggplot(data=wrackData, aes(x=factor(wrackData$TYPE)))
wrackType

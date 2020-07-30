library(qwraps2)
library(magrittr)
library(dplyr)
library(rlang)
library(knitr)
install.packages("knitr")


#Some of these packages are unnecessary, but I downloaded them from a whole bunch of tutorials I used.


#wrackData is just what I called it.
wrackData <- read.csv(file.choose())
head(wrackData)

```{r, results='asis'}

options(qwraps2_markup = 'latex')
mySummary <-
  list("Biomass" = 
         list("min" = ~ min(.data$BIOMASS),
              "max" = ~ max(.data$BIOMASS),
              "mean (sd)" = ~ qwraps2::mean_sd(.data$BIOMASS)),
       "Cover" =
         list("min" = ~ min(.data$COVER),
              "max" = ~ max(.data$COVER),
              "mean (sd)" = ~ qwraps2::mean_sd(.data$COVER)))
summary_table(wrackData, mySummary)

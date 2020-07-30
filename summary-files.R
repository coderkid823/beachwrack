library(qwraps2)
library(magrittr)
library(dplyr)
library(rlang)
library(knitr)
install.packages("knitr")

# No, not all these packages are needed

wrackData <- read.csv(file.choose())
head(wrackData)


options(qwraps2_markup = 'latex')
options(qwraps2_markup = 'markdown')
# The default is latex


mySummary <-
  list("Biomass" = 
         list("min" = ~ min(.data$BIOMASS),
              "max" = ~ max(.data$BIOMASS),
              "mean (sd)" = ~ qwraps2::mean_sd(.data$BIOMASS)),
       "Cover" =
         list("min" = ~ min(.data$COVER),
              "max" = ~ max(.data$COVER),
              "mean (sd)" = ~ qwraps2::mean_sd(.data$COVER)),
       "Description" = 
         list("animal (pct)" = ~ qwraps2::n_perc0(.data$TAXON_GROUP == 'ANIMAL'),
              "algae (pct)" = ~ qwraps2::n_perc0(.data$TAXON_GROUP == 'ALGAE'),
              "plant (pct)" = ~ qwraps2::n_perc0(.data$TAXON_GROUP == 'PLANT'),
              "substrate (pct)" = ~ qwraps2::n_perc0(.data$TAXON_GROUP == 'SUBSTRATE'),
              "other (pct)" = ~ qwraps2::n_perc0(.data$TAXON_GROUP == 'OTHER')))

summary_table(wrackData, mySummary)

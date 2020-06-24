my_fullname <- "Abdusalyamov Shokhrukh"
my_std_no <- 18012762


library(treemap)
data("GNI2014")
View(GNI2014)
nrow(GNI2014)
continents <- GNI2014$continent
head(continents)
length(unique(continents))

# (Problem1-1)
# Filter the data set for countries in Asia

GNI2014_Asia <- GNI2014[GNI2014$continent == "Asia", ]

#(Problem1-2) Arrange the Asia countries by GNI

GNI2014_Asia <- GNI2014_Asia[order(GNI2014_Asia$GNI), ]

# (Problem1-3)
# Mutate the GNI per capita data frame to add a column 'GNI_capita'.  
# The GNI per capita is the dollar value of a country's final income in a year, 
# divided by its population

GNI2014_Asia$GNI_capita <- GNI2014_Asia$GNI

GNI2014_Asia$GNI <- (GNI2014_Asia$population * GNI2014_Asia$GNI)

GNI2014_Europ_2000 <- GNI2014[GNI2014$continent == "Europe" & GNI2014$GNI > 2000, ]

smallest_population <- GNI2014_Europ_2000$iso3[GNI2014_Europ_2000$population == min(GNI2014_Europ_2000$population)]


# Part 3
#
# 2010~2016 Korea(ROK) Tourism Receipts_Expenditures

library(dplyr)

setwd("sources")

tbl1 <- read.csv("2010-16-Table.csv", header = T)

head(tbl1)
colnames(tbl1)

# Plot line graph with different colors.

Tourism_Receipts_2011 <- tbl1 %>% 
  filter(YEAR==2011) %>% 
  select(YEAR, TOURISM.RECEIPTS)

Tourism_Receipts_2016 <- tbl1 %>% 
  filter(YEAR==2016) %>% 
  select(YEAR, TOURISM.RECEIPTS)


month = 1:12
tr_2011 <- Tourism_Receipts_2011$TOURISM.RECEIPTS
tr_2016 <- Tourism_Receipts_2016$TOURISM.RECEIPTS

plot(month,                                # x data
     tr_2016,                                # y data
     main="Tourism Receipts",
     type= "b",                            # Type of a graph 
     lty=1,                                # Type of a line
     col="red",                            # line color          
     xlab="Month ",                        # x axis
     ylab="Receipts",                      # y axis
     ylim=c(650, 1800)                         # y values(min, max)
)
lines(month,                               # x data
      tr_2011,                               # y data
      type = "b",                          # line type
      col = "blue")                        # line color

# Plot line graph with different colors by using 'ggplot2' and 'dplyr'.
# Libraries
library(ggplot2)
library(babynames) # provide the dataset: a dataframe called babynames
library(dplyr)

colnames(babynames)
?babynames

# Keep only 3 names

don2 <- tbl1 %>%
  filter(YEAR %in% c(2011, 2016)) 

# Plot
don2 %>%
  ggplot(aes(x=MONTH, y=TOURISM.RECEIPTS, group=YEAR, color=blue)) +
  geom_line()

# Part 5
#

# Answer the following questions.
# 1. List the three main sections of an R Markdown.

cat("The three main sections are ")

cat ("The three main section are metadata, text, and code")

# 2. In an R Markdown, how will commonly we execute R code inline with the rest of text?
# 'r your_R_code', a single backtick(')


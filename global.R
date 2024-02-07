library(shiny)
library(readxl)
library(tidyverse)
library(plotly)
library(RColorBrewer)
library(shinydashboard)
library(shinythemes)
library(shinyWidgets)
library(scales)

source("Pages/Page1.R")
source("Pages/Page2.R")
source("Pages/Page3.R")
source("Pages/Page4.R")
source("Pages/Page5.R")
source("Pages/Page6.R")
source("Pages/Page7.R")
source("Pages/Page8.R")

##### Data
PopulationinbroadAgeGroups <- read.csv("data/PopulationinbroadAgeGroups.csv")
names(PopulationinbroadAgeGroups) = c("nationality","broad_age_groups","age_groups","region","gender","population")

Population <- read.csv("data/Population2010-2022.csv")
names(Population) = c("nationality","year","region","gender","population")

SaudiLifeExpectancy <- read.csv("data/SaudiLifeExpectancy2010-2022.csv")
names(SaudiLifeExpectancy) = c("year","gender","average")
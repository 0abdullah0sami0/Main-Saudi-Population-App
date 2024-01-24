library(shiny)
library(readxl)
library(tidyverse)
library(plotly)
library(RColorBrewer)
library(shinydashboard)
library(shinythemes)
library(shinyWidgets)
library(scales)

##### Data for page 1
PopulationinbroadAgeGroups <- read.csv("data/PopulationinbroadAgeGroups.csv")
names(PopulationinbroadAgeGroups) = c("nationality","broad_age_groups","age_groups","region","gender","population")

##### Data for page 2
Population <- read.csv("data/Population2010-2022.csv")
names(Population) = c("nationality","year","region","gender","population")
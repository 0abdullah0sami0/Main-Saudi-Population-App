dashboardPage(
  dashboardHeader(disable=T),
  dashboardSidebar(disable=F, width = 270,
                   sidebarMenu(
                     menuItem("Population by Age Groups",tabName = "agegroups"),
                     menuItem("Population by Nationality", tabName = "nationality"),
                     menuItem("Population by Gender", tabName = "gender"),
                     menuItem("Population by Gender and Nationality", tabName = "genderNationality"),
                     menuItem("Population by Region", tabName = "region"),
                     menuItem("Population by Age Groups and Gender", tabName = "ageGroups"),
                     menuItem("Population by Age Groups and nationality", tabName = "agegroupsNationality"),
                     menuItem("Life Expectancy by Years", tabName = "lifeExpectancy")
                   )),
  
  dashboardBody(
    setBackgroundColor(color = "#FFFFFF", shinydashboard = TRUE),
    tags$head(
      tags$link(rel = "shortcut icon", href = "Good-logo.ico")
    ),
    tabItems(
      
      ######################################## tabItem 1 ##############################
      
      tabItem(tabName = "agegroups", Page1),
      
      ######################################## tabItem 2 ##############################
      
      tabItem(tabName = "nationality", Page2),
      
      ######################################## tabItem 3 ##############################
      
      tabItem(tabName = "gender", Page3),
      
      ######################################## tabItem 4 ##############################
      
      tabItem(tabName = "genderNationality", Page4),
      
      ######################################## tabItem 5 ##############################
      
      tabItem(tabName = "region", Page5),
      
      ######################################## tabItem 6 ##############################
      
      tabItem(tabName = "ageGroups", Page6),
      
      ######################################## tabItem 7 ##############################
      
      tabItem(tabName = "agegroupsNationality", Page7),
      
      ######################################## tabItem 8 ##############################
      
      tabItem(tabName = "lifeExpectancy", Page8)
    ),
    
     ######################################## logos ##############################
    fluidRow(
      column(width = 1,align = "right", offset = 4,
             tags$a(img(src = "GitHub.png",style = "width:30%;height:30%;"),href = "https://github.com/0abdullah0sami0", target="_blank")),
      column(width = 1,align = "center", offset = 0,
             tags$a(img(src = "LinkedIn.png",style = "width:30%;height:30%;"),href = "https://www.linkedin.com/in/abdullahalshalaan/", target="_blank")),
      column(width = 1,align = "left", offset = 0,
             tags$a(img(src = "twittter.jpeg",style = "width:30%;height:30%;"),href = "https://twitter.com/HR02030", target="_blank"))
    )
    )
  )


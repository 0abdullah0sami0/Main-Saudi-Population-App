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
                     menuItem("Population by Age Groups and nationality", tabName = "agegroupsNationality")
                   )),
  
  dashboardBody(
    setBackgroundColor(color = "#FFFFFF", shinydashboard = TRUE),
    tags$head(
      tags$link(rel = "shortcut icon", href = "Good-logo.ico")
    ),
    tabItems(
      
      ######################################## tabItem 1 ##############################
      tabItem(tabName = "agegroups",
              navbarPage(title=div(img(src="Good logo.png", style="width:8%;height:10%; position:relative;display:right-align;margin-top:-10px;")),
                         theme = shinytheme("lumen"),
                         windowTitle = "Saudi Arabia Population",
                         tabPanel("عربي",
                                  fluidRow(
                                    column(width = 8, align = "center", offset = 2 , plotlyOutput("plot1"))),
                                  br(),
                                  fluidRow(
                                    column(width = 12, align = "center",
                                           p("يتضح من الرسم البياني أن السكان في سن العمل من عمر ٢٥ إلى ٥٤ سنة يشكلون أعلى نسبة سكان في الممكلة العربية السعودية ثم يليهم فئة الأطفال من عمر ١٤ سنة وأقل
"))
                                  ),
                                  hr(),
                                  fluidRow(column(width = 2,align = "right", offset = 10,
                                                  tags$a(img(src = "website.png",style = "width:85%;height:85%;"),href = "https://portal.saudicensus.sa/portal", target="_blank"),
                                                  p("يهدف التعداد إلى توفير إحصاءات كاملة ودقيقة عن السكان علاوة على معلومات عن المساكن في جميع مناطق المملكة العربية السعودية والفئات الفرعية للسكان
",style = "text-align: justify;direction:rtl;")))
                         ),
                         tabPanel("English",
                                  fluidRow(
                                    column(width = 8, align = "center", offset = 2 , plotlyOutput("plot2"))),
                                  br(),
                                  fluidRow(
                                    column(width = 12, align = "center",
                                           p("The Working-Age population aged between 25 and 54 is the highest in Saudi Arabia, followed by children aged 14 and less."))
                                  ),
                                  hr(),
                                  fluidRow(column(width = 2,
                                                  tags$a(img(src = "website.png",style = "width:85%;height:85%;"),href = "https://portal.saudicensus.sa/portal", target="_blank"),
                                                  p("A comprehensive census is designed to provide a complete and accurate count of the population along with information on housing, across all locations in the Kingdom and sub-groups of the population.
",style = "text-align: justify;")))
                         ),
              )),
      
      ######################################## tabItem 2 ##############################
      tabItem(
        tabName = "nationality",
        navbarPage(title=div(img(src="Good logo.png", style="width:8%;height:10%; position:relative;display:right-align;margin-top:-10px;")),
                   theme = shinytheme("lumen"),
                   windowTitle = "Saudi Arabia Population",
                   tabPanel("عربي",
                            fluidRow(
                              column(width = 8, align = "center", offset = 2 , plotlyOutput("plot3"))),
                            fluidRow(
                              column(width = 12, align = "center",
                                     p("من عام 2010 حتى 2022  كان متوسط  نمو السعوديين 2.46% بينما كان نمو غير السعوديين 2.73% والله الموفق"))
                            ),
                            hr(),
                            fluidRow(column(width = 2,align = "right", offset = 10,
                                            tags$a(img(src = "website.png",style = "width:85%;height:85%;"),href = "https://portal.saudicensus.sa/portal", target="_blank"),
                                            p("يهدف التعداد إلى توفير إحصاءات كاملة ودقيقة عن السكان علاوة على معلومات عن المساكن في جميع مناطق المملكة العربية السعودية والفئات الفرعية للسكان
",style = "text-align: justify;direction:rtl;")))
                   ),
                   tabPanel("English",
                            fluidRow(
                              column(width = 8, align = "center", offset = 2 , plotlyOutput("plot4"))),
                            fluidRow(
                              column(width = 12, align = "center",
                                     p("Between 2010 and 2022, the average annual growth of Saoudi population in Saoudi Arabia was 2.46%, while the average annual growth of Non-Saoudi population in Saoudi Arabia was 2.73%."))
                            ),
                            hr(),
                            fluidRow(column(width = 2,
                                            tags$a(img(src = "website.png",style = "width:85%;height:85%;"),href = "https://portal.saudicensus.sa/portal", target="_blank"),
                                            p("A comprehensive census is designed to provide a complete and accurate count of the population along with information on housing, across all locations in the Kingdom and sub-groups of the population.
",style = "text-align: justify;")))
                   )
        )
      ),
      ######################################## tabItem 3 ##############################
      tabItem(
        tabName = "gender",
        navbarPage(title=div(img(src="Good logo.png", style="width:8%;height:10%; position:relative;display:right-align;margin-top:-10px;")),
                   theme = shinytheme("lumen"),
                   windowTitle = "Saudi Arabia Population",
                   tabPanel("عربي",
                            fluidRow(
                              column(width = 8, align = "center", offset = 2 , plotlyOutput("plot5"))),
                            br(),
                            fluidRow(
                              column(width = 12, align = "center",
                                     p("من عام 2010 حتى 2022 كان متوسط نمو الذكور 2.82% بينما كان نمو الإناث 2.10% والله الموفق"))
                            ),
                            hr(),
                            fluidRow(column(width = 2,align = "right", offset = 10,
                                            tags$a(img(src = "website.png",style = "width:85%;height:85%;"),href = "https://portal.saudicensus.sa/portal", target="_blank"),
                                            p("يهدف التعداد إلى توفير إحصاءات كاملة ودقيقة عن السكان علاوة على معلومات عن المساكن في جميع مناطق المملكة العربية السعودية والفئات الفرعية للسكان
",style = "text-align: justify;direction:rtl;")))
                   ),
                   tabPanel("English",
                            fluidRow(
                              column(width = 8, align = "center", offset = 2 , plotlyOutput("plot6"))),
                            br(),
                            fluidRow(
                              column(width = 12, align = "center",
                                     p("Between 2010 and 2022, the average annual growth of males in Saoudi Arabia was 2.82%, while the average annual growth of females was 2.10%."))
                            ),
                            hr(),
                            fluidRow(column(width = 2,
                                            tags$a(img(src = "website.png",style = "width:85%;height:85%;"),href = "https://portal.saudicensus.sa/portal", target="_blank"),
                                            p("A comprehensive census is designed to provide a complete and accurate count of the population along with information on housing, across all locations in the Kingdom and sub-groups of the population.
",style = "text-align: justify;")))
                   )
        )
      ),
      ######################################## tabItem 4 ##############################
      tabItem(
        tabName = "genderNationality",
        navbarPage(title=div(img(src="Good logo.png", style="width:8%;height:10%; position:relative;display:right-align;margin-top:-10px;")),
                   theme = shinytheme("lumen"),
                   windowTitle = "Saudi Arabia Population",
                   tabPanel("عربي",
                            fluidRow(
                              column(width = 8, align = "center", offset = 2 , plotlyOutput("plot7"))),
                            br(),
                            fluidRow(
                              column(width = 12, align = "center",
                                     p("من عام 2010 حتى 2022 كان عدد الذكور الغير سعوديين هو الأعلى ثم يليه عدد الذكور والإناث السعوديين على حد سواء وفي المرتبة الثالثة الإناث غير السعوديات"))
                            ),
                            hr(),
                            fluidRow(column(width = 2,align = "right", offset = 10,
                                            tags$a(img(src = "website.png",style = "width:85%;height:85%;"),href = "https://portal.saudicensus.sa/portal", target="_blank"),
                                            p("يهدف التعداد إلى توفير إحصاءات كاملة ودقيقة عن السكان علاوة على معلومات عن المساكن في جميع مناطق المملكة العربية السعودية والفئات الفرعية للسكان
",style = "text-align: justify;direction:rtl;")))
                   ),
                   tabPanel("English",
                            fluidRow(
                              column(width = 8, align = "center", offset = 2 , plotlyOutput("plot8"))),
                            br(),
                            fluidRow(
                              column(width = 12, align = "center",
                                     p("Between 2020 and 2022, the number of non-Saoudi males was the largest, followed by the number of Saoudi males and females, and lastly the number of non-Saoudi females."))
                            ),
                            hr(),
                            fluidRow(column(width = 2,
                                            tags$a(img(src = "website.png",style = "width:85%;height:85%;"),href = "https://portal.saudicensus.sa/portal", target="_blank"),
                                            p("A comprehensive census is designed to provide a complete and accurate count of the population along with information on housing, across all locations in the Kingdom and sub-groups of the population.
",style = "text-align: justify;")))
                   )
        )
      ),
      
      ######################################## tabItem 5 ##############################
      tabItem(
        tabName = "region",
        navbarPage(title=div(img(src="Good logo.png", style="width:8%;height:10%; position:relative;display:right-align;margin-top:-10px;")),
                   theme = shinytheme("lumen"),
                   windowTitle = "Saudi Arabia Population",
                   tabPanel("عربي",
                            fluidRow(
                              column(width = 8, align = "center", offset = 2 , plotlyOutput("plot9"))),
                            br(),
                            fluidRow(
                              column(width = 12, align = "center",
                                     p("من عام 2010 حتى 2022 كان عدد سكان المناطق الرئيسية (الرياض - مكة المكرمة - المنطقة الشرقية) هو الأعلى بشكل ملحوظ بالنسبة للمناطق الأخرى، ثم تليها (المدينة المنورة - عسير - جازان  - القصيم) حيث كان عدد سكانها يتأرجح بين المليون والمليونين، ثم تليها بقية المناطق التي لم يتجاوز عدد سكانها المليون
"))
                            ),
                            hr(),
                            fluidRow(column(width = 2,align = "right", offset = 10,
                                            tags$a(img(src = "website.png",style = "width:85%;height:85%;"),href = "https://portal.saudicensus.sa/portal", target="_blank"),
                                            p("يهدف التعداد إلى توفير إحصاءات كاملة ودقيقة عن السكان علاوة على معلومات عن المساكن في جميع مناطق المملكة العربية السعودية والفئات الفرعية للسكان
",style = "text-align: justify;direction:rtl;")))
                   ),
                   tabPanel("English",
                            fluidRow(
                              column(width = 8, align = "center", offset = 2 , plotlyOutput("plot10"))),
                            br(),
                            fluidRow(
                              column(width = 12, align = "center",
                                     p("Between 2010 and 2022, the population of the main regions of Saoudi Arabia (Riyadh - Makkah - Eastern Province) was the largest compared to the other regions, followed by the population of the regions (AL Madinah AL Munawwarah - Asir - Jazan - Al-Qassim) which was fluctuating between 1 million and 2 million people. Lastly the remaining regions’ population didn’t go above 1 million people during this period."))
                            ),
                            hr(),
                            fluidRow(column(width = 2,
                                            tags$a(img(src = "website.png",style = "width:85%;height:85%;"),href = "https://portal.saudicensus.sa/portal", target="_blank"),
                                            p("A comprehensive census is designed to provide a complete and accurate count of the population along with information on housing, across all locations in the Kingdom and sub-groups of the population.
",style = "text-align: justify;")))
                   )
        )
      ),
      ######################################## tabItem 6 ##############################
      tabItem(
        tabName = "ageGroups",
        navbarPage(title=div(img(src="Good logo.png", style="width:8%;height:10%; position:relative;display:right-align;margin-top:-10px;")),
                   theme = shinytheme("lumen"),
                   windowTitle = "Saudi Arabia Population",
                   tabPanel("عربي",
                            fluidRow(
                              column(width = 8, align = "center", offset = 2 , plotlyOutput("plot11"))),
                            br(),
                            fluidRow(
                              column(width = 12, align = "center",
                                     p("يتضح من الرسم البياني أن السكان في سن العمل من عمر ٢٥ إلى ٥٤ سنة يشكلون أعلى نسبة سكان في الممكلة العربية السعودية ثم يليهم فئة الأطفال من عمر ١٤ سنة وأقل
"))
                            ),
                            hr(),
                            fluidRow(column(width = 2,align = "right", offset = 10,
                                            tags$a(img(src = "website.png",style = "width:85%;height:85%;"),href = "https://portal.saudicensus.sa/portal", target="_blank"),
                                            p("يهدف التعداد إلى توفير إحصاءات كاملة ودقيقة عن السكان علاوة على معلومات عن المساكن في جميع مناطق المملكة العربية السعودية والفئات الفرعية للسكان
",style = "text-align: justify;direction:rtl;")))
                   ),
                   tabPanel("English",
                            fluidRow(
                              column(width = 8, align = "center", offset = 2 , plotlyOutput("plot12"))),
                            br(),
                            fluidRow(
                              column(width = 12, align = "center",
                                     p("The males of the working-age group, aged between 25 and 54, make up the largest segment of the Saudi Arabian population. Followed by females of the same age group, and followed by children aged 14 and under."))
                            ),
                            hr(),
                            fluidRow(column(width = 2,
                                            tags$a(img(src = "website.png",style = "width:85%;height:85%;"),href = "https://portal.saudicensus.sa/portal", target="_blank"),
                                            p("A comprehensive census is designed to provide a complete and accurate count of the population along with information on housing, across all locations in the Kingdom and sub-groups of the population.
",style = "text-align: justify;")))
                   )
        )
      ),
      
      ######################################## tabItem 7 ##############################
      tabItem(
        tabName = "agegroupsNationality",
        navbarPage(title=div(img(src="Good logo.png", style="width:8%;height:10%; position:relative;display:right-align;margin-top:-10px;")),
                   theme = shinytheme("lumen"),
                   windowTitle = "Saudi Arabia Population",
                   tabPanel("عربي",
                            fluidRow(
                              column(width = 8, align = "center", offset = 2 , plotlyOutput("plot13"))),
                            br(),
                            fluidRow(
                              column(width = 12, align = "center",
                                     p("يتضح من الرسم البياني أن عدد غير السعوديين من عمر ٢٥ إلى ٥٤ سنة يشكلون أعلى نسبة سكان في الممكلة العربية السعودية ثم يليهم السعوديون من نفس الفئة العمرية ثم السعوديون من فئة الأطفال من عمر ١٤ سنة فأقل
"))
                            ),
                            hr(),
                            fluidRow(column(width = 2,align = "right", offset = 10,
                                            tags$a(img(src = "website.png",style = "width:85%;height:85%;"),href = "https://portal.saudicensus.sa/portal", target="_blank"),
                                            p("يهدف التعداد إلى توفير إحصاءات كاملة ودقيقة عن السكان علاوة على معلومات عن المساكن في جميع مناطق المملكة العربية السعودية والفئات الفرعية للسكان
",style = "text-align: justify;direction:rtl;")))
                   ),
                   tabPanel("English",
                            fluidRow(
                              column(width = 8, align = "center", offset = 2 , plotlyOutput("plot14"))),
                            br(),
                            fluidRow(
                              column(width = 12, align = "center",
                                     p("The Non-Saudis of the working-age group, aged between 25 and 54, make up the largest segment of the Saudi Arabian population. Followed by Saudis of the same age group, and followed by Saudis aged 14 and under."))
                            ),
                            hr(),
                            fluidRow(column(width = 2,
                                            tags$a(img(src = "website.png",style = "width:85%;height:85%;"),href = "https://portal.saudicensus.sa/portal", target="_blank"),
                                            p("A comprehensive census is designed to provide a complete and accurate count of the population along with information on housing, across all locations in the Kingdom and sub-groups of the population.
",style = "text-align: justify;")))
                   )
        )
      )
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


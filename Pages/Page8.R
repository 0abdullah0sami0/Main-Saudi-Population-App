# Page8

Page8 <- navbarPage(title=div(img(src="Good logo.png", style="width:8%;height:10%; position:relative;display:right-align;margin-top:-10px;")),
           theme = shinytheme("lumen"),
           windowTitle = "Saudi Arabia Population",
           tabPanel("عربي",
                    fluidRow(
                      column(width = 8, align = "center", offset = 2 , plotlyOutput("plot15"))),
                    br(),
                    fluidRow(
                      column(width = 12, align = "center",
                             p("أمد حياة الإناث أعلى من أمد حياة الذكور بمتوسط 5 سنوات تقريبا كما يلاحظ أن أمد حياة السكان بشكل إجمالي شهد انخفاضا مفاجا بين 2020 و 2021"))
                    ),
                    hr(),
                    fluidRow(column(width = 2,align = "right", offset = 10,
                                    tags$a(img(src = "website.png",style = "width:85%;height:85%;"),href = "https://portal.saudicensus.sa/portal", target="_blank"),
                                    p("يهدف التعداد إلى توفير إحصاءات كاملة ودقيقة عن السكان علاوة على معلومات عن المساكن في جميع مناطق المملكة العربية السعودية والفئات الفرعية للسكان
",style = "text-align: justify;direction:rtl;")))
           ),
           tabPanel("English",
                    fluidRow(
                      column(width = 8, align = "center", offset = 2 , plotlyOutput("plot16"))),
                    br(),
                    fluidRow(
                      column(width = 12, align = "center",
                             p("Females in Saudi Arabia have a life expectancy that is around 5 years higher than that of males on average. It is also noted that between 2020 and 2021, there was a sudden decrease in population life expectancy."))
                    ),
                    hr(),
                    fluidRow(column(width = 2,
                                    tags$a(img(src = "website.png",style = "width:85%;height:85%;"),href = "https://portal.saudicensus.sa/portal", target="_blank"),
                                    p("A comprehensive census is designed to provide a complete and accurate count of the population along with information on housing, across all locations in the Kingdom and sub-groups of the population.
",style = "text-align: justify;")))
           )
)

Plotpage8 <- function(){
  Plot <- SaudiLifeExpectancy %>%
    mutate(year = as.Date(paste0("01-01-",year),format = "%d-%m-%Y")) %>%
    rename(`Life Expectancy` = average) %>%
    
    ggplot(aes(x = year, y = `Life Expectancy`, color = gender)) +
    geom_line()+
    xlab("Year") +
    ylab("Life Expectancy (in years)") +
    theme_classic() +
    scale_x_date(date_breaks = "1 year",date_labels = "%Y") +
    theme(plot.margin = margin(0.8,0.5,0.5,0.5,"cm"),plot.title = element_text(size = 12)) +
    geom_point() +
    scale_color_manual(name = "Gender", values = c("#03045e","#0077b6","#00b4d8","#90e0ef"))
  
  ggplotly(Plot,tooltip = c("x", "y")) %>%
    layout(title = list(text = paste0("Life Expectancy of Saudi Population Between 2011 and 2022",
                                      '<br>',
                                      '<sup>',
                                      'Source: portal.saudicensus.sa','</sup>')))
}

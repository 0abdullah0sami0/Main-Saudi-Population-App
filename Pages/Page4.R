# Page4

Page4 <- navbarPage(title=div(img(src="Good logo.png", style="width:8%;height:10%; position:relative;display:right-align;margin-top:-10px;")),
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

Plotpage4 <- function(){
  Plot = Population %>% 
    mutate(year = as.Date(paste0("01-01-",year),format = "%d-%m-%Y"),
           `Gender nationality` = paste0(gender," ",nationality)) %>%
    group_by(year,`Gender nationality`) %>% 
    summarise(Population = sum(population)) %>%
    
    ggplot(aes(x = year, y = Population , color = `Gender nationality`)) +
    geom_point(aes(text = format(year,"%Y"))) +
    geom_line() +
    xlab("Year") +
    ylab("Population (in Millions)") +
    scale_color_manual(name = "Gender nationality", values = c("#03045e","#0077b6","#00b4d8","#90e0ef")) +
    theme_classic() +
    scale_y_continuous(labels = label_number(suffix = " M", scale = 1e-6)) +
    scale_x_date(date_breaks = "1 year",date_labels = "%Y") +
    theme(plot.margin = margin(3.5,0.5,0.5,0.5,"cm"),plot.title = element_text(size = 12))
  
  ggplotly(Plot,tooltip = c("text", "y","Gender nationality")) %>%
    layout(title = list(text = paste0("Evolution of Saudi Arabia's population by Gender \n and Nationality between 2010 and 2022",
                                      '<br>',
                                      '<sup>',
                                      'Source: portal.saudicensus.sa','</sup>')))
}
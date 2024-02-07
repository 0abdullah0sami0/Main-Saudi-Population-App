# Page3

Page3 <- navbarPage(title=div(img(src="Good logo.png", style="width:8%;height:10%; position:relative;display:right-align;margin-top:-10px;")),
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


Plotpage3 <- function(){
  Plot = Population %>% 
    mutate(year = as.Date(paste0("01-01-",year),format = "%d-%m-%Y")) %>%
    group_by(year,gender) %>% 
    summarise(Population = sum(population)) %>%
    
    ggplot(aes(x = year, y = Population , color = gender)) +
    geom_point(aes(text = format(year,"%Y"))) +
    geom_line() +
    xlab("Year") +
    ylab("Population (in Millions)") +
    theme_classic() +
    scale_y_continuous(labels = label_number(suffix = " M", scale = 1e-6)) +
    scale_x_date(date_breaks = "1 year",date_labels = "%Y") +
    theme(plot.margin = margin(3,0.5,0.5,0.5,"cm"),plot.title = element_text(size = 12)) +
    scale_color_manual(name = "Gender", values = c("#03045e","#0077b6","#00b4d8","#90e0ef"))
  
  ggplotly(Plot,tooltip = c("text", "y")) %>%
    layout(title = list(text = paste0("Evolution of Saudi Arabia's population by Gender \n between 2010 and 2022",
                                      '<br>',
                                      '<sup>',
                                      'Source: portal.saudicensus.sa','</sup>')))
}
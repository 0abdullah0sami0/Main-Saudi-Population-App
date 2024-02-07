# Page2

Page2 <- navbarPage(title=div(img(src="Good logo.png", style="width:8%;height:10%; position:relative;display:right-align;margin-top:-10px;")),
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

Plotpage2 <- function(){
  Plot <- Population %>%
    mutate(year = as.Date(paste0("01-01-",year),format = "%d-%m-%Y")) %>%
    group_by(year,nationality) %>%
    summarise(Population = sum(population)) %>%
    ggplot(aes(x = year, y = Population , color = nationality)) +
    geom_line() +
    geom_point() +
    xlab("Year") +
    ylab("Population (in Millions)") +
    theme_classic() +
    scale_y_continuous(labels = label_number(suffix = " M", scale = 1e-6)) +
    scale_x_date(date_breaks = "1 year",date_labels = "%Y") +
    geom_hline(yintercept = 13500000, linetype = "dashed", color = "darkgreen") +
    geom_hline(yintercept = 12500000, linetype = "dashed", color = "red") +
    theme(plot.margin = margin(1,1,1,1,"cm"),plot.title = element_text(size = 12)) +
    scale_color_manual(name = "Nationality", values = c("#03045e","#0077b6","#00b4d8","#90e0ef"))
  
  
  ggplotly(Plot,tooltip = c("x", "y")) %>%
    layout(title = list(text = paste0("Evolution of Saudi Arabia's population by Nationality \n between 2010 and 2022",
                                      '<br>',
                                      '<sup>',
                                      'Source: portal.saudicensus.sa','</sup>')))
}
# Page5

Page5 <- navbarPage(title=div(img(src="Good logo.png", style="width:8%;height:10%; position:relative;display:right-align;margin-top:-10px;")),
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

Plotpage5 <- function(){
  Plot <- Population %>% 
    mutate(year = as.Date(paste0("01-01-",year),format = "%d-%m-%Y")) %>%
    group_by(year,region) %>%
    summarise(Population = sum(population)) %>%
    
    ggplot(aes(x = year, y = Population , color = region)) +
    geom_line() +
    geom_point(aes(text = format(year,"%Y"))) +
    xlab("Year") +
    ylab("Population (in Millions)") +
    scale_color_manual(values = c("#cad2c5","#84a98c","#52796f","#03045e","#9b2226","#bb3e03","#0077b6","#354f52","#ca6702","#2f3e46","#ee9b00","#00b4d8","#2b2d42")) +
    theme_classic() +
    scale_y_continuous(labels = label_number(suffix = " M", scale = 1e-6)) +
    scale_x_date(date_breaks = "1 year",date_labels = "%Y") +
    theme(plot.margin = margin(2,0.5,0.5,0.5,"cm"),plot.title = element_text(size = 12), legend.position = "none")
  
  ggplotly(Plot,tooltip = c("text", "y","color")) %>%
    layout(title = list(text = paste0("Evolution of Saudi Arabia's population by Region \n between 2010 and 2022",
                                      '<br>',
                                      '<sup>',
                                      'Source: portal.saudicensus.sa','</sup>')))
}
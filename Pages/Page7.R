# Page7

Page7 <- navbarPage(title=div(img(src="Good logo.png", style="width:8%;height:10%; position:relative;display:right-align;margin-top:-10px;")),
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

Plotpage7 <- function(){
  Plot <- PopulationinbroadAgeGroups %>%
    group_by(age_groups,nationality) %>% 
    summarise(Population = sum(population)) %>% 
    mutate(`Age Group` = age_groups) %>%
    
    ggplot(aes(x = `Age Group`, y = Population, fill = nationality))+
    geom_bar(position = "dodge", stat='identity')+
    coord_flip()+
    theme_classic() +
    scale_y_continuous(labels = label_number(suffix = " M", scale = 1e-6)) +
    theme(plot.margin = margin(2,0.5,0.5,0.5,"cm"),plot.title = element_text(size = 12)) +
    xlab("Age Groups") +
    ylab("Population (in Millions)") +
    scale_fill_manual(name = "Nationality", values = c("#03045e","#0077b6","#00b4d8","#90e0ef"))
  
  
  ggplotly(Plot,tooltip = c("x", "y")) %>%
    layout(title = list(text = paste0("Saudi Arabia's Population by Age Groups and nationality",
                                      '<br>',
                                      '<sup>',
                                      'Source: portal.saudicensus.sa','</sup>')))
}
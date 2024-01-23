shinyServer(function(input,output,session){
  
  ##### tabItem 2 
  plot <- reactive({
    
    Plot <- PopulationinbroadAgeGroups %>% 
      group_by(broad_age_groups, age_groups) %>% 
      summarise(Population = sum(population)) %>%
      mutate(`Age Groups` = age_groups) %>%
      
      ggplot(aes(  x = `Age Groups`, y = Population, fill = broad_age_groups))+
      geom_bar(position = "dodge", stat='identity')+
      coord_flip()+
      theme_classic() +
      scale_y_continuous(labels = label_number(suffix = " M", scale = 1e-6)) +
      theme(plot.margin = margin(2,0.5,0.5,0.5,"cm"),plot.title = element_text(size = 12)) +
      xlab("Age Groups") +
      ylab("Population (in Millions)") +
      scale_fill_discrete(name = "Broad Age Groups")
    
    ggplotly(Plot,tooltip = c("x", "y")) %>%
      layout(title = list(text = paste0("Saudi Arabia's Population by Age Groups",
                                        '<br>',
                                        '<sup>',
                                        'Source: portal.saudicensus.sa','</sup>')))
  })
  
  # Arabic page
  output$plot1 <- renderPlotly({
    plot()
  })
  
  # English page
  output$plot2 <- renderPlotly({
    plot()
  })
  
  ##### tabItem 2 
  # plot2 <- reactive({
  #   Plot <- Population %>%
  #     mutate(year = as.Date(paste0("01-01-",year),format = "%d-%m-%Y")) %>%
  #     group_by(year,nationality) %>%
  #     summarise(Population = sum(population)) %>%
  #     ggplot(aes(x = year, y = Population , color = nationality)) +
  #     scale_color_discrete(name = "Nationality") +
  #     geom_line() +
  #     geom_point() +
  #     xlab("Year") +
  #     ylab("Population (in Millions)") +
  #     theme_classic() +
  #     scale_y_continuous(labels = label_number(suffix = " M", scale = 1e-6)) +
  #     scale_x_date(date_breaks = "1 year",date_labels = "%Y") +
  #     geom_hline(yintercept = 13500000, linetype = "dashed", color = "darkgreen") +
  #     geom_hline(yintercept = 12500000, linetype = "dashed", color = "red") +
  #     theme(plot.margin = margin(1,1,1,1,"cm"),plot.title = element_text(size = 12))
  #   
  #   ggplotly(Plot,tooltip = c("x", "y")) %>%
  #     layout(title = list(text = paste0("Evolution of Saudi Arabia's population by Nationality \n between 2010 and 2022",
  #                                       '<br>',
  #                                       '<sup>',
  #                                       'Source: portal.saudicensus.sa','</sup>')))
  # })
  # 
  # output$plot3 <- renderPlotly({
  #   plot2()
  # })
  # 
  # output$plot4 <- renderPlotly({
  #   plot2()
  # })
  
})
  
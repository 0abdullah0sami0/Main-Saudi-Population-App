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
      scale_fill_manual(name = "Broad Age Groups", values = c("#03045e","#0077b6","#00b4d8","#90e0ef"))
      
    
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
  
  #### tabItem 2
  plot2 <- reactive({
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
  })

  output$plot3 <- renderPlotly({
    plot2()
  })

  output$plot4 <- renderPlotly({
    plot2()
  })
  
  #### tabItem 3
  plot3 <- reactive({
    
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
  })
  
  output$plot5 <- renderPlotly({
    plot3()
  })
  
  output$plot6 <- renderPlotly({
    plot3()
  })
  
  #### tabItem 4
  plot4 <- reactive({
    
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
  })
  
  output$plot7 <- renderPlotly({
    plot4()
  })
  
  output$plot8 <- renderPlotly({
    plot4()
  })
  
  #### tabItem 5
  plot5 <- reactive({
    
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
  })
  
  output$plot9 <- renderPlotly({
    plot5()
  })
  
  output$plot10 <- renderPlotly({
    plot5()
  })
  
  #### tabItem 6
  plot6 <- reactive({
    
    Plot <- PopulationinbroadAgeGroups %>%
      group_by(age_groups,gender) %>% 
      summarise(Population = sum(population)) %>% 
      mutate(`Age Group` = age_groups) %>%
      
      ggplot(aes(x = `Age Group`, y = Population, fill = gender))+
      geom_bar(position = "dodge", stat='identity')+
      coord_flip()+
      theme_classic() +
      scale_y_continuous(labels = label_number(suffix = " M", scale = 1e-6)) +
      theme(plot.margin = margin(2,0.5,0.5,0.5,"cm"),plot.title = element_text(size = 12)) +
      xlab("Age Groups") +
      ylab("Population (in Millions)") +
      scale_fill_manual(name = "Gender", values = c("#03045e","#0077b6","#00b4d8","#90e0ef"))
    
    ggplotly(Plot,tooltip = c("x", "y")) %>%
      layout(title = list(text = paste0("Saudi Arabia's Population by Age Groups and Gender",
                                        '<br>',
                                        '<sup>',
                                        'Source: portal.saudicensus.sa','</sup>')))
  })
  
  # Arabic page
  output$plot11 <- renderPlotly({
    plot6()
  })
  
  # English page
  output$plot12 <- renderPlotly({
    plot6()
  })
  
  #### tabItem 7
  plot7 <- reactive({
    
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
  })
  
  # Arabic page
  output$plot13 <- renderPlotly({
    plot7()
  })
  
  # English page
  output$plot14 <- renderPlotly({
    plot7()
  })
  
  
})
  
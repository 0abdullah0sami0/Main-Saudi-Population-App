shinyServer(function(input,output,session){
  
  ##### tabItem 1
  plot <- reactive({
  
    Plotpage1()  
  
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
    
    Plotpage2()
    
  })

  output$plot3 <- renderPlotly({
    plot2()
  })

  output$plot4 <- renderPlotly({
    plot2()
  })
  
  #### tabItem 3
  plot3 <- reactive({
    
    Plotpage3()
    
  })
  
  output$plot5 <- renderPlotly({
    plot3()
  })
  
  output$plot6 <- renderPlotly({
    plot3()
  })
  
  #### tabItem 4
  plot4 <- reactive({
    
    Plotpage4()
    
  })
  
  output$plot7 <- renderPlotly({
    plot4()
  })
  
  output$plot8 <- renderPlotly({
    plot4()
  })
  
  #### tabItem 5
  plot5 <- reactive({
    
    Plotpage5()
    
  })
  
  output$plot9 <- renderPlotly({
    plot5()
  })
  
  output$plot10 <- renderPlotly({
    plot5()
  })
  
  #### tabItem 6
  plot6 <- reactive({
  
    Plotpage6()  
  
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
   
    Plotpage7() 
   
  })
  
  # Arabic page
  output$plot13 <- renderPlotly({
    plot7()
  })
  
  # English page
  output$plot14 <- renderPlotly({
    plot7()
  })
  
  #### tabItem 8
  plot8 <- reactive({
    
    Plotpage8() 
    
  })
  
  # Arabic page
  output$plot15 <- renderPlotly({
    plot8()
  })
  
  # English page
  output$plot16 <- renderPlotly({
    plot8()
  })
  
  
})
  
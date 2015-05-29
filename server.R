require(googleVis)
require(shiny)
require(dplyr)
load("data/pbg.Rda") 


names(pbg)
shinyServer(function(input, output) {
  data<-reactive({
    a<-pbg %>% select(Ano, Provincia, PBG.a.precios.de.mercado..aproximados..,Code)
    a<-pbg %>% filter(Ano==input$year)
    a<-droplevels(a)
    return(a)
  })
  
  output$mapa <- renderGvis({
    gvisGeoChart(data(), locationvar="Code", colorvar=input$variable, hovervar="Provincia", options=list(region="AR", displayMode="region", resolution="provinces", width=600, height=400))  
  })
  
  data<-reactive({
    a<-pbg %>% filter(Ano==input$year)
    a<-droplevels(a)
    return(a)
  })
  
  output$gvis <- renderGvis({
    gvisGeoChart(data(), locationvar="Code", colorvar=input$variable, hovervar="Provincia", options=list(region="AR", displayMode="region", resolution="provinces", width=600, height=400))  
  })
  
  
  data2<-reactive({
    a <- subset(pbg, Code==input$provincia)
    a<-droplevels(a)
    return(a)
  })
  
  output$bar <- renderGvis({  
    gvisColumnChart(data2(), xvar="Year", yvar="Inversion", options=list(hAxis="{title: 'Año', format: '#,###'}", vAxis="{title:'Montos anuales de anuncios de inversión'}",width=600, height=400,  colorAxis="{colors:['#FFFFFF', '#0000FF']}"))
  })
  
  
  data3<-reactive({
    myvars <- names(d) %in% c("Year",input$provincia2)
    d <- data.frame(d[myvars])
    d<-droplevels(d)
    return(d)
  })
  
  
  output$line <- renderGvis({  
    gvisLineChart(data3(), xvar=colnames(data3())[1], yvar=colnames(data3())[-1], options=list(hAxis="{title: 'Año', format: '#,###'}", vAxis="{title:'Montos anuales de anuncios de inversión'}",width=600, height=400,  colorAxis="{colors:['#FFFFFF', '#0000FF']}"))
  })

})


require(shiny)

shinyUI(fluidPage(theme = "bootstrap.css",
  titlePanel(list(tags$div(class="h1", 
             list(tags$a(href="http://lid.maimonides.edu", "Laboratorio de Ideas en Desarrollo"),
             tags$br(),
             tags$a(href="http://www.maimonides.edu/es/", "Universidad Maimónides")
             )))
  ),
  sidebarPanel(
    conditionalPanel(condition="input.conditionedPanels==1",
                     selectInput("year", 
                                 label = "Escoja un Año",
                                 choices = list("2000"=2000,
                                                "2001"=2001,
                                                "2002"=2002,
                                                "2003"=2003,
                                                "2004"=2004,
                                                "2005"=2005,
                                                "2006"=2006,
                                                "2007"=2007,
                                                "2008"=2008,
                                                "2009"=2009,
                                                "2010"=2010,
                                                "2011"=2011,
                                                "2012"=2012,
                                                "2013"=2013,
                                                "2014"=2014),
                                 selected = 2000),
                     selectInput("variable", 
                                 label = "Escoja una Variable",
                                 choices = list("PBG a precios de mercado"="PBG.a.precios.de.mercado..aproximados..",
                                                "PBG a precios de procductor"="PBG.a.precios.de.productor.",
                                                "Agricultura ganadería caza y silvicultura"="A..Agricultura..ganadería..caza.y.silvicultura",
                                                "Pesca y servicios conexos"="Pesca.y.servicios.conexos",
                                                "Explotación de minas y canteras"="Explotación.de.minas.y.canteras",
                                                "Industria Manufacturera"="Industria.Manufacturera",
                                                "Electricidad gas y agua"="Electricidad..gas.y.agua",
                                                "Construcción",
                                                "Sectores productores de servicios"="Sectores.productores.de.servicios",
                                                "Comercio al por mayor al por menor y reparaciones"="Comercio.al.por.mayor..al.por.menor.y.reparaciones",
                                                "Servicios de hotelería y restaurantes"="Servicios.de.hotelería.y.restaurantes",
                                                "Servicio de transporte de almacenamiento y de comunicaciones" ="Servicio.de.transporte..de.almacenamiento.y.de.comunicaciones",
                                                "Intermediación financiera y otros servicios financieros"="Intermediación.financiera.y.otros.servicios.financieros",
                                                "Servicios inmobiliarios empresariales y de alquiler"="Servicios.inmobiliarios..empresariales.y.de.alquiler",
                                                "Administración pública defensa y seguridad social obligatoria"="Administración.pública..defensa.y.seguridad.social.obligatoria",
                                                "Enseñanza",                                                     
                                                "Servicios sociales y de salud"="Servicios.sociales.y.de.salud",
                                                "Servicios comunitarios sociales y personales"="Servicios.comunitarios..sociales.y.personales.n.c.p.",
                                                "Servicios de hogares privados que contratan servicio doméstico"="Servicios.de.hogares.privados.que.contratan.servicio.doméstico"),
                                 selected = "PBG.a.precios.de.mercado..aproximados..")
                     
    ),
    conditionalPanel(condition="input.conditionedPanels==2",
                     selectInput("provincia", 
                                 label = "Elija una Provincia",
                                 choices = list("Autonomous City of Buenos Aires"="AR-C",
                                                "Buenos Aires"="AR-B",
                                                "Catamarca"="AR-K",
                                                "Cordoba"="AR-X",
                                                "Corrientes"="AR-W",
                                                "Chaco"="AR-H",
                                                "Chubut"="AR-U",
                                                "Entre Rios"="AR-E",
                                                "Formosa"="AR-P",
                                                "Jujuy"="AR-Y",
                                                "La Pampa"="AR-L",
                                                "La Rioja"="AR-F",
                                                "Mendoza"="AR-M",
                                                "Misiones"="AR-N",
                                                "Neuquen"="AR-Q",
                                                "Rio Negro"="AR-R",
                                                "Salta"="AR-A",
                                                "San Juan"="AR-J",
                                                "San Luis"="AR-D",
                                                "Santa Cruz"="AR-Z",
                                                "Santa Fe"="AR-S",
                                                "Santiago del Estero"="AR-G",
                                                "Tucuman"="AR-T",
                                                "Tierra del Fuego"="AR-V"),
                                 selected = "AR-C")
     
    
    ),
    conditionalPanel(condition="input.conditionedPanels==3",
                     checkboxGroupInput(inputId="provincia2",label="Provincia",
                                        choices =  list("Autonomous City of Buenos Aires"="Autonomous.City.of.Buenos.Aires",
                                                "Buenos Aires"="Buenos.Aires",
                                                "Catamarca",
                                                "Cordoba",
                                                "Corrientes",
                                                "Chaco",
                                                "Chubut",
                                                "Entre Rios"="Entre.Rios",
                                                "Formosa",
                                                "Jujuy",
                                                "La Pampa"="La.Pampa",
                                                "La Rioja"="La.Rioja",
                                                "Mendoza",
                                                "Misiones",
                                                "Neuquen",
                                                "Rio Negro"="Rio.Negro",
                                                "Salta",
                                                "San Juan"="San.Juan",
                                                "San Luis"="San.Luis",
                                                "Santa Cruz"="Santa.Cruz",
                                                "Santa Fe"="Santa.Fe",
                                                "Santiago del Estero"="Santiago.del.Estero",
                                                "Tucuman",
                                                "Tierra del Fuego"="Tierra.del.Fuego"),
                                 selected = "Salta")
    )            
                     
  ),
  
  mainPanel(
    p("Bienvenido a la pagina de datos sobre produccion por provincias de la argentina"),
    tabsetPanel(
      tabPanel("Home", div(id="link",tags$a("Evolucion")), value=0 ),
      tabPanel("Mapas", list(h4("Mapas de Inversión"), p("Necesita una explicación acá")), htmlOutput("mapa"), value=1),
      tabPanel("Inversión por Provincia", h4("Evolución Inversión por Provincia"), htmlOutput("bar"), value=2),
      tabPanel("Evolución", htmlOutput("line"),HTML("<script>$('#link').click(function() {
						 tabs = $('.tabbable .nav.nav-tabs li')
                                                  tabs.each(function() {
                                                  $(this).removeClass('active')
                                                  })
                                                  $(tabs[3]).addClass('active')
                                                  
                                                  tabsContents = $('.tabbable .tab-content .tab-pane')
                                                  tabsContents.each(function() {
                                                  $(this).removeClass('active')
                                                  })
                                                  $(tabsContents[3]).addClass('active')
                                                  
                                                  $('#summary').trigger('change').trigger('shown');
                                                  
                                                  })</script>
                                                  "), value=3),	
      id="conditionedPanels"
    )
)
))

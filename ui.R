library(datasets)

shinyUI(fluidPage(
      
      # Application title
      titlePanel('Stock Index Returns (1991-1998) Linear Regression Analysis'),
      
      sidebarLayout(
            
            # Sidebar with indices selection
            sidebarPanel(
                  selectInput('xcol', '1st Index on x-axis', colnames(EuStockMarkets)),
                  selectInput('ycol', '2nd Index on y-axis', colnames(EuStockMarkets)),
                  width = 2
            ),
      
      # Show a plot of the linear regression model
            mainPanel(
                  splitLayout(
                        plotOutput('cplot'),
                        plotOutput('rplot')
                  )
            )
      )
))
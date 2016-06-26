library(shiny)

# Github repository: https://github.com/dragonflyR/CourseProjectDDP

# Rely on the 'EuStockMarkets' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# Define a server for the Shiny app
shinyServer(

function(input, output) {
            
      # Convert the data into a data frame
      sdata <- as.data.frame(EuStockMarkets)

      # Convert the daily indices into daily return
      scount <- nrow(sdata)
      sreturn <- sdata[-1,] / sdata[-scount,] - 1
    
      # Plotting the linear models
      output$cplot <- renderPlot({
            
            # Set the output formatting to one chart
            par(mfrow = c(1,1))
            
            # Plot the linear regression of the selected indices
            f <- sreturn[[input$ycol]] ~ sreturn[[input$xcol]]
            plot(f, xlab = input$xcol, ylab = input$ycol)
            abline(lm(f, sreturn), lwd=3, col="red")
            
      })
      output$rplot <- renderPlot({

            # Set the output formatting to four charts
            par(mfrow = c(2,2))
            
            # Plot the regression analysis
            plot(lm(sreturn[[input$ycol]] ~ sreturn[[input$xcol]]))
      })
})
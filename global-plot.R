#
library(plotly)

plotlyMarkersLines <- function(){
  trace_0 <- rnorm(100, mean = 5)
  trace_1 <- rnorm(100, mean = 0)
  trace_2 <- rnorm(100, mean = -5)
  x <- c(1:100)
  
  data <- data.frame(x, trace_0, trace_1, trace_2)
  
  p <- plot_ly(data, x = ~x, y = ~trace_0, name = 'trace 0', type = 'scatter', mode = 'lines') %>%
    add_trace(y = ~trace_1, name = 'trace 1', mode = 'lines+markers') %>%
    add_trace(y = ~trace_2, name = 'trace 2', mode = 'markers') %>%
    layout(title = "title",
             xaxis = list(title = "Days"), 
             yaxis = list(title = "Temp"))
  p
}

plotlyNAMarkersLines <- function(){
  trace_0 <- rnorm(365, mean = 5, sd = 30)
  trace_1 <- trace_0
  trace_0[sample(length(trace_0), 33)] <- NA
  
  x <- c(1:365)

  data <- data.frame(x, trace_0, trace_1)
  
  p <- plot_ly(data, x = ~x, 
               y = ~trace_1, name = 'trace 1', type = 'scatter', mode = 'markers') %>%
    add_trace(y = ~trace_0, name = 'trace 0', mode = 'markers') %>%
    layout(title = "title",
           xaxis = list(title = "Days"), 
           yaxis = list(title = "Temp"))
  p
}

if (FALSE){
  plotlyNAMarkersLines()
}
if (FALSE){
  plotlyMarkersLines()
}
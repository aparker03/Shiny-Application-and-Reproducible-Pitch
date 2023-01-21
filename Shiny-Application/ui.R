#Remove categorical variables because k-means uses numeric values
library(shiny)
library(ggplot2)

data("diamonds")
vars <- names(diamonds[,c(-2,-3,-4)])

shinyUI(pageWithSidebar(
    headerPanel("Interactive K-means Clustering"),
    
    sidebarPanel(
        selectInput('xvar', 'Select X Variable', choices = vars),
        selectInput("yvar", 'Select Y Variable', choices = vars),
        numericInput("k", 'Select the Number of Clusters', value = 3,
                     min = 1, max = 5)
    ),
    
    mainPanel(
        h2("Variable Descriptions"),
        p("carat = weight of the diamond"),
        p("depth = total depth percentage"),
        p("table = width of top of diamond relative to widest point"),
        p("price = price in US dollars"),
        p("x = length in mm"),
        p("y = width in mm"),
        p("z = depth in mm"),
        plotOutput('plot1')
    )
))
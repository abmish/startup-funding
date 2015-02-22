library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("How much fund can you raise for your startup?"),   
  sidebarPanel(
    h5("For your start-up"),
    sliderInput('emps', 'Pick number of Employees', value=100, min=0, max=2000, step=25),
    selectInput('cat', 'Choose startup category', choices=c('software', 'mobile', 'web')),
    selectInput('f_round', 'Choose your startup funding round', choices=c( 'a', 'angel', 'b', 'c', 'd', 'debt_round', 'e', 'seed'))
    ),
  mainPanel(
    h5("This app helps you predict -"),
    h5("how much fund can you raise for your startup"),
    h5("based on number of employees, funding round and operating domain."),
    h5("Choose values accordingly from the side panel"),
    br(), br(), br(),
    
    h4("For a startup in domain:"),
    verbatimTextOutput("category"),
    h4("with employee strength of:"),
    verbatimTextOutput("emps"),
    h4("raising funds for round:"),
    verbatimTextOutput("round"),
    h4("prediction is of raising:"),
    verbatimTextOutput("raisedFund"),
    h4("in US Dollars"),
    
    br(), br(), br(),
    h6("This app is based on a subset of funding data available at TechCrunch/ CrunchBase (Complete data set can be found by registering at https://info.crunchbase.com/about/crunchbase-data-exports/)")
  )))
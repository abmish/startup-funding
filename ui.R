library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("How much fund can you raise for your startup?"),
  sidebarPanel(
    sliderInput('emps', 'Number of Employees', value=100, min=0, max=2000, step=25),
    selectInput('cat', 'Choose startup category', choices=c('software', 'mobile', 'web')),
    selectInput('f_round', 'Choose your startup funding round', choices=c( 'a', 'angel', 'b', 'c', 'd', 'debt_round', 'e', 'seed'))
    ),
  mainPanel(
    h4("For a startup in domain:"),
    verbatimTextOutput("category"),
    h4("with employee strength of:"),
    verbatimTextOutput("emps"),
    h4("raising round:"),
    verbatimTextOutput("round"),
    h4("funding, prediction is of raising:"),
    verbatimTextOutput("Text"),
    h4("in US Dollars")
  )
  ))
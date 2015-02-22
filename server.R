library(UsingR)
raw_funding <- data.frame(read.csv("TechCrunchcontinentalUSA.csv", header = T, colClasses=c("NULL","NULL", "numeric", NA, "NULL", "NULL", "NULL", NA, "NULL", NA)))
funding <- raw_funding[complete.cases(raw_funding[, c('numEmps')]), ]
funding <- funding[(funding$category %in% c('mobile', 'software', 'web')),]
model <- model <- lm(raisedAmt ~ numEmps + category + round, data=funding)
shinyServer(
  function(input, output) {
    output$Text <- renderText({
      data <- data.frame(matrix(rep(NA, 3), nrow=1))
      colnames(data) <- c("numEmps","category","round")
      data$numEmps <- input$emps
      data$category <- input$cat
      data$round <- input$f_round
      x <- abs(predict(model, data))
    })
    output$emps <- renderText({input$emps})
    output$category <- renderText({input$cat})
    output$round <- renderText({input$f_round})
  })
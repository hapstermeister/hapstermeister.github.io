## PART 2: server.R  
library(shiny)
infertCases <- infert[infert$case == 1,]
totalTable <- table(infert$spontaneous, infert$induced)
infertTable <- table(infertCases$spontaneous, infertCases$induced)
riskTable <- infertTable / totalTable
riskTable[3,3] <- 0

actRisk <- function(spontaneous, induced) {
   if (spontaneous == "2 or more") {
      s <- 2
   } else {
      s <- as.numeric(spontaneous)
   }
   if (induced == "2 or more") {
      i <- 2
   } else {
      i <- as.numeric(induced)
   }
   if (s == 2 && i == 2) {
      ar <- "Insufficient Data"
   } else {
      ar <- riskTable[s+1, i+1]
   }
   ar
}

relRisk <- function(spontaneous, induced) {
   if (spontaneous == "2 or more") {
      s <- 2
   } else {
      s <- as.numeric(spontaneous)
   }
   if (induced == "2 or more") {
      i <- 2
   } else {
      i <- as.numeric(induced)
   }
   if (s == 2 && i == 2) {
      rr <- "Insufficient Data"
   } else {
      rr <- riskTable[s+1, i+1] / riskTable[1,1]
   }
   rr
}

shinyServer(
   function(input, output) {
      output$actrisk <- renderPrint({actRisk(input$spontaneous, input$induced)})
      output$relrisk <- renderPrint({relRisk(input$spontaneous, input$induced)})
   }
)
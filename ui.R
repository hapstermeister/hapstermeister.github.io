## PART 1: ui.R
shinyUI(pageWithSidebar(
   headerPanel('Secondary Infertility Prediction'),
   sidebarPanel(
      h3('Influence factors:'), 
      selectInput("spontaneous", "Number of Prior Spontaneous Abortions: ",
                  choices = c("0", "1", "2 or more")),
      selectInput("induced", "Number of Prior Induced Abortions: ",
                  choices = c("0", "1", "2 or more")),
      submitButton('Submit')
   ),
   mainPanel(
      h4('This app investigates the role abortions (spontaneous and induced) 
         have in the etimology of secondary sterility. The dataset ("infert") 
         used for this app was obtained from the Division of Fertility and 
         Sterility of the First Department of Obstetrics and Gynaecology of the 
         University of Athens Medical School.'),
      h3('Risk of Secondary Infertility'),
      h4('The risk of having secondary infertility is: '),
      verbatimTextOutput('actrisk'),
      h3('Relative Risk of Infertility'),
      # code('some code'), # actual code
      p('Relative Risk is defined as the ratio between the risk of secondary 
        infertility among women with one more induced or spontaneous abortions
        or any combination of them to that among those without any induced or
        spontaneous abortion.'), # descriptor
      h4('The relative risk of second infertility is: '),
      verbatimTextOutput('relrisk')
   )
))
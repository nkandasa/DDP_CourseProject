### This is the ui.R file for the shiny app to calculate BMI (Body Mass Index)
### Coursera "Developing Data Products" Course project
### WARNING: Don't use this app for any medical diagnosis. This app was a created for a course project 
### and should NOT be used for any other purpose.
### Reference:http://www.whathealth.com/bmi/formula.html#limitations

library(shiny)
shinyUI(fluidPage(
  titlePanel("Know Your BMI App"),
  h5('BMI stands for "Body Mass Index.BMI is a measure of body fat based on height and weight. The higher your BMI, the higher your risk for heart disease and high blood pressure.'),
  h5('WARNING:This App was created for the Coursera "Developing Data Products" Course project. DO NOT USE THIS APP FOR MEDICAL DIAGNOSIS.'),
  h5('Reference: Whathealth Website - http://www.whathealth.com/bmi/formula.html#limitations'),
 
  sidebarLayout(
  sidebarPanel(
    h3('Enter Your Information'),
    radioButtons(inputId='gender',label='Gender:',choices=c('Male', 'Female')),
    sliderInput('age', 'Age:', 0,120, 30, step=1),
    numericInput('weight', 'Weight(lbs):',160, min = 100,max =1000,step=1),
    h4('Height:'),
    numericInput('heightft','Feet', 6, min = 1, max =10, step=1),
    numericInput('heightin', 'Inches', 2, min=1, max =12, step=1 ),
    submitButton('Calculate My BMI')
     ),
   
  mainPanel(
     h3('Your Selections'),
     h4('Gender:'),
     verbatimTextOutput("gender"),
     h4('Age:'),
     verbatimTextOutput("age"),
     h4('Weight(lbs):'),
     verbatimTextOutput("weight"),
     h4('Height:'),
     h5('Feet'),
     verbatimTextOutput("heightft"),
     h5('Inches'),
     verbatimTextOutput("heightin"),
     
     h3('Your Results'),
     h4('Body Mass Index (BMI):'),
     verbatimTextOutput("bmi"),
     h4('BMI Weight Category:'),
     verbatimTextOutput("bmi_diag"),
     h4('Age Disclaimer:'),
     verbatimTextOutput("agewarning")
     ),
  
  )))
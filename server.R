### This is the server.R file for the shiny app to calculate BMI (Body Mass Index)
### Coursera "Developing Data Products" Course project
### WARNING: Don't use this app for any medical diagnosis. This app was a created for a course project 
### and should NOT be used of any other purpose.
### Reference:http://www.whathealth.com/bmi/formula.html#limitations

library(shiny)

## Calculating BMI (Reference: http://www.whathealth.com/bmi/formula.html#limitations)
BMI_Calc <- function(gender, age, weight, heightft, heightin){
    heightins <- heightft*12 + heightin
    bmi <- round((weight*703)/(heightins^2),1)
    return(bmi)
}

## Age Disclaimer (Reference: http://www.whathealth.com/bmi/formula.html#limitations)

Age_Warn <- function(age){
  if(age < 20) {
    agewarning <- c("This BMI Calculator may not be valid for your age")
  } else {
    agewarning <- c("This BMI Calculator is reasonably valid for your age")
  }
  return(agewarning)
}
  
## BMI Observation (Reference:http://www.whathealth.com/bmi/formula.html#limitations)
  
BMI_Diag <- function(bmi){
  if(bmi < 18.5){
    bmi_diag <- c("Underweight")
  } else if(bmi >= 18.5 && bmi <= 24.9){
    bmi_diag <- c("Normal") 
  } else if(bmi >= 25.0 && bmi <= 29.9){
    bmi_diag <- c("Overweight") 
  }
    else {
    bmi_diag <- c("Obese")
  }
    return(bmi_diag)
}
  
shinyServer(
  function(input, output){
    output$gender <- renderText({input$gender})
    output$age <- renderText({input$age})
    output$weight <- renderText({input$weight})
    output$heightft <- renderText({input$heightft})
    output$heightin <- renderText({input$heightin})
    output$bmi <- renderText({BMI_Calc(input$gender,input$age,input$weight,input$heightft,input$heightin)})
    output$agewarning <- renderText({Age_Warn(input$age)})
    output$bmi_diag <- renderText({BMI_Diag(({BMI_Calc(input$gender,input$age,input$weight,input$heightft,input$heightin)}))})
    }
  )
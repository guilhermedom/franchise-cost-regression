# Franchise Cost Regression

Web app for predicting the initial investment necessary to start a new franchise of a company. 

---

## Usage

Install the Shiny R package on your machine by running the following command on your R console:

```
install.packages("shiny")
```

Once finished installing, clone or download this repository and open the "app.R" file with Rstudio. Rstudio will automatically detect that it is a Shiny app file and a "Run App" button will appear on the top of the editor screen. Click the button to run the app.

Alternatively, with the repository cloned, open your R console and set the working directory to the absolute path where the repository was cloned:

```
setwd(path_to_cloned_repository)
```

Then, load the Shiny library and run the file "app.R":

```
library(shiny)
runApp("app/app.R")
```

The app will start on a new browser tab in your default browser.

## App Features

* The prediction is performed using a database given by the company. This database has information about the initial investments and annual costs of other previously opened franchises;
* A univariate linear regression fits a function between the two variables "Franchise Annual Cost" and "Initial Cost", with the latter being the dependent variable;
* The app user can see the database provided by the franchising company and also a scatter plot with the fitted regression curve;
* Additionally, the user can input the planned annual cost for the new franchise and press a button to make the model predict the respective initial cost.

## User Interface Sample

![ui_franchise-cost-regression](https://user-images.githubusercontent.com/33037020/183149311-747c241c-9481-482a-b580-fd3acf6e7a3f.JPG)

*A [Shiny] web app is an R framework provided along with RStudio that allows its users to develop web apps using R and embedded web languages, such as CSS and HTML. Shiny apps focus on objectiveness and simplicity: only one or two R scripts have all the code for the app.*

*This app development started with knowledge and tools discussed during the course "Data Science Bootcamp" by Fernando Amaral. The app has been upgraded and personalized, adding new functionalities.*

[//]: #

[Shiny]: <https://www.shinyapps.io>

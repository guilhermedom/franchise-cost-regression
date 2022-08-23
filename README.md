# Franchise Cost Regression

Web app for predicting the initial investment necessary to start a new franchise of a company. 

* The prediction is performed using a database given by the company. This database has information about the initial investments and annual costs of other previously opened franchises;
* A univariate linear regression fits a function between the two variables "Franchise Annual Cost" and "Initial Cost", with the latter being the dependent variable;
* The app user can see the database provided by the franchising company and also a scatter plot with the fitted regression curve;
* Additionally, the user can input the planned annual cost for the new franchise and press a button to make the model predict the respective initial cost.

The user interface for this simple application can be seen next:

![ui_franchise-cost-regression](https://user-images.githubusercontent.com/33037020/183149311-747c241c-9481-482a-b580-fd3acf6e7a3f.JPG)

*[Shiny] is a framework that allows users to develop web apps using R and embedded web languages, such as CSS and HTML. Shiny apps focus on objectiveness and simplicity: only one or two R scripts have all the code for the app.*

*This app development started with knowledge and tools discussed during the course "Data Science Bootcamp" by Fernando Amaral. The app has been upgraded and personalized, adding new functionalities.*

[//]: #

[Shiny]: <https://www.shinyapps.io>

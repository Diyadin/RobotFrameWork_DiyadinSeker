*** Settings ***
Library                       Selenium2Library
Library                       OperatingSystem
Library                       String

Resource                      ./pagesAndKeyword/setupAndTeardown.robot
Resource                      ./pagesAndKeyword/pageLogin.robot
Resource                      ./pagesAndKeys/pageDashboard.robot
Resource                      ./pagesAndKeyword/pageNavigateToCreateNewBill.robot

Test setup                  Setup
Test teardown               Teardown

*** Test cases ***
testLOGIN
    Test_login_into_the_system
    createNewBill
    


    
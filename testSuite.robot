*** Settings ***
Library                       Selenium2Library
Library                       OperatingSystem
Library                       String
Library                       DateTime

Resource                      ./pagesAndKeyword/setupAndTeardown.robot
Resource                      ./pagesAndKeyword/pageLogin.robot
Resource                      ./pagesAndKeyword/pageDashboard.robot
Resource                      ./pagesAndKeyword/createNewBill.robot
Resource                      ./pagesAndKeyword/createNewUser.robot   
Resource                      ./pagesAndKeyword/createNewBedroom.robot


Test setup                  Setup
Test teardown               Teardown

*** Test cases ***
testLoginAndCreateBedroom
     Login_as_admin
     createNewBedroom
     perform logout
    
testCreateBill
   Login_as_admin
   createNewBillFailAndLogout
    perform logout
testNewUser
    Login_as_admin
    createNewUserFailure
    perform logout
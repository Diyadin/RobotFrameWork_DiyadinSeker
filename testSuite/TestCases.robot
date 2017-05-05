*** Settings ***
Resource                              ../resourceMap/variable.robot
Resource                              ../setup/settings.robot
Library                               Selenium2Library
Library                               OperatingSystem

Test setup                            Setup  
Test teardown                         Teardown

*** Test cases ***
Create New Reservation
    performLogin
    createNewReservation
    performLogout
    
Edit a Reservation
    performLogin
    editReservation
    
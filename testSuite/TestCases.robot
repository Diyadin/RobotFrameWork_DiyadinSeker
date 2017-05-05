*** Settings ***
Resource                              ../resourceMap/variable.robot
Resource                              ../setup/settings.robot
Library                               Selenium2Library
Library                               OperatingSystem

Test setup                            Setup  
Test teardown                         Teardown

*** Test cases ***

#All Test cases only call for Keywords, within these Keywords are step-by-step methods
    
Create New Reservation
    performLogin
    createNewReservation
    performLogout
    
Edit a Reservation
    performLogin
    editReservation
    performLogout
 
Create a New Client
    performLogin
    createNewClient
    performLogout
     
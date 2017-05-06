*** Settings ***
Resource                 ../credentials/environmentVariables.robot

*** Keywords ***

Setup
    Set Environment Variable               ${driver_name}                ${chromedriver_location}
    Open Browser                           ${baseURL}                     browser=${chrome_browser}
    Maximize Browser Window
    Set Selenium Speed                      0.3                    
    Set Selenium Timeout                    5
    Delete All Cookies
    Location Should Be                      ${baseURL}      
    
    
Teardown
    Close All Browsers                  
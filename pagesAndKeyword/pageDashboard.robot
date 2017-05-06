*** Settings ***
Resource                                     pageLogin.robot
Resource                                     ../credentials/dashboardVariables.robot

*** Keywords ***
perform logout     
    Wait Until Page Contains Element           ${logout_menu}
    click element                              ${logout_menu}
    Wait Until Page Contains Element           ${logout_submenu}
    click element                              ${logout_submenu}                 
    Wait Until Page Contains                  ${login_pg_label_login}     
    Title Should be                           ${login_pg_title} 
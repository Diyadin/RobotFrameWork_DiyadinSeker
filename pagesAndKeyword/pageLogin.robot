*** Settings ***
Resource                   ../credentials/loginVariable.robot
Resource                   setupAndTeardown.robot     
Resource                   pageDashboard.robot
Resource                   ../credentials/loginPageVariables.robot


*** keywords ***
Login_as_normal_user  
    Wait Until Page Contains                 ${login_pg_label_login}
    Input Text                               ${login_pg_username_textfield}                      ${normalUserName} 
    Input Text                               ${login_pg_password_textfield}                      ${normalPassword} 
    Click Element                            ${login_pg_btn_login}
    Wait Until Page Contains                 ${dashboard_pg_label_dashboard}   
    


Login_as_admin
    Wait Until Page Contains                 ${login_pg_label_login}
    Input Text                               ${login_pg_username_textfield}                      ${adminUserName} 
    Input Text                               ${login_pg_password_textfield}                      ${adminPassword} 
    Click Element                            ${login_pg_btn_login}
    Wait Until Page Contains                 ${dashboard_pg_label_dashboard}   
    

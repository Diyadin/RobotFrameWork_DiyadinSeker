*** Settings ***
Resource                   ../credentials/loginVariable.robot
Resource                   setupAndTeardown.robot     
Resource                   pageDashboard.robot
 

*** variables ***
${login_pg_label_login}                          Login
${login_pg_title}                                Hotel Accomodation - login page

# LOgin Form.
${login_pg_username_textfield}                   id=formLogin:login
${login_pg_password_textfield}                   id=formLogin:senha
${login_pg_btn_login}                            name=formLogin:j_idt27



*** keywords ***
Test_login_into_the_system  
    Wait Until Page Contains                 ${login_pg_label_login}
    Input Text                               ${login_pg_username_textfield}                      ${normalUserName} 
    Input Text                               ${login_pg_password_textfield}                      ${normalPassword} 
    Click Element                            ${login_pg_btn_login}
    Wait Until Page Contains                 ${dashboard_pg_label_dashboard}   
    





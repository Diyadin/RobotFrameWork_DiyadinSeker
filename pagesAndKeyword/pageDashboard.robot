*** Settings ***
Resource                                     pageLogin.robot

*** variables ***
${dashboard_pg_label_dashboard}            Dashboard

${logout_menu}                             xpath=//a[@class='dropdown-toggle']
${logout_submenu}                          xpath=//i[@class='fa fa-sign-out fa-fw']


*** Keywords ***
perform logout     
    Wait Until Page Contains Element           ${logout_menu}
    click element                              ${logout_menu}
    Wait Until Page Contains Element           ${logout_submenu}
    click element                              ${logout_submenu}                 
    Wait Until Page Contains                  ${login_pg_label_login}     
    Title Should be                           ${login_pg_title} 
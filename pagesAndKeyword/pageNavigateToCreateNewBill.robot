*** Settings ***
Library                  String

Resource               pageLogin.robot




*** Variables ***
${dashboard_pg_label_dashboard}                          Dashboard
${dash_pg_btn_bill}                         xpath=//*[@id="side-menu"]/li[4]/a
${bill_pg_label_list}                       List
${dashboard_pg_bill_btn}                    xpath=//*[@id="j_idt49"]/a[1]
${bill_pg_label_createnewbill}              Create New Bill
${bill_status}                              2      
${bill_status_list}                         id=j_idt50:billStatusId
${hotel_reservation_list}                   id=j_idt50:hotelReservationId 
${createBill_pg_save_btn}                   xpath=//*[@id="j_idt50"]/a[1]
${fail_save_bill_message}                   A persistence error occurred.

*** Keywords ***
createNewBill
    Wait Until Page Contains                     ${dashboard_pg_label_dashboard}
    Click Element                                ${dash_pg_btn_bill}
    Title Should Be                              ${bill_pg_label_list}
    Click Element                                ${dashboard_pg_bill_btn} 
    Wait Until Page Contains                     ${bill_pg_label_createnewbill}
   
    #${numbers}=    Evaluate                  random.sample(range(1, 3), 1)    random  
   ${numbers}  Generate Random String   1    123
    Log to console   ${numbers}
   
    Select From List By Value                    ${bill_status_list}   ${numbers}
   
    
    ${label_text}  Get Selected List Label       ${bill_status_list}   
    Log to console      ${label_text}
    
    
    List Selection Should Be                     ${bill_status_list}        ${label_text} 
   
    ${numbers1}  Generate Random String   1    35781 
    Select From List By Value                    ${hotel_reservation_list}      ${numbers1}
    ${reservation_text_label}  Get Selected List Label   ${hotel_reservation_list}
    Log to console  ${reservation_text_label}
   
    List Selection Should Be                     ${hotel_reservation_list}     ${numbers1} 
    Click Element                                ${createBill_pg_save_btn} 
    Wait Until Page Contains                     ${fail_save_bill_message}
    Click Element                                ${logout_menu}
    Click Element                                ${logout_submenu}
    





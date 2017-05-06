*** Settings ***
Library                  String
Library                  FakerLibrary
Library                  Collections
Library                  Selenium2Library


Resource               pageLogin.robot
Resource               ../credentials/billVariables.robot





*** Keywords ***
createNewBillFailAndLogout
    #Verify dashboard page and & click element 
    Wait Until Page Contains                     ${dashboard_pg_label_dashboard}
    Click Element                                ${dash_pg_btn_bill}
    Title Should Be                              ${bill_pg_label_list}
    Click Element                                ${dashboard_pg_bill_btn} 
    Wait Until Page Contains                     ${bill_pg_label_createnewbill}
   
   
    #${numbers}=    Evaluate                  random.sample(range(1, 3), 1)    random  
    #Generating one number between 1-3 to randomly select as value in drop down list  
    ${numbers}  Generate Random String   1    123
    Select From List By Value                    ${bill_status_list}   ${numbers}
   
    #Verifying selected list is the same as the randomly created number
    ${label_text}  Get Selected List Label       ${bill_status_list}   
    List Selection Should Be                     ${bill_status_list}        ${label_text} 
    
    ${numbers1}  Generate Random String   1    35781 
   ${chooseAble}   Run Keyword And Return Status   List Should Not Contain Value    1   True
    Run Keyword If  '${chooseAble}' == 'True'   Click Element   ${createBill_pg_save_btn}   ELSE   Select From List By Value   ${numbers1}
      
   
   
          
   
   
    #Saving information and verifying error message & logout   
    Click Element                                ${createBill_pg_save_btn} 
    ${message}  Run Keyword And Return Status   Wait Until Page Contains    ${fieldRequiredMessage}
    Run Keyword If  '${message}' == 'True'      Wait Until Page Contains    ${fieldRequiredMessage}   ELSE   Wait Until Page Contains                     ${fail_save_bill_message}  
    
    #Wait Until Page Contains                     ${fail_save_bill_message}
  
    
    
    

randomDate
    
    
     
     ${fakeDate}=    Date   pattern=%Y-%m-%d   
     Log to console   ${fakeDate}
     
     ${futureDate}=  Date Time Between  start_date=2017y        end_date=2018
            #Log to console   ${futureDate}
            
     ${exitDate}=  convert Date   ${futureDate}  result_format=%Y-%m-%d 
           Log to console  ${exitDate} 
            
     
      
      
      

    
    



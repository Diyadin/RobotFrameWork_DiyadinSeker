*** Settings ***
Library               Selenium2Library
Resource              pageLogin.robot
Resource              ../credentials/userVariables.robot


*** Keywords ***
createNewUserFailure
     #Navigating to user page from dashboard page and verifying
    Click Element                              ${dasboard_pg_user_btn}
    Wait Until Page Contains                   ${user_pg_usertype_label}
    Click Element                              ${user_pg_btn_createNewUser}              

    #Generating one random number betwen 1-2 to use as value in dropdown list & verifying selected value
    ${randomOfTwoOptions}   Generate Random String    1   12  
    Select From List By Value              ${type_of_user}           ${randomOfTwoOptions}    
    ${selected_typeOfUserValue}  Get Value              ${type_of_user}               
    Should be equal          ${selected_typeOfUserValue}     ${randomOfTwoOptions}
    
    
    #Generating login input
    ${newUser_Login_Name}        Generate Random String   8           [NUMBERS]abcdefghj
    Input Text               ${createNewUser_pg_Login_Textfield}      ${newUser_Login_Name} 
     
     
     
     #Generating password and sending    
    ${newUser_Password}    Generate Random String   7     [NUMBERS]abc           
    Input Text               ${createNewUser_pg_Password_Textfield}         ${newUser_Password}   
    Input Text  ${createNewUser_pg_ReTypePasword_Textfield}            ${newUser_Password}
    
    
    #Generating value and verifying selected value
    ${clientName}   Generate Random String      1   14562
    Select From List By Value      ${createNewUser_pg_Client}        ${clientName}
    ${selected_ClientName}  Get Value          ${createNewUser_pg_Client}
    Should be equal                 ${selected_ClientName}      ${clientName}
    
    
    #Generating value and veryfing selected value
    ${randomUserStatus}   Generate Random String  1  12
    Select From List By Value      ${createNewUser_pg_userStatus}      ${randomUserStatus}
    ${selectedUserStatus}  Get Value          ${createNewUser_pg_userStatus}   
    Should be equal         ${randomUserStatus}         ${selectedUserStatus}        
    
    #saving and veryfing error of registering an user
    Click Element         ${createNewUser_pg_save_btn}
    Element Should Be Visible   ${createNewUser_pg_createUserErrorMessage}
    
    
    
    
    Sleep   3


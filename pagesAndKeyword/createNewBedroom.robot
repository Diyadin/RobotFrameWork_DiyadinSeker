*** Settings ***
Library                  String
#Library                  FakerLibrary
Library                  Selenium2Library
Library                  BuiltIn
Resource                 pageLogin.robot
Resource                 ../credentials/bedroomVariables.robot



*** Variables ***






*** Keywords ***
createNewBedroom
    Click element           ${dashboard_pg_bedroom_btn}  
    Element should be visible    ${bedroom_pg_createNewBedrom_btn}
    Click element         ${bedroom_pg_createNewBedrom_btn}
              
    #Generating 6 random Uppercase letters for namedescription input
    ${descriptionName}   Generate random string   6  [UPPER]
    Input Text         ${createNewBedroom_pg_description_textfield}    ${descriptionName}
    
    #Generating one number between 0-9 for floor select
    ${floor}   Generate random string    1    [NUMBERS]
    Input Text    ${createNewBedroom_pg_floor_textfield}    ${floor}
   
    #Generating 3 numbers between 0-9  for room number
    ${bedroomNumber}     Generate random string  3  [NUMBERS]
    Input Text         ${createNewBedroom_pg_number_textfield}    ${bedroomNumber}  

    #Generating 5 numbers between 1-9 for bedrrom price
    ${bedroomPrice}  Generate random string   5   [NUMBERS]
    Input Text          ${createNewBedroom_pg_priceDaily_textfield}   ${bedroomPrice}
    
    #Generating 1 numbers between 1-3 for  drop down select in value
    ${bedroom_status_id_randomSelect}  Generate random string  1  123
    Select from list by value    ${bedroom_pg_bedroomStatusId_dropDown}   ${bedroom_status_id_randomSelect}
    
    #Generating one number between 1-5  for dropdown selecting 
    ${bedroomType}   Generate random string  1   23456
    Select from list by value   ${bedroom_pg_typeBedroomId_dropdown}    ${bedroomType}
    
    #save button click & verify creating succses messages
    Click Element     ${bedroom_pg_save_btn}
    Page should contain    Bedroom was successfully created.
    
    
    #Locate, verify and delete bedroom in list
    Click Element        ${bedroom_pg_showAllBedrooms_btn}
    ${present}=  Run Keyword And Return Status    Page should contain   ${descriptionName}
    Run Keyword If    '${present}' == 'True'      Page should contain   ${descriptionName}    ELSE   Click Element   ${createNewBedroom_pg_next10_list} 
    Page should contain   ${descriptionName}
    Click Element         //tr[.//td='${descriptionName}']//a[.='Delete']
   
       
    

    
    
    
    
    
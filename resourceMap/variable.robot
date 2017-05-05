*** Settings ***
Library                                       DateTime
Library                                       Selenium2Library
Library                                       FakerLibrary
Library                                       String
Resource                                      ../setup/settings.robot

*** Variables ***
#Base Variables
${chromedriverPath}                            /usr/local/bin/chromedriver
${baseUrl}                                     http://localhost:8080/hotel/faces/login/login.xhtml
${chromeBrowser}                               chrome     
${driverName}                                  webdriver.chrome.driver     
${username}                                    marc
${password}                                    1010

#Login Form
${login_pg_label_login}                        Login
${login_pg_username_textfield}                 id=formLogin:login
${login_pg_password_textfield}                 id=formLogin:senha
${login_pg_btn_login}                          name=formLogin:j_idt27

# Logout Form
${dashboard_pg_label_dashboard}                Dashboard
${logout_menu}                                 xpath=//a[@class='dropdown-toggle']
${logout_submenu}                              xpath=//i[@class='fa fa-sign-out fa-fw']

#Titles
${reservation_title}                           List
${create_new_reservation_title}                Create New Hotel Reservation
${edit_reservation_title}                      Edit Hotel Reservation
${login_pg_title}                              Hotel Accomodation - login page
${client_title}                                List
${newClient_title}                             Create New Client
${create_new_client_clientCreatedTitle}        View

#Create a Reservation variables
${menu_reservation}                            xpath=//*[@id="side-menu"]/li[6]/a
${create_new_reservation_button}               xpath=//*[@id="j_idt49"]/a[1]
${entryDate_location}                          id=entryDate
${exitDate_location}                           id=exitDate
${reservation_bedroom_dropdown}                id=bedroomId
${reservation_client_dropdown}                 id=clientId
${reservation_status_dropdown}                 id=reservationStatusId
${reservation_save_button}                     xpath=//*[@id="j_idt50"]/a[1]
${reservation_error_message}                   xpath=//*[@id="messagePanel"]/table/tbody/tr/td
${reservation_table}                           xpath=//*[@id="j_idt49"]/table

#Edit a Reservation variables
${edit_reservation_button_lastIndex}           xpath=//*[@id="j_idt49"]/table/tbody/tr[5]/td[8]/a[2]
${edit_reservation_successful}                 xpath=//*[@id="messagePanel"]/table/tbody/tr/td
${edit_showAllReservation_button}              xpath=//*[@id="j_idt50"]/a[4]
${edit_reservation_entryDate_location}         xpath=//*[@id="j_idt49"]/table/tbody/tr[5]/td[3]

#Crete a new Client variables
${menu_client}                                 xpath=//*[@id="side-menu"]/li[5]/a
${create_new_client_button}                    xpath=//*[@id="j_idt49"]/a[1]
${create_new_client_nameField}                 id=name
${create_new_client_emailField}                id=email
${create_new_client_genderBtnMale}             id=gender:0
${create_new_client_socialSecurityNumber}      id=socialSecurityNumber
${create_new_client_saveButton}                xpath=//*[@id="j_idt51"]/a[1]
${create_new_client_clientCreatedVerify}       xpath=//*[@id="messagePanel"]/table/tbody/tr/td
${verifyClientCreatedText}                     Client was successfully created.
${create_new_client_clientCreatedDelete}       xpath=//*[@id="j_idt50"]/a[1]
${create_new_client_clientDeleted}             xpath=//*[@id="messagePanel"]/table/tbody/tr/td
${verifyClientDeletedText}                     Client was successfully deleted.

#Keywords that perform a specific action
*** Keywords ***
input_entryDate
    ${date}=  Get Current Date  result_format=%Y-%m-%d
    Input Text   ${entryDate_location}      ${date}
    
input_exitDate
    ${futureDate}=  Date Time Between  start_date=2017y  end_date=2018
    ${exitDate}=  Convert Date  ${futureDate}  result_format=%Y-%m-%d
    Input Text   ${exitDate_location}       ${exitDate}
    
reservation_Bedroom
    ${randomBedroom}=  Generate Random String  1  257684
    Select From List By Value  ${reservation_bedroom_dropdown}  ${randomBedroom}
    
reservation_Client
    ${randomClient}=  Generate Random String  1  14562
    Select From List By Value  ${reservation_client_dropdown}  ${randomClient}
    
reservation_Status
    ${randomStatus}=  Generate Random String  1  1234
    Select From List By Value  ${reservation_status_dropdown}  ${randomStatus}
    
reservation_verifyEntryDate
    ${dateVerify}=  Get Current Date  result_format=%Y/%m/%d
    Element Text Should Be  ${edit_reservation_entryDate_location}  ${dateVerify}
    
input_randomName
    ${name}=  Generate Random String  8  [LOWER]
    Should Be Lowercase  ${name}
    Input Text  ${create_new_client_nameField}    ${name}
    
input_randomEmail
    ${email}=  Generate Random String  10  [LETTERS]
    Should Be String  ${email}
    Input Text  ${create_new_client_emailField}    ${email}
    
input_randomSocialSecurityNumber
    ${number}=  Generate Random String  10  [NUMBERS]
    Should Be String  ${number}
    Input Text  ${create_new_client_socialSecurityNumber}    ${number}
    
client_createdVerification
    Element Text Should Be  ${create_new_client_clientCreatedVerify}  ${verifyClientCreatedText}
     
client_deletedVerification
    Element Text Should Be  ${create_new_client_clientDeleted}  ${verifyClientDeletedText}
*** Settings ***
Resource    ../resources/loginKeywords.robot
Resource    ../resources/contactKeywords.robot

*** Variables ***
${URL}    https://thinking-tester-contact-list.herokuapp.com/
${BROWSER}    chrome
${USERNAME}    acn@acn1.com
${PASSWORD}    123456Acn*
${FIRST_NAME}  Muhammed
${LAST_NAME}   Topcuu
${PHONE}       05551234567

*** Test Cases ***
Verify User Can Add New Contact
   [Documentation]    To verify that the user can add a new contact with valid details
   Go To Homepage    ${URL}    ${BROWSER}
   Enter Username    ${USERNAME}
   Enter Password    ${PASSWORD}
   Click Submit Button
   Login Should Be Successful
   Click Add Contact Button
   Enter First Name    ${FIRST_NAME}
   Enter Last Name    ${LAST_NAME}
   Enter Phone Number    ${PHONE}
   Click Save Button
   Verify Contact Is Added    ${FIRST_NAME}    ${LAST_NAME}    ${PHONE}
*** Settings ***
Resource    ../resources/loginKeywords.robot
Resource   ../resources/robot_resources.yaml

*** Variables ***
${URL}    https://thinking-tester-contact-list.herokuapp.com/
${BROWSER}    chrome
${USERNAME}    acn@acn1.com
${PASSWORD}    123456Acn*

*** Test Cases ***
Verify User Can Log In With Valid Credentials
   [Documentation]    To verify that the user can log in with valid credentials
   Go To Homepage    ${URL}    ${BROWSER}
   Enter Username    ${USERNAME}
   Enter Password    ${PASSWORD}
   Click Submit Button
   Login Should Be Successful


   ##setup, teardown, variables will be moved.
   #from yaml
   #python to robot keywords.
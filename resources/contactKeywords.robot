*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Click Add Contact Button
   Click Button    id=add-contact

Enter First Name
   [Arguments]    ${first_name}
   Input Text    id=firstName    ${first_name}

Enter Last Name
   [Arguments]    ${last_name}
   Input Text    id=lastName    ${last_name}

Enter Phone Number
   [Arguments]    ${phone}
   Input Text    id=phone    ${phone}

Click Save Button
   Click Button    id=submit

Verify Contact Is Added
   [Arguments]    ${first_name}    ${last_name}    ${phone}
   ${full_name}=    Set Variable    ${first_name} ${last_name}
   Wait Until Element Is Visible    xpath=//tr[contains(@class, 'contactTableBodyRow') and td[contains(text(),'${full_name}')] and td[contains(text(),'${phone}')]]
   Page Should Contain Element    xpath=//tr[contains(@class, 'contactTableBodyRow') and td[contains(text(),'${full_name}')] and td[contains(text(),'${phone}')]]
*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Go To Homepage
   [Arguments]    ${url}    ${browser}
   Open Browser   ${url}    ${browser}
   Maximize Browser Window

Enter Username
   [Arguments]    ${username}
   Input Text    id=email    ${username}

Enter Password
   [Arguments]    ${password}
   Input Text    id=password    ${password}

Click Submit Button
   Click Button    id=submit

Login Should Be Successful
   Wait Until Element Is Visible    xpath=//h1[text()='Contact List']
   Page Should Contain Element    xpath=//h1[text()='Contact List']

Close Browser
   Close Browser


Create WebDriver With Options
   [Arguments]    ${browser}
   ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
   Call Method    ${chrome_options}    add_argument    --disable-web-security
   Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
   Call Method    ${chrome_options}    add_argument    --allow-running-insecure-content
   ${webdriver}=    Create WebDriver    ${browser}    chrome_options=${chrome_options}
   Maximize Browser Window
   [Return]    ${webdriver}

Go To Homepage with WebDriver
   [Arguments]    ${url}    ${browser}
   ${webdriver}=    Create WebDriver With Options    ${browser}
   Go To    ${url}
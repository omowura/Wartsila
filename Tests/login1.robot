*** Settings ***
Documentation                                               Task
Library                                                     SeleniumLibrary
Library                                                     Collections
Test Teardown                                               Close Browser

*** Variables ***
${VALID_EMAIL}    login@codility.com
${VALID_PASSWORD}     password
${INVALID_EMAIL}     unknown@codility.com
${INVALID_PASSWORD}     password
${URL}       https://codility-frontend-prod.s3.amazonaws.com/media/task_static/qa_robot_login_page/9a83bda125cd7398f9f482a3d6d45ea4/static/attachments/reference_page.html
${BROWSER}     chrome
${EMAIL}                 id:email-input
${PASSWORD}              id:password-input
${LOGIN_BUTTON}          id:login-button



*** Test Cases ***
Validate email and password fields on the main screen
       Open browser     ${URL}      ${BROWSER}
       Page Should Contain Textfield     ${EMAIL}
       Page Should Contain Textfield   ${PASSWORD}


Valid Login Page
      Open browser          ${URL}      ${BROWSER}
      Input Text          ${EMAIL}           login@codility.com
      Input Text          ${PASSWORD}        password
      Click button        ${LOGIN_BUTTON}
      Page should contain         Welcome to Codility

Vaidate unsuccessful login attempt
      Open browser              ${URL}      ${BROWSER}
      Input Text    ${EMAIL}           unknown@codility.com
      Input Text   ${PASSWORD}        password
      Click Element   ${LOGIN_BUTTON}
      Page should contain         You shall not pass!


Invalid login
        [Template]      Login with wrong credentials
        ${EMPTY}                password                Email is required
        login@codility.com      ${EMPTY}                Password is required


*** Keywords ***
Login with wrong credentials
        [Arguments]       ${username}       ${password}         ${errormessage}
        Open Browser      ${URL}      ${BROWSER}
        Input Text        id:email-input      ${username}
        Input Text        id:password-input     ${password}
        Click Element      id:login-button
        Page should contain        ${errormessage}
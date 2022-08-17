
*** Settings ***
Documentation                                               Task
Library                                                     SeleniumLibrary
Library                                                     Collections
Test Template                                               Validate UnSuccesful Login
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



*** Test Cases ***      email                           password
Invalid email           unknown                         password


*** Keywords ***
Validate UnSuccesful Login
         [Arguments]                    ${username}         ${password}
         Open browser                   ${URL}              ${BROWSER}
         Input Text                     id:email-input      ${username}
         Input Text                     id:password-input   ${password}
         Click Element                  id:login-button
         Page Should Contain            Enter a valid email

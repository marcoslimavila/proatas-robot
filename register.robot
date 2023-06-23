*** Settings ***
Library         AppiumLibrary    run_on_failure=No Operation
# Library    SeleniumLibrary    run_on_failure=AppiumLibrary.CapturePageScreenshot
Library         FakerLibrary
Variables       ./pageObjects/Locators/Locators.py

*** Variables ***
${SERVER_URL}       http://localhost:4723/wd/hub
${WAIT_TIMEOUT}     15s
${LONG_TIMEOUT}     30s
${USER_CPF}         40742968022
${USER_NAME}        Johnny Zest
${USER_PHONE}       34991438534
${USER_EMAIL}       johnnyzestteste@gmail.com

*** Test Cases ***
Cadastro de Usuário
    Open Application    ${SERVER_URL}
    ...    automationName=UiAutomator2
    ...    platformName=Android
    ...    deviceName=Teste
    ...    app=${EXECDIR}/app/app-release.apk
    # ...    udid=emulator-5554
    ...    udid=R9HT904MYRP

    Wait Until Element Is Visible    ${BtnStart}    timeout=${WAIT_TIMEOUT}
    Click Element    ${BtnStart}

    Wait Until Element Is Visible    ${InputCPF}    timeout=${WAIT_TIMEOUT}
    Input Text    ${InputCPF}    ${USER_CPF}

    Wait Until Element Is Visible    ${BtnRegister}    timeout=${WAIT_TIMEOUT}
    Click Element    ${BtnRegister}

    Wait Until Element Is Visible    ${BtnTerms}    timeout=${WAIT_TIMEOUT}
    Click Element    ${BtnTerms}

    Wait Until Element Is Visible    ${InputName}    timeout=${WAIT_TIMEOUT}
    Input Text    ${InputName}    ${USER_NAME}

    Wait Until Element Is Visible    ${InputPhone}    timeout=${WAIT_TIMEOUT}
    Input Text    ${InputPhone}    ${USER_PHONE}

    Wait Until Element Is Visible    ${InputEmail}    timeout=${WAIT_TIMEOUT}
    Input Text    ${InputEmail}    ${USER_EMAIL}

    Wait Until Element Is Visible    ${BtnContinue}    timeout=${WAIT_TIMEOUT}
    Click Element    ${BtnContinue}

    Wait Until Element Is Visible    ${BtnTakeAPicture}    timeout=${WAIT_TIMEOUT}
    Click Element    ${BtnTakeAPicture}

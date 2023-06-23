*** Settings ***
Library         AppiumLibrary    run_on_failure=No Operation
# Library    SeleniumLibrary    run_on_failure=AppiumLibrary.CapturePageScreenshot
Variables       ./pageObjects/Locators/Locators.py


*** Variables ***
${SERVER_URL}                   http://localhost:4723/wd/hub
${WAIT_TIMEOUT}                 15s
${LONG_TIMEOUT}                 30s
${USER_CPF}                     60035497009
${USER_PASSWORD}                8452123
${USER_NAME}                    Johnny Zest
${USER_FATHERS_NAME}            Godofredo Landgraab
${USER_MOTHERS_NAME}            Nancy Landgraab
${USER_BIRTHDAY_DATE}           15/09/1985
${USER_PHONE}                   34998767884
${USER_EMAIL}                   johnnyzestteste@gmail.com
${USER_RG_NUMBER}               26.558.303-2
${USER_RG_DATE_DISPATCH}        04/07/2000
${USER_RG_ISSUING_AGENCY}       PC
${USER_RG_UF}                   ${EMPTY}


*** Test Cases ***
Cadastro de Usuário
    Open Application    ${SERVER_URL}
    ...    automationName=UiAutomator2
    ...    platformName=Android
    ...    deviceName=Teste
    ...    app=${EXECDIR}/app/app-release.apk
    ...    udid=emulator-5554
    # ...    udid=R9HT904MYRP

    Wait Until Element Is Visible    ${BtnStart}    timeout=${WAIT_TIMEOUT}
    Click Element    ${BtnStart}

    Wait Until Element Is Visible    ${InputCPF}
    Input Text    ${InputCPF}    ${USER_CPF}

    Wait Until Element Is Visible    ${InputPassword}
    Input Text    ${InputPassword}    ${USER_PASSWORD}}

    Wait Until Element Is Visible    ${BtnContinueLogin}    timeout=${LONG_TIMEOUT}
    Click Element    ${BtnContinueLogin}

    Close Application

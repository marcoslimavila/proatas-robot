*** Settings ***
Library         AppiumLibrary    run_on_failure=No Operation
# Library    SeleniumLibrary    run_on_failure=AppiumLibrary.CapturePageScreenshot
Variables       ./pageObjects/Locators/Locators.py

*** Variables ***
${SERVER_URL}                   http://localhost:4723/wd/hub
${WAIT_TIMEOUT}                 15s
${LONG_TIMEOUT}                 30s
${USER_CPF}                     82611104000
${USER_NAME}                    Johnny Zest
${USER_FATHERS_NAME}            Godofredo Landgraab
${USER_MOTHERS_NAME}            Nancy Landgraab
${USER_BIRTHDAY_DATE}           15/09/1985
${USER_PHONE}                   34998767884
${USER_EMAIL}                   johnnyzestteste@gmail.com
${USER_RG_NUMBER}               26.558.303-2
${USER_RG_DATE_DISPATCH}        04/07/2000
${USER_RG_ISSUING_AGENCY}       PC
${USER_RG_UF}                   MG


*** Test Cases ***
Cadastro de Usuário
    Open Application    ${SERVER_URL}
    ...    automationName=UiAutomator2
    ...    platformName=Android
    ...    deviceName=Teste
    ...    app=${EXECDIR}/app/app-release.apk
    # ...    udid=emulator-5554
    ...    udid=R9HT904MYRP

    Wait Until Element Is Visible
    ...    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.View/android.view.View[3]
    ...    timeout=${WAIT_TIMEOUT}
    Click Element
    ...    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.View/android.view.View[3]

    Wait Until Element Is Visible    ${InputUserName}
    Input Text    ${InputUserName}    ${USER_NAME}

    Wait Until Element Is Visible    ${InputCPF}
    Input Text    ${InputCPF}    ${USER_CPF}

    Wait Until Element Is Visible    ${InputFatherName}
    Input Text    ${InputFatherName}    ${USER_FATHERS_NAME}

    Wait Until Element Is Visible    ${InputMotherName}
    Input Text    ${InputMotherName}    ${USER_MOTHERS_NAME}

    Swipe    0    950    0    100    duration=1000

    Wait Until Element Is Visible    ${InputBirthdayDate}
    Input Text    ${InputBirthdayDate}    ${USER_BIRTHDAY_DATE}

    Wait Until Element Is Visible    ${InputRGNumber}
    Input Text    ${InputRGNumber}    ${USER_RG_NUMBER}

    Wait Until Element Is Visible    ${InputRGDateDispatch}
    Input Text    ${InputRGDateDispatch}        ${USER_RG_DATE_DISPATCH}

    Wait Until Element Is Visible    ${InputRGIssuingAgency}
    Input Text    ${InputRGIssuingAgency}       ${USER_RG_ISSUING_AGENCY}

    Wait Until Element Is Visible    ${InputRGDUF}
    Click Element    ${InputRGDUF}
    # Wait Until Element Is Visible    ${Panel}
    Click Element    xpath=//*[contains(text(), '${USER_RG_UF}')]

    Wait Until Element Is Visible    ${BtnSalvar}    timeout=${LONG_TIMEOUT}
    Click Element    ${BtnSalvar}

    Close Application

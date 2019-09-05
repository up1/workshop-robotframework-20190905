*** Settings ***
Library  SeleniumLibrary
Library  String
Suite Setup  เข้า web google
Test Teardown  กลับไปยังหน้าแรก
Suite Teardown  Close Browser

*** Variables ***
${URL}  http://www.google.com

*** Test Cases ***
ค้นหาคำว่า robot
    [Tags]  done
    ค้นหาคำว่า    robot
    ต้องเจอคำว่า robot

ค้นหาคำว่า thai
    [Tags]  testing
    ค้นหาคำว่า   thai
    ต้องเจอคำว่า robot

*** Keywords ***
กลับไปยังหน้าแรก
    Go To  ${URL}

เข้า web google
    Open Browser   ${URL}
    ...  browser=chrome
    Capture Page Screenshot

ต้องเจอคำว่า robot
    Wait Until Element Contains  id:resultStats   ผลการค้นหาประมาณ
    ${result}=  Get Text  id:resultStats
    Log To Console  ${result}

    @{words}=  Split String  ${result}  ${SPACE}
    Should Be Equal  @{words}[0]  ผลการค้นหาประมาณ
    Should Not Be Empty  @{words}[1]
    Should Be Equal  @{words}[2]  รายการ
    Should Not Be Empty  @{words}[3]

ค้นหาคำว่า
    [Arguments]  ${keyword}
    Input Text  name:q  ${keyword}
    Press Keys  name:q  RETURN
    

*** Settings ***
Library         SeleniumLibrary
Library         String
Suite Setup     เข้า web google
Suite Teardown  Close Browser

*** Variables ***
${URL}  http://www.google.com

*** Test Cases ***
XXXX
    [Template]  Flow success to search from google 
    #----------|----------|
      robot      robot
      thai       thai

*** Keywords ***
Flow success to search from google 
    [Arguments]  ${keyword}   ${expected result}
    Search ${keyword} shoud be found ${expected result}

Search ${keyword} shoud be found ${expected result}
    ค้นหาคำว่า    ${keyword}  
    ต้องเจอคำว่า robot
    กลับไปยังหน้าแรก

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
    

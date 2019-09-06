*** Settings ***
Resource        resources/sample.robot
Suite Setup     เข้า web google
Test Teardown   กลับไปยังหน้าแรก
Suite Teardown  Close Browser
Test Template   Search ${keyword} shoud be found ${expected result} 

*** Test Cases ***
#----------|----------|----------|
Case 01       robot      robot
Case 02       thai       thai

*** Keywords ***
Flow success to search from google 
    [Arguments]  ${keyword}   ${expected result}
    Search ${keyword} shoud be found ${expected result}

Search ${keyword} shoud be found ${expected result}
    ค้นหาคำว่า    ${keyword}  
    ต้องเจอคำว่า robot
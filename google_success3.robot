*** Settings ***
Resource        resources/sample.robot
Suite Setup     sample.เข้า web google
Suite Teardown  Close Browser

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
    sample.ค้นหาคำว่า    ${keyword}  
    sample.ต้องเจอคำว่า robot
    sample.กลับไปยังหน้าแรก
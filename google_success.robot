*** Settings ***
Resource        resources/sample.robot
Suite Setup  เข้า web google
Test Teardown  กลับไปยังหน้าแรก
Suite Teardown  Close Browser

*** Test Cases ***
ค้นหาคำว่า robot
    [Tags]  done
    ค้นหาคำว่า    robot
    ต้องเจอคำว่า robot

ค้นหาคำว่า thai
    [Tags]  testing
    ค้นหาคำว่า   thai
    ต้องเจอคำว่า robot
    

*** Settings ***
Library   SeleniumLibrary
Test Teardown  Close Browser

*** Variable ***
${UPLOAD FILE ELEMENT}   xpath://div[2]/div[1]/input[2]

*** Test Cases ***
ทำการ upload 3 ไฟล์ โดย upload ครั้งละไฟล์
    เข้าไปยังหน้า upload ไฟล์
    ทำการเลือกไฟล์จำนวน 3 ไฟล์
    ทำการ upload ไฟล์ image01.png
    ทำการ upload ไฟล์ image02.png
    ทำการ upload ไฟล์ image03.png
    ผลการ upload สำเร็จ

*** Keywords ***
ผลการ upload สำเร็จ
    Wait Until Page Contains Element 
    ...  xpath://div/div[@style="width: 100%;"]

ทำการ upload ไฟล์ image01.png
    Click Element  xpath://table/tbody/tr[1]/td[5]/button[1]
    Wait Until Page Contains Element 
    ...  xpath://table/tbody/tr[1]/td[4]/span[3]/i[@class="glyphicon glyphicon-remove"]  

ทำการ upload ไฟล์ image02.png
    Click Element  xpath://table/tbody/tr[2]/td[5]/button[1]
    Wait Until Page Contains Element 
    ...  xpath://table/tbody/tr[2]/td[4]/span[3]/i[@class="glyphicon glyphicon-remove"]  

ทำการ upload ไฟล์ image03.png
    Click Element  xpath://table/tbody/tr[3]/td[5]/button[1]
    Wait Until Page Contains Element 
    ...  xpath://table/tbody/tr[3]/td[4]/span[3]/i[@class="glyphicon glyphicon-remove"]  

ทำการเลือกไฟล์จำนวน 3 ไฟล์
    Choose File  ${UPLOAD FILE ELEMENT}
    ...  ${CURDIR}/data_test/image01.png
    Choose File  ${UPLOAD FILE ELEMENT}
    ...  ${CURDIR}/data_test/image02.png
    Choose File  ${UPLOAD FILE ELEMENT}
    ...  ${CURDIR}/data_test/image03.png

    Wait Until Element Contains
    ...  xpath://table/tbody/tr[1]/td[1]/strong
    ...  image01.png

    Wait Until Element Contains
    ...  xpath://table/tbody/tr[2]/td[1]/strong
    ...  image02.png

    Wait Until Element Contains
    ...  xpath://table/tbody/tr[3]/td[1]/strong
    ...  image03.png

เข้าไปยังหน้า upload ไฟล์
    Open Browser   http://nervgh.github.io/pages/angular-file-upload/examples/simple/
    ...  browser=chrome
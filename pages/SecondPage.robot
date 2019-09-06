*** Keywords ***
กรอกข้อมูลหมายเลชบัตรประชาชน
    [Arguments]  ${id}
    Input Text   id:fld_nid   ${id}

กรอกข้อมูลชื่อ
    [Arguments]  ${firstName}  ${middleName}  ${lastName}
    Input Text   id:fld_firstName   ${firstName}
    Input Text   id:fld_midName   ${middleName}
    Input Text   id:fld_lastName   ${lastName}

กรอกข้อมูลวันเกิด
    [Arguments]  ${birthDate}
    Input Text   id:fld_birth_date   ${birthDate}

ตอบคำถามว่าชอบไปที่ไหนมากที่สุด
    Select From List By Value  id:fld_question  2
    Input Text   id:fld_answer   xxxxx

กดปุ่ม OK
    Click Element  name:bOK1

ตรวจสอบ error message ว่าต้องเป็นกรณี E059
    ${message}=  Handle Alert  LEAVE
    Log To Console  ${message}
    Alert Should Be Present   ข้อความปฏิเสธ [E059] :${SPACE*2}ชื่อ หรือชื่อกลาง หรือชื่อสกุล ไม่ตรงกับข้อมูลในฐานข้อมูลกรมสรรพากร โปรดตรวจสอบ หรือติดต่อศูนย์สารนิเทศสรรพากร โทรศัพท์ 1161

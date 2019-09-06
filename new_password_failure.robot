*** Settings ***
Library  SeleniumLibrary

*** Test Case ***
คุณสมเกียรติ สัญชาติไทย ขอ password ใหม่ไม่สำเร็จ
    เลือกประเภทการลงทะเบียน(เพื่อตั้งรหัสผ่านใหม่)และสัญชาติไทย
    กรอกข้อมูลข้อมูลส่วนบุคคล
    ตอบคำถามที่เลือกไว้
    ส่งข้อมูลเพื่อขอ password ใหม่
    ผลการขอ password ใหม่ไม่ผ่าน เพราะว่า ชื่อและนามสกุลไม่ตรงกับที่บันทึกไว้ 

*** Keywords ***
ผลการขอ password ใหม่ไม่ผ่าน เพราะว่า ชื่อและนามสกุลไม่ตรงกับที่บันทึกไว้ 
    ${message}=  Handle Alert  LEAVE
    Log To Console  ${message}
    Alert Should Be Present   ข้อความปฏิเสธ [E059] :${SPACE*2}ชื่อ หรือชื่อกลาง หรือชื่อสกุล ไม่ตรงกับข้อมูลในฐานข้อมูลกรมสรรพากร โปรดตรวจสอบ หรือติดต่อศูนย์สารนิเทศสรรพากร โทรศัพท์ 1161

ส่งข้อมูลเพื่อขอ password ใหม่
    Click Element  name:bOK1

ตอบคำถามที่เลือกไว้
    Select From List By Value  id:fld_question  2
    Input Text   id:fld_answer   xxxxx

กรอกข้อมูลข้อมูลส่วนบุคคล
    Input Text   id:fld_nid   1111111111111
    Input Text   id:fld_firstName   aaaa
    Input Text   id:fld_midName   ${EMPTY}
    Input Text   id:fld_lastName   aaaa
    Input Text   id:fld_birth_date   10102500

เลือกประเภทการลงทะเบียน(เพื่อตั้งรหัสผ่านใหม่)และสัญชาติไทย
    Open Browser   https://epit.rd.go.th/EFILING/RegController?PRGID=R008T
    ...  browser=chrome
    Click Element  name:link_RegType1

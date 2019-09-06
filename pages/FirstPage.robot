*** Keywords ***
Open first page
    Open Browser   https://epit.rd.go.th/EFILING/RegController?PRGID=R008T
    ...  browser=chrome

เลือกบุคคลธรรมดาและสัญชาติไทย
    Click Element  name:link_RegType1
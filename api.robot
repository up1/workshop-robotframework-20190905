*** Settings ***
Library  RequestsLibrary

*** Test Case ***
#https://jsonplaceholder.typicode.com/users
Success with /users
    Create Session   jph  https://jsonplaceholder.typicode.com
    ${response}=  Get Request  jph  /users
    Should Be Equal   ${response.status_code}  ${200}

    ${json}=  Set Variable  ${response.json()}
    Length Should Be   ${json}  10

    ${length}=  Get Length  ${json}
    Should Be Equal   ${length}  ${10}

    Should Be Equal   ${json[0]["name"]}  Leanne Graham
    Should Be Equal   ${json[0]["username"]}  Bret

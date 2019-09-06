*** Settings ***
Library   SeleniumLibrary

*** Test Case ***
Case 01
    Open Browser   https://rdserver.rd.go.th/publish/index.php
    ...  browser=chrome
    Click Element   xpath://*[@id="centerappList"]/div/a[2]
    Wait Until Element Is Visible   xpath://*[@id="lightboxdialog"]
    Select Frame  xpath=//*[@id="lightboxdialog"]/p/iframe
    Click Element   xpath:/html/body/p/table[3]/tbody/tr/td/a
    Unselect Frame
    Click Element  xpath://*[@id="lightboxdialog"]/button
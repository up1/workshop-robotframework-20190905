*** Settings ***
Library  FakerLibrary

*** Test Case ***
Test
    FOR  ${index}  IN RANGE  10
        ${ccn}=  Credit Card Number
        Log To Console  ${index} =>${ccn}
    END
    
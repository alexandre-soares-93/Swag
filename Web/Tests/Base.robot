*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}              https://www.saucedemo.com/

*** Keywords ***
Nova Sessão
   Open Browser                    ${url}              chrome

Encerra Sessão
   Capture Page Screenshot
   Close Browser 
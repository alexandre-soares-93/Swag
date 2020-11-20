*** Settings ***
Resource        base.robot

Test Setup      Nova Sessão
Test Teardown   Encerra Sessão

*** Variables ***
${usuario}              id:user-name 
${senha}                id:password
${bt-login}             id:login-button
${login_bloq}           xpath://button[@class="error-button"]

*** Test Cases ***
Efetuando login com usuario e senha valida
    Input Text              ${usuario}          standard_user
    Input Text              ${senha}            secret_sauce
    Click Button            ${bt-login}
    Title Should Be                             Swag Labs

Login com usuario bloqueado
    Input Text              ${usuario}          locked_out_user
    Input Text              ${senha}            secret_sauce
    Click Button            ${bt-login}
    ${erro}                 Get WebElement      ${login_bloq}

Login com senha invalida
    Input Text              ${usuario}          locked_out_user
    Input Text              ${senha}            senha_invalida
    Click Button            ${bt-login}      
    ${erro}                 Get WebElement      ${login_bloq}

Login com usuario invalido
    Input Text              ${usuario}          usuario_invalido
    Input Text              ${senha}            secret_sauce
    Click Button            ${bt-login}      
    ${erro}                 Get WebElement      ${login_bloq}

Login com usuario e senha invalidas
    Input Text              ${usuario}          usuario_invalido
    Input Text              ${senha}            senha_invalida
    Click Button            ${bt-login}      
    ${erro}                 Get WebElement      ${login_bloq}

Login sem preencher senha
    Input Text              ${usuario}          standard_user
    Click Button            ${bt-login}      
    ${erro}                 Get WebElement      ${login_bloq}

Login sem preencher login
    Input Text              ${senha}            secret_sauce
    Click Button            ${bt-login}      
    ${erro}                 Get WebElement      ${login_bloq}

Login sem preencher login e senha
    Click Button            ${bt-login}      
    ${erro}                 Get WebElement      ${login_bloq}
*** Settings ***
Resource        base.robot

Test Setup      Nova Sessão
Test Teardown   Encerra Sessão

*** Variables ***
${usuario}              id:user-name 
${senha}                id:password
${bt-login}             id:login-button
${bt-addcompra}         css:button[class="btn_primary btn_inventory"]
${bt-carrinho}          id:shopping_cart_container
${checkout}             xpath://a[@href="./checkout-step-one.html"]
${nome}                 id:first-name
${sobrenome}            id:last-name
${CEP}                  id:postal-code
${continua}             xpath://input[@value="CONTINUE"]
${fim_compra}           xpath://a[@href="./checkout-complete.html"]
${sale}                 xpath://h2[@class="complete-header"]

*** Test Cases ***
Efetuando a compra de mochila
    Input Text              ${usuario}          standard_user
    Input Text              ${senha}            secret_sauce
    Click Button            ${bt-login}
    Click Element           ${bt-addcompra}
    Click Element           ${bt-carrinho}
    Click Element           ${checkout}
    Input Text              ${nome}             Eliud
    Input Text              ${sobrenome}        Kipchoge
    Input Text              ${CEP}              06230020
    Click Button            ${continua}
    Click Element           ${fim_compra}
    ${compra}               Get WebElement      ${sale} 



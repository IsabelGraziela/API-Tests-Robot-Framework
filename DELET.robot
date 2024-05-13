** Settings **
Library  RequestsLibrary
Library  String

*** Variables ***
${HOST}    https://dummyjson.com

#Rotas
${DELETE_PRODUCT}    products/idProduct/delete

*** Keywords ***
Delete Product by ${id}
    &{headers}    Create Dictionary    Content-type=application/json
    ${DELETE_PRODUCT}=    Replace String    ${DELETE_PRODUCT}    idProduct/delete    ${id}
    DELETE  url=${HOST}/${DELETE_PRODUCT}    headers=&{headers}
** Test Cases **
CENÁRIO 01
    Delete Product by 10
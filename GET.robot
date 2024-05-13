** Settings **
Library  RequestsLibrary
Library  String

*** Variables ***
${HOST}    https://dummyjson.com

#Rotas
${GET_PRODUCTS}    products
${GET_ONE_PRODUCT}    idProduct
*** Keywords ***
Get All Products
    &{headers}    Create Dictionary    Content-type=application/json

     GET  url=${HOST}/${GET_PRODUCTS}    headers=&{headers}

Get Product by id ${id}
    &{headers}    Create Dictionary    Content-type=application/json
    
    ${GET_ONE_PRODUCT}=    Replace String    ${GET_ONE_PRODUCT}    idProduct    ${id}
    
    GET  url=${HOST}/${GET_PRODUCTS}/${GET_ONE_PRODUCT}    headers=&{headers}

** Test Cases **
CENÁRIO 01
    Get All Products

CENÁRIO 02
    Get Product by id 3
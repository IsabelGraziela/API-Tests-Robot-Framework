** Settings **
Library  RequestsLibrary
Library  String

*** Variables ***
${HOST}    https://dummyjson.com

#Rotas
${GET_PRODUCTS}    products
${GET_ONE_PRODUCT}    idProduct
${DELETE_PRODUCT}    idProduct/delete

*** Keywords ***
Get Product by id ${id}
    &{headers}    Create Dictionary    Content-type=application/json
    
    ${GET_ONE_PRODUCT}=    Replace String    ${GET_ONE_PRODUCT}    idProduct    ${id}
    
    ${response}=    GET  url=${HOST}/${GET_PRODUCTS}/${GET_ONE_PRODUCT}    headers=&{headers}
    
    RETURN    ${response}   

Delete Product by ${id}
    &{headers}    Create Dictionary    Content-type=application/json
    ${DELETE_PRODUCT}=    Replace String    ${DELETE_PRODUCT}    idProduct/delete    ${id}
    ${response}=    DELETE  url=${HOST}/${GET_PRODUCTS}/${DELETE_PRODUCT}    headers=&{headers}
    RETURN    ${response}

** Test Cases **
CENÁRIO 01
    ${responseRequest}  Get Product by id 3
    Should Be Equal As Strings    ${responseRequest.status_code}    200

    Should Be Equal As Strings    ${responseRequest.json()["title"]}    Samsung Universe 9
    Should Be Equal As Strings    ${responseRequest.json()["price"]}    1249
    Log    ${responseRequest.json()}
    Log    ${responseRequest.json()["title"]}

Cenário 02
    ${response}    Delete Product by 9
    Should Be True    ${response.json()["isDeleted"]}
    Log    ${response.json()}



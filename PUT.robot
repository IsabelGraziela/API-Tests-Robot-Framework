** Settings **
Library  RequestsLibrary
Library  String

*** Variables ***
${HOST}    https://dummyjson.com

#Rotas
${UPDATE_PRODUCT}    products/idProduct

*** Keywords ***
Update Product
    [Arguments]    ${id}    ${title}   ${description}    ${price}    ${brand}    ${category}
    &{headers}    Create Dictionary    Content-type=application/json
    &{body}    Create Dictionary    title=${title}   description=${description}    price=${price}    brand=${brand}    category=${category}

    ${UPDATE_PRODUCT}=    Replace String    ${UPDATE_PRODUCT}    idProduct    ${id}
    Put  url=${HOST}/${UPDATE_PRODUCT}    headers=&{headers}    json=&{body}

** Test Cases **
CENÁRIO 01
    Update Product   id=80     title=Galaxy Isa    description=novo celular isa     price=6521    brand=Samsung    category=smartphones
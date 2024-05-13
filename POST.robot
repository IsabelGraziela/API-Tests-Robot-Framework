** Settings **
Library  RequestsLibrary
Library  String

*** Variables ***
${HOST}    https://dummyjson.com

#Rotas
${ADD_PRODUCT}    products/add


*** Keywords ***
Add Product
    [Arguments]    ${title}   ${description}    ${price}    ${brand}    ${category}
    &{headers}    Create Dictionary    Content-type=application/json
    &{body}    Create Dictionary    title=${title}   description=${description}    price=${price}    brand=${brand}    category=${category}

     POST  url=${HOST}/${ADD_PRODUCT}    headers=&{headers}    json=&{body}

 
** Test Cases **
CENÁRIO 01
    Add Product    title=Galaxy Isa    description=novo celular isa     price=6521    brand=Samsung    category=smartphones

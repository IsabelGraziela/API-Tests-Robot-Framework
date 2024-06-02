*** Settings ***
Library         RequestsLibrary
Library         String
Library         ExcelLibrary.py
Library         SeleniumLibrary

*** Variables ***
${HOST}          https://dummyjson.com
${EXCEL_FILE}    C:\\Projetos\\API Tests Robot Framework\\Massa de teste.xlsx
${SHEET_NAME}    Planilha1
${START_CELL}    A2
${END_CELL}      F2
${TARGET_SHEET}  Planilha2

# Rotas
${UPDATE_PRODUCT}    products/idProduct

*** Keywords ***
Update Product
    [Arguments]    ${id}    ${title}    ${description}    ${price}    ${brand}    ${category}
    &{headers}    Create Dictionary    Content-type=application/json
    &{body}    Create Dictionary    title=${title}    description=${description}    price=${price}    brand=${brand}    category=${category}

    ${str_id}=    Convert To String    ${id}
    ${UPDATE_PRODUCT}=    Replace String    ${UPDATE_PRODUCT}    idProduct    ${str_id}
    ${responseRequest}=    Put    url=${HOST}/${UPDATE_PRODUCT}    headers=&{headers}    json=&{body}
    ${status_code}=    Set Variable    ${responseRequest.status_code}
    RETURN    ${responseRequest}    ${status_code}

Write Start End to Excel
    [Arguments]    ${start}    ${end}    ${status_code}
    Write Cell Value    ${EXCEL_FILE}    ${TARGET_SHEET}    A2    ${start}
    Write Cell Value    ${EXCEL_FILE}    ${TARGET_SHEET}    B2    ${end}
    Write Cell Value    ${EXCEL_FILE}    ${TARGET_SHEET}    C2    ${status_code}

*** Test Cases ***
CENÁRIO 01
    ${start_time}=    Get Current Time
    ${values}=    Get Row Values    ${EXCEL_FILE}    ${SHEET_NAME}    ${START_CELL}    ${END_CELL}
    ${responseRequest}    ${status_code}=    Update Product    ${values[0]}    ${values[1]}    ${values[2]}    ${values[3]}    ${values[4]}    ${values[5]}
    Log    ${responseRequest.json()}
    Log    ${responseRequest.json()["title"]}
    Log    ${responseRequest.json()["description"]}
    Log    ${responseRequest.json()["price"]}
    ${end_time}=    Get Current Time
    Write Start End to Excel    ${start_time}    ${end_time}    ${status_code}



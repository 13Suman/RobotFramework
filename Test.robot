*** Settings ***
Library              Selenium2Library


*** Variables ***

${URL}                   https://www.flipkart.com/
${Browser}               chrome

#### Locators ####
${User_name}             //input[@class='_2zrpKA _1dBPDZ']
${password}              //input[@class='_2zrpKA _3v41xv _1dBPDZ']
${submit_button}         //button[@class='_2AkmmA _1LctnI _7UHT_c']
${home}                  //span[text()='Home & Furniture']
${paintings_link}        (//a[text()='Paintings'])[1]
${rslider}                //div[@class='_3G9WVX _2N3EuE']//div
${lslider}               //div[@class='_3G9WVX oVjMho']//div
${painting}              //a[contains(text(),'SHSWorks Seven Horses Framed (Ready To Hang) FengShui /...')]
${title}                 title=SHSWorks Seven Horses Framed (Ready To Hang) FengShui / Vaastu Artwork On Canvas 15 inch x 17 inch Painting Price in India - Buy SHSWorks Seven Horses Framed (Ready To Hang) FengShui / Vaastu Artwork On Canvas 15 inch x 17 inch Painting online at Flipkart.com
${buy_now}               //button[@type='button']
${delivery}              //div[@id='CNTCTDFA57390792640A6AAD1AF919']//button


*** Test Cases ***

Navigate to Web
   Launch browser and open home page
   Enter user name and password

Perform action on Paintings
   Select home and furnitures then on paintings
   Select range for paintings

Buy now cart
   Click on Buy Now Button


*** Keywords ***

Launch browser and open home page
  Open Browser      ${URL}        ${Browser}
  Set selenium implicit wait  10s
  set selenium speed            1s
  Maximize Browser Window

Enter user name and password
  wait until element is enabled   ${User_name}  5
  input text  ${User_name}   abc@gmail.com
  click element  ${password}
  input text  ${password}   abcd12345
  wait until element is enabled   ${submit_button}  5
  click button   ${submit_button}

Select home and furnitures then on paintings
  click element  ${home}
  wait until element is visible   ${paintings_link}  5
  click element     ${paintings_link}

Select range for paintings
  Wait Until Page Contains Element  ${lslider}  5
  drag and drop by offset      ${lslider}    59    0
  sleep    2
  drag and drop by offset      ${rslider}    -89    -1
  sleep   2
  Scroll Element Into View  ${painting}
  Click Element             ${painting}
  sleep   2

Click on Buy Now Button
   Switch Window             ${title}
   Scroll Element Into View  ${buy_now}
   Click Element             ${buy_now}
   #Wait Until Page Contains Element ${delivery}  5
   click element             ${delivery}
   sleep                      2
   close browser


  

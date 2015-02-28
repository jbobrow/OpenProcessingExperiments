
 String myString="Write in the text field";//the text from the inputElement
 boolean showExtension=true;// to toggle the html extension
 var htmlNode;// where we want to add the divElement too the page
 var divElement;//the html element containing the textfield
 
void setup() {
  size(320,200);
  smooth();
  createDivElement();//create the html element containing the textfield
}
   
void draw() {  background(255);
 divElement.style.backgroundColor = "#" //set the background color of the divElement, for the green flashing
 + (frameCount%100*2.4).toString(16) //R
 + (240).toString(16)//G
 + (frameCount%100*2.4).toString(16); //B 
 // RGB to htmlColor = # + (R).toString(16) +(G).toString(16) +(B).toString(16);
   fill(255);  rect(10,10,10,10);  fill(0);//draw a checkbox
     if(showExtension)text("x",13,19);//make the checkbox checked
      text("toggle html extension" ,25,19);//draw the description for the checkbox
      scale(2);    text(myString ,15,30);//draw the input text scaled
}
 void mousePressed(){
if(mouseX>10&&mouseX<20&&mouseY>10&&mouseY<20){//if the mouse is pressed inside the checkbox
    showExtension=!showExtension;//toggle showExtension
if(showExtension)   //add the divElement to the page
htmlNode.appendChild(divElement);//htmlNode.parentNode.insertBefore(textInputElement, htmlNode);
else //remove the divElement from the page
htmlNode.removeChild(divElement);//htmlNode.parentNode.removeChild(textInputElement);
    } }
    
void createDivElement(){
 divElement = document.createElement('div');//create a new div Element
 var textInputElement = document.createElement('textarea');//create a new textInputElement

     // htmlNode = document.getElementsByTagName('canvas')[0];// the canvas
     htmlNode =  parent.document.body.children[0];// the first element of the page

     divElement.style.padding="10px"; //set padding
     divElement.style.position="fixed";//make it fixed on page
     divElement.style.left="40%";//set the position
     divElement.style.top="50px";//set the position
     divElement.textContent="Write in the text field:";  //set the text
    // textInputElement.value=myString;  

       textInputElement.onkeyup = function (evt) {//add onkeyup event listener to the textInputElement
    // if(evt.keyCode == 13) //if Enter was pressed
    { myString=textInputElement.value; }//get the text from the input element
    }
    
    divElement.appendChild(document.createElement('p'));//add a margin to the divElement
    divElement.appendChild(textInputElement);//add the textInputElement to the divElement
    htmlNode.appendChild(divElement);//add the divElement to the page 
      }

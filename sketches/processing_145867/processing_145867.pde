
htmlElement divElement;//the html element containing the options
int backgroundcolor=#666666;
 
void setup() {
 size(320,320);
 noStroke();
 textSize(20);
 createDivElement();//create the html element containing the textfield
}
 
void draw() { background(backgroundcolor);
rect(10,80,20,20);
ellipse(mouseX,mouseY,20,20);
text("Move the mouse to the top\nto get some options",10,120);
}

void mouseMoved(){
if(mouseY<20)externals.canvas.parentNode.insertBefore(divElement, externals.canvas);
else externals.canvas.parentNode.removeChild(divElement);}

void createDivElement(){
 divElement = document.createElement('div');//create a new div Element
 divElement.textContent="Color:"; //set the text
 divElement.style.padding="20px"; //set padding
 divElement.appendChild(document.createElement('p'));//add a margin to the divElement

 htmlElement buttonAElement = document.createElement('input');//create a new textInputElement
 buttonAElement.type="radio";
 buttonAElement.name="myRadios";
 buttonAElement.onclick = function (evt) { if(buttonAElement.value=="on")backgroundcolor=#ff0000; }
 divElement.appendChild(buttonAElement);
 htmlElement buttonANameElement = document.createElement('span');
 buttonANameElement.innerHTML="&nbsp;Red&emsp;&emsp;&emsp;";
 divElement.appendChild(buttonANameElement);

 htmlElement checkBoxAElement = document.createElement('input');//create a new textInputElement
 checkBoxAElement.type="checkbox";
 checkBoxAElement.onclick = function (evt) {if(checkBoxAElement.checked){stroke(0);}else {noStroke();}}
 divElement.appendChild(checkBoxAElement);//add the textInputElement to the divElement
 htmlElement checkBoxANameElement = document.createElement('span');
 checkBoxANameElement.innerHTML="&nbsp;stroke&emsp;&emsp;&emsp;";
 divElement.appendChild(checkBoxANameElement);
  
 divElement.appendChild(document.createElement('p'));//add a margin to the divElement

 htmlElement buttonBElement = document.createElement('input');//create a new textInputElement
 buttonBElement.type="radio";
 buttonBElement.name="myRadios";
 buttonBElement.onclick = function (evt) { if(buttonBElement.value=="on")backgroundcolor=#00ff00; }
 divElement.appendChild(buttonBElement);//add the textInputElement to the divElement
 htmlElement buttonBNameElement = document.createElement('span');
 buttonBNameElement.innerHTML="&nbsp;Green&emsp;&emsp;&emsp;";
 divElement.appendChild(buttonBNameElement);
  

 externals.canvas.parentNode.style.textAlign="left";
 externals.canvas.parentNode.insertBefore(divElement, externals.canvas);
 }


String anotherSketchCode = "void setup(){\n size(200,200);\n}\nvoid draw(){\n background(0);\n text('fps: '+round(frameRate),10,10);\n ellipse(mouseX,mouseY,20,20);\n}";
String anotherSketchCodeCompiled = "";//The compiled js-code, only used for showing
htmlElement codeEditorElement;
htmlElement anotherSketchCanvas;
htmlElement anotherSketch;
boolean anotherSketchRunning;
  
void setup() { size(512,290);
 textSize(10);
 noStroke();
 runAnotherSketch();
 createCodeEditorElement();
anotherSketchCodeCompiled=Processing.compile(anotherSketchCode).sourceCode;
}
    
void draw() { background(70,80,110);
 fill(240);  rect(0,100,width,height-100);
  rect(16,80,220,19);
 ellipse(25,55,30,30);
 ellipse(60,55,30,30); 
  if (mouseY>100&&mouseY<height-30)   text("Edit the code in the html textarea under the sketch",20,20);
   if(anotherSketchRunning){ image(anotherSketch.get(),250,26,70,70);    if(mouseX>250&&mouseX<320&&mouseY>26&&mouseY<96) {
    if (mousePressed)anotherSketch.mousePressed=true;else anotherSketch.mousePressed=false;
 anotherSketch.mouseX=round(((mouseX-250)/70)*anotherSketch.width); anotherSketch.mouseY=round(((mouseY-26)/70)*anotherSketch.height); }
 text('anotherSketch fps: '+round(anotherSketch.frameRate),350,20);   text('anotherSketch mouseX: '+anotherSketch.mouseX,330,40);  text('anotherSketch mouseY: '+anotherSketch.mouseY,330,60);  text('anoth.. mousePressed: '+anotherSketch.mousePressed,330,80);   }
      
 float mDist=dist(25,55,mouseX,mouseY); if(mDist<15){//if the mouse is inside the run button
 text("Run",90,60); if (mousePressed){ stopAnotherSketch(); runAnotherSketch();}}
  
 mDist=dist(60,55,mouseX,mouseY); if(mDist<15){//if the mouse is inside the stop button
 text("Stop",90,60); if (mousePressed){ stopAnotherSketch(); }}
      
 fill(60); beginShape();vertex(20,48);vertex(34,55);vertex(20,62);endShape(CLOSE);
 rect(54,49,12,12);
 text("PJS javascript compiled code preview:",20,94);
 text(anotherSketchCodeCompiled,10,120);
 ellipse(mouseX,mouseY,5,5);
}
void runAnotherSketch() {
  anotherSketchCanvas = parent.document.body.children[0].appendChild(document.createElement("canvas"));
  anotherSketchCanvas.style.position="fixed";//make it fixed on page
  anotherSketchCanvas.style.left="10%";//set the position
  anotherSketchCanvas.style.top="10%";//set the position
  anotherSketch=new Processing(anotherSketchCanvas, anotherSketchCode);
  anotherSketchRunning=true;
}
  
void stopAnotherSketch() {if(!anotherSketchRunning)return;
 anotherSketch.noLoop();
 parent.document.body.children[0].removeChild(anotherSketchCanvas);
 anotherSketchRunning=false;
}
  
void createCodeEditorElement(){
 codeEditorElement = document.createElement('textarea');//create a new codeEditorElement
 codeEditorElement.innerHTML=anotherSketchCode;
 codeEditorElement.rows="7";
 codeEditorElement.cols="10";
 codeEditorElement.style.width="508px";

 codeEditorElement.onkeyup = function (evt) {  anotherSketchCode=codeEditorElement.value;    anotherSketchCodeCompiled=Processing.compile(anotherSketchCode).sourceCode; }
 
 codeEditorElement.onchange = function () {  anotherSketchCode=codeEditorElement.value;    anotherSketchCodeCompiled=Processing.compile(anotherSketchCode).sourceCode; }
 
// codeEditorElement.onblur= function () {  anotherSketchCode=codeEditorElement.value;    anotherSketchCodeCompiled=Processing.compile(anotherSketchCode).sourceCode; }
       
 externals.canvas.parentNode.style.textAlign="left";
// externals.canvas.parentNode.insertBefore(codeEditorElement, externals.canvas); 
 
iFrame iframePjs = parent.document.getElementById('iframePjs');
iframePjs.parentNode.appendChild(codeEditorElement);
iframePjs.parentNode.style.width="512px";

 } 
 


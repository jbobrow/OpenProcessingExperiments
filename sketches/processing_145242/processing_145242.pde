
 HTMLElement imgElement;//the html element containing the screenshot
 HTMLElement divElement;//the html element containing the imgElement
 boolean firstScreenCaptured=false;//will be switched to true if first screenshot was captured after everything is ready
 PImage capturedWebsite;

void setup() {
  size(320,340);
  smooth();
   fill(0);
  capturedWebsite=createImage(100,100,RGB);
  createDivElement();//create the html element containing the imgElement
loadExternalScript('https://github.com/niklasvh/html2canvas/releases/download/0.4.1/html2canvas.js', function(){//this will load an external js script (html2canvas) and add it to the website
    captureWebsite();//take the first screenshot after everything is ready
});
}

void draw() {  background(255);
 divElement.style.backgroundColor = "rgb("+frameCount%100*2.4+", 240, "+frameCount%100*2.4+")";// animate the background of the divElement
  if(firstScreenCaptured)   image(capturedWebsite,0,20,width,height-20);//draw the screenshot from the website if it was captured
  else text("please wait for the first screenshot" ,10,height/2);// else draw text info
    text("Screenshot from the website (click to update):" ,10,10);//draw the description for the checkbox
    ellipse((frameCount*3)%width,10,5,5);//draw a "animation pointer"
    ellipse(mouseX,mouseY,5,5);//draw a "mouse pointer"

imgElement.src=document.getElementsByTagName("canvas")[0].toDataURL("image/webp",0.7);// take a screenshot from the sketch and place it in our imgElement
}

void captureWebsite(){// this function requires external lib html2canvas, loaded before via loadExternalScript()
    html2canvas(parent.document.body, {  onrendered: function(canvasr) {    // parent.document.body.appendChild(canvasr);
capturedWebsite=loadImage(canvasr.toDataURL("image/webp",0.7)); firstScreenCaptured=true;}});
}

void mousePressed(){ if(firstScreenCaptured) captureWebsite();}
   
void createDivElement(){    
 divElement = document.createElement('div');//create a new div Element

 imgElement=document.createElement('img');//create a new image Element
imgElement.style.width="200px";//set the width of the image Element

     divElement.style.padding="20px"; //set padding
     divElement.style.position="fixed";//make it fixed on page
     divElement.style.left="10%";//set the position
     divElement.style.top="50px";//set the position
     divElement.textContent="Real-time screenshot from the sketch:";  //set the text
      
    divElement.appendChild(document.createElement('p'));//add a margin to the divElement
      divElement.appendChild(document.createElement('p'));//add a margin to the divElement
  divElement.appendChild(imgElement);//add the imageElement to the divElement
    parent.document.body.children[0].appendChild(divElement);//add the divElement to the page
      }
      
 void loadExternalScript(String url, void callback){
    HTMLElement script = document.createElement("script")
    script.type = "text/javascript";
    if (script.readyState){  //IE
        script.onreadystatechange = function(){
            if (script.readyState == "loaded" ||
                    script.readyState == "complete"){
                script.onreadystatechange = null;
                callback(); } };
    } else {  //Others
        script.onload = function(){  callback();  };}
    script.src = url;
    document.body.children[0].appendChild(script);
}
 

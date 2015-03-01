
float mx=0,my=0; boolean mouseDown=false;
void getMousePosition (event) { mx = window.all ? event.offsetX : event.pageX; my = window.all ? event.offsetY : event.pageY;
}
   
boolean dragging=false;
int wh=120;
function handleMouseDown (event) {mouseDown=true;}
function handleMouseUp (event) {mouseDown=false;dragging=false;}
   
parent.document.body.onmousemove = function(e) {getMousePosition(e);};
parent.document.body.onmousedown = function(e) {handleMouseDown(e);};
parent.document.body.onmouseup = function(e) {handleMouseUp(e);};
  
parent.document.body.touchmove = function(e) {for (int i = 0; i < e.touches.length; i++) { getMousePosition(e.touches[i]);}};
parent.document.body.ontouchstart = function(e) {handleMouseDown(e);};
parent.document.body.touchend = function(e) {handleMouseUp(e);};
  
//document.body.onmousemove = parent.document.body.onmousemove;
//document.body.onmousedown = parent.document.body.onmousedown;
//document.body.onmouseup = parent.document.body.onmouseup;
   
 void setup() {
  size(wh*2,wh*2);
  getBrowserSize();
  b=new Ball();
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  smooth();
  capturedWebsite=createImage(100,100,RGB);
  createDivElement();//create the html element containing the imgElement
  
loadExternalScript('https://github.com/niklasvh/html2canvas/releases/download/0.4.1/html2canvas.js'
//'https://github.com/niklasvh/html2canvas/blob/master/dist/html2canvas.js'
, function(){//this will load an external js script (html2canvas) and add it to the website
    captureWebsite();//take the first screenshot after everything is ready
});
//background(255);
    externals.context.clearRect(0,0,width,height);// part of the canvasAPI that creates a clear rect
  fill(255);  ellipse(wh,wh,wh*2,wh*2);
  }
   
   float mag=2.1f,k=-0.00006f; //lens-settings
  
   
void draw() {
  if(firstScreenCaptured) {
     b.draw(); 
     imgElement.style.left=b.x-wh+"px";//set the position
     imgElement.style.top=b.y-wh+"px";//set the position
      int x=int(b.x-wh), y=int(b.y-wh);
    //       image(capturedWebsite,-x,-y);

     int u, v, r2;  float f;
      for (int vd = - wh; vd < wh; vd++){  for (int ud = - wh; ud < wh; ud++) { r2 = ud*ud + vd*vd;
        if (r2 <= wh*wh) {  f = mag + k * r2;  u = floor(ud/f) + x;  v = floor(vd/f) + y;
        if (u >= 0 && u < capturedWebsite.width && v >=0 && v < capturedWebsite.height) set(ud +wh, vd +wh, capturedWebsite.get(u+wh, v+wh));  else set(ud +wh, vd+wh , 0);}
}}

   noFill();  ellipse(wh,wh,wh*2,wh*2);   
PImage sketchShot = externals.canvas.toDataURL("image/webm",0.7);
imgElement.src=sketchShot;
//   selectedThumbnail.src=sketchShot;
fill(255,100);rect(wh,wh,wh*1.5,20);
   fill(0); text("click to update the screenshot" ,wh,wh);
} //draw the screenshot from the website if it was captured
  else {fill(255,100);rect(wh,wh,wh*1.5,20);fill(0);text("please wait for the screenshot" ,wh,wh);// else draw text info
 pushMatrix();
  translate(wh,wh);
  rotate(radians((frameCount*2)%360));
   translate(-wh/2.3,-wh/2.3);
  ellipse(0,0,10,10);
  popMatrix();
  }
}
  
//HTMLElement selectedThumbnail=parent.document.body.getElementsByClassName('visThumbnail50 selected')[0].children[0];// get the selected Thumbnail HTMLElement
  
//selectedThumbnail.style.width="50px";//fix the width
  
   
HTMLElement imgElement;//the html element containing the screenshot
 HTMLElement divElement;//the html element containing the imgElement
 boolean firstScreenCaptured=false;//will be switched to true if first screenshot was captured after everything is ready
 PImage capturedWebsite;
    
  
  
  
    
void captureWebsite(){// this function requires external lib html2canvas, loaded before via loadExternalScript()
   // parent.document.body.children[0].removeChild(imgElement);//removethe divElement from the page(not working???)
firstScreenCaptured=false;
    html2canvas(parent.document.body, {  onrendered: function(canvasr) {  
capturedWebsite=loadImage(canvasr.toDataURL("image/webm",0.7)); firstScreenCaptured=true;
  parent.document.body.children[0].appendChild(imgElement);//(re-)append the divElement to the page
}});
}
    
void mousePressed(){ if(firstScreenCaptured){ getBrowserSize(); parent.document.body.children[0].removeChild(imgElement);//removethe divElement from the page(not working???)
  fill(255);  ellipse(wh,wh,wh*2,wh*2);captureWebsite();}}
       
void createDivElement(){  
     imgElement=document.createElement('img');//create a new image Element
     imgElement.style.width=wh*2+"px";//set the width of the image Element
     imgElement.style.position="absolute";//make it fixed on page
     imgElement.style.left="10%";//set the position
     imgElement.style.top="50px";//set the position
     imgElement.style.zindex="999999999";
     imgElement.ondragstart = function() { return false; };
   // parent.document.body.children[0].appendChild(imgElement);//add the divElement to the page
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
 
  
  var browserWidth = 0, browserHeight = 0;
  
void getBrowserSize() {
  if( typeof( parent.window.innerWidth ) == 'number' ) {  //Non-IE
    browserWidth = parent.window.innerWidth;   browserHeight = parent.window.innerHeight;
  } else if( parent.document.documentElement && ( parent.document.documentElement.clientWidth || parent.document.documentElement.clientHeight ) ) {   //IE 6+ in 'standards compliant mode'
    browserWidth = parent.document.documentElement.clientWidth;   browserHeight = parent.document.documentElement.clientHeight;
  } else if( parent.document.body && ( parent.document.body.clientWidth || parent.document.body.clientHeight ) ) { //IE 4 compatible
    browserWidth = parent.document.body.clientWidth;   browserHeight = parent.document.body.clientHeight;
  }
}
  
  
float grav= .00f;
boolean brotate=false;
Ball b;
class Ball{ float vx=35, vy=25, x=wh*.5, y=wh*.5,px,py, br=.90, force= .00003f; int fs=500;
 Ball() { fs=wh;}
 void draw() {
 x = x+vx; y = y+vy;
//if(!firstScreenCaptured)
{if (x < wh) { x=wh; vx = -vx;}
 if (y < wh) { y=wh; vy = -vy;}
 if (y > browserHeight-wh){ y=browserHeight-wh;vy = -vy;}
 if (x > browserWidth-wh) { x=browserWidth-wh;vx = -vx;}}
vx*=br; vy*=br;
vy+=grav;
x += vx; y += vy;
if (mouseDown){ float tx = mx,ty = my, rb = dist(x, y, tx, ty);
if (rb < fs||dragging){ 
//float ab = atan2(ty-y, tx-x);  vx += rb * (force) * cos(ab);   vy += rb * (force)   * sin(ab);
dragging=true;
x=tx; y=ty;
vx=tx-px; vy=ty-py;
px=tx; py=ty;
}}}}

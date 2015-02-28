
// special thanks for clarification of the perspective:
// http://www.arcsynthesis.org/gltut/Positioning/Tut04 Perspective Projection.html
 
// observer is at (0,0,0)
// projection plane is at z = planePos
 
 
// remove border and background
var body = document.getElementsByTagName("body")[0];
body.style.background = "none";
 
 
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:0px;");
// remove code transparency
parent.document.getElementById("sourceCodeContainer").setAttribute("style", "opacity: 1");

// Inspired by:
// http://www.openprocessing.org/sketch/102466

PGraphics msk;

void setup()
{
  size( 1000, 600);
  // create the mask
  msk = createGraphics(width,height);
}  

void draw()
{
  background(0);
  externals.context.clearRect(0,0,width,height);// part of the canvasAPI that creates a clear rect
  
  // draw the mask
  msk.beginDraw();
  msk.background(0,0,0,0);
  msk.stroke(0,0,0,15);
  
  msk.fill(0,0,0,0);
  msk.rectMode(CENTER);
  msk.pushMatrix();
  msk.translate(mouseX,mouseY);
  msk.strokeWeight(2*width);
  int s = 70;
  for(int i=0; i<100; i+=2) {
    msk.rotate(mouseX);
    msk.rect(0,0,s+i+2*width, s+i+2*width);
  }
  msk.popMatrix();
//   msk.rect(mouseX,mouseY,120+2*width,120+2*width);
//   msk.rect(mouseX,mouseY,100+2*width,100+2*width);
//   msk.rect(mouseX,mouseY,80+2*width,80+2*width);
  
  
  
  msk.endDraw();
  image(msk);
//   text("MX: "+mouseX+" "+frameRate,100,100);
}

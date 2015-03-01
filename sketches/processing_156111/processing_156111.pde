

/* @pjs preload="skull.jpg,"nixon.jpg""; */

PImage img;
int bgColor; 
int bgColor2;
int posX=400;
PImage img2;
PFont font;

void setup() {
  size(400, 400);
  font = loadFont("DIN-Black-48.vlw");
  
}

void draw() {
  


  img2=loadImage("skull.jpg");
  tint(mouseX, 153, 204, mouseY);
  img = loadImage("nixon.jpg");
 
 
 text("MOVE THE MOUSE AROUND",width/2,height,2);
   
   
  background(mouseX,147,frameRate);

  float sinOfTime = sin( millis() * 0.007 );
  float sinMappedX = map( sinOfTime, -1.0, 1.0, 200, 280 );
  float sinMappedY = map( sinOfTime, -1.0, 1.0, 300, 420 );

  imageMode(CENTER);
  image( img2, width/2, height/2, sinMappedX, sinMappedY );
  image( img, width/2, height/2, sinMappedX, sinMappedY );
  
  
  
  
}



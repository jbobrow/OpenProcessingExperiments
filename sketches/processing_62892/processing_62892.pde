
/*

 PShape
 PImage
 PFont
 
*/

PShape s;
PImage b;
PFont f;
  
void setup(){
  size(400,400);
  smooth();
  
  s = loadShape("basics.svg");
  b = loadImage("basics.jpg");
  f = loadFont("HelveticaNeue-Bold-40.vlw");
}

void draw(){
  background(150); 
  
  shape(s, 50, 10, 100, 100);
  image(b, 250, 10);
  textFont(f,40);
  text("hello world",30,170);
  
  text("y: " + mouseY,mouseX,mouseY);
}


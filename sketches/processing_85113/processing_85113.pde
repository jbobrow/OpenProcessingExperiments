

PImage img;
PFont font;    
float x1 = 90;
float x2 = 110;

void setup(){
  img = loadImage("image10.jpg");
  size(500, 500);
  font = loadFont("HelveticaNeue-BoldCond-45.vlw");   
  // enter the exact file name of your VLW font
  textFont(font);
  fill(0);
  smooth ();
}
void draw(){
  image(img,0,0);         // updates background 
  text("BON APPETITE", x1, 460);   // write this at specified position

  }



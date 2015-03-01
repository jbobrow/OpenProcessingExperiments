
/* @pjs preload="14207427_00_b1.jpg"; */

void setup () {
   size (300,500);
  smooth ();
   }
 
 void draw () {
   
   PImage img;
   img=loadImage("14207427_00_b1.jpg");
   image(img,0,0,300,500);
  fill(255);
 
  ellipse (100,200,60,60);
  ellipse (200,200,60,60);
   
  float ax = map (mouseX, 0, width, 95, 105);
  float ay = map (mouseY, 0, height, 195, 205);
   
  fill(0,0,0);
  ellipse (ax,ay,40,40);
   
  float bx = map (mouseX, 0, width, 195, 205);
  float by = map (mouseY, 0, height, 195, 205);
   
  ellipse (bx,by,40,40);
   
  fill (240);
  
}



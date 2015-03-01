
/* @pjs preload = "pumpkins copy.jpg" ' */

PImage pumpkins;


void setup (){
  size (300, 300);
  smooth ();
 pumpkins = loadImage ("pumpkins copy.jpg");
}

void draw (){
  image (pumpkins, 0, 0);
  color c  = get (mouseX, mouseY);
  float r = red (c);
  float g = green (c);
  float b = blue (c);

  

  println (r, g, b);
} 



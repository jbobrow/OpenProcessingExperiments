
// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="img.png"; */ 

PImage img; 
 
float x;
float y;
float easing = 0.05;

void setup() {
  size(640, 360);
  img = loadImage("img.png");  // Load an image into the program 
}
void draw(){
    
  background(255);
  image(img, mouseX, mouseY);
 
 
}






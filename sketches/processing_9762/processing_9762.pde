
/**
 * Move the pointer left and right across the image to change
 * its position. This program overlays one image over another 
 * by modifying the alpha value of the image with the tint() function.
 * Based in " Example/Basic/image/transparency/sketch. Lumina2010
 */

PImage a, b;
float offset;

void setup() {
  size(460, 290);
  a = loadImage("interior3.jpg");  // Load an image into the program 
  b = loadImage("tapa2.jpg");   // Load an image into the program 
  frameRate(3);
}

void draw() { 
  image(a, 0,0);
  float offsetTarget = map(mouseX, 0, width, -b.width/2 - width/2, 0);
  offset += (offsetTarget-offset)*0.05; 
  tint(255);
  image(b, offset, 0);
}







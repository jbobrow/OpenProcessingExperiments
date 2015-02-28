
/**
 * Transparency. 
 * 
 * Move the pointer left and right across the image to change
 * its position. This program overlays one image over another 
 * by modifying the alpha value of the image with the tint() function. 
 */

PImage a, b, c;
float offset;

void setup() {
  size(550, 550);
  a = loadImage("1.jpg");  // Load an image into the program 
  b = loadImage("2.jpg"); 
  c = loadImage("3.jpg");  // Load an image into the program 
  frameRate(60);
}

void draw() { 
  image(a, 0, 0);
  float offsetTarget = map(mouseX, 0, width, -b.width/2 - width/2, 0);
  offset += (offsetTarget-offset)*0.05; 
  tint(255, 50);
  image(b, offset, 20);
  image(c, 100,100);
}







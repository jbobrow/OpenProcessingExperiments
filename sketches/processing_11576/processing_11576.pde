
  /**Nutella***/
 
PImage a, b;
float offset;
 
void setup() {
  size(450, 320);
  a = loadImage("nutella.jpg");  // Load an image into the program
  b = loadImage("yay.jpg");   // Load an image into the program
}
 
void draw() {
  image(a, 0, 0);
  float offsetTarget = map(mouseX, 0, width, -b.width/2 - width/2, 0);
  offset += (offsetTarget-offset)*0.05;
  tint(255, 153);
  image(b, offset, 20);
}


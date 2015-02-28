


PImage a, b;
float offset;

void setup() {
  size(700, 272);
  a = loadImage("cbengals.jpg");  // Load an image into the program 
  b = loadImage("cbengals.png");   // Load an image into the program 
}

void draw() { 
  image(a, 0, 0);
  float offsetTarget = map(mouseX, -10, width, -b.width/2 - width/2, 300);
  offset += (offsetTarget-offset)*0.15; 
  tint(255, 153);
  image(b, offset, 15);
}



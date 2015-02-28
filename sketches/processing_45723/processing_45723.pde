
PImage a, b;
float offset;

void setup() {
  size(337, 417);
  a = loadImage("lupin.jpg");  // Load an image into the program 
  b = loadImage("nosferatu.jpg");   // Load an image into the program 
}

void draw() { 
  image(a, 0, 0);
  float offsetTarget = map(mouseX, 0, width, -b.width/2 - width/2, 0);
  offset += (offsetTarget-offset)*0.05; 
  tint(150, 150);
  image(b, offset, 40);
}



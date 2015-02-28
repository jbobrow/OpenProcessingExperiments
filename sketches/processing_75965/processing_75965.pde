
PImage a, b;
float offset;

void setup() {
  size(679, 425);
  a = loadImage("bat.jpg");  // Load an image into the program 
  b = loadImage("bad.png");   // Load an image into the program 
}

void draw() { 
  image(a, 0, 0);
  float offsetTarget = map(mouseX, 0, width, -b.width/2 - width/2, 0);
  offset += (offsetTarget-offset)*0.10; 
  tint(255, 153);
  image(b, offset, 20);
}



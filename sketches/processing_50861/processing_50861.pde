
PImage a, b;
float offset;

void setup() {
  size(400, 400);
  a = loadImage("bohenry1.jpg");  // Load an image into the program 
  b = loadImage("bohenry2.jpg");   // Load an image into the program 
}

void draw() { 
  tint(200,70,175, 255);
  image(a, 0, 0);
  float offsetTarget = map(mouseX+200, 200, width, -b.width/2 - width/2, 0);
  offset += (offsetTarget-offset)*0.05; 
  tint(255, 153);
  image(b, offset, 0);
}


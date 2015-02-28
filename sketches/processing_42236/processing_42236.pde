


PImage a, b;
float offset;

void setup() {
  size(400, 600);
  a = loadImage("mjo.jpg"); 
  b = loadImage("pan.jpg");   
}

void draw() { 
  image(a, 0, 0);
  float offsetTarget = map(mouseX, 0, width, -b.width/2 - width/2, 0);
  offset += (offsetTarget-offset)*0.05; 
  tint(180, 170);
  image(b, offset, 72);
}







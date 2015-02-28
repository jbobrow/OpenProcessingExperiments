


PImage a, b;
float offset;

void setup() {
  size(460, 600);
  a = loadImage("twiiggy.jpg"); 
  b = loadImage("twiggy.gif");   
}

void draw() { 
  image(a, 0, 0);
  float offsetTarget = map(mouseX, 0, width, -b.width/2 - width/2, 0);
  offset += (offsetTarget-offset)*0.05; 
  tint(255, 153);
  image(b, offset, 10);
}







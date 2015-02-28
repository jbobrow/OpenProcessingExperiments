
PImage  a;
float offset;

void setup() {
  size(700, 450);
  a = loadImage("DSC_0236.jpg");   
}

void draw() { 
  float offsetTarget = map(mouseX, 0, height, -a.height/2 - height/2, 0);
  offset += (offsetTarget-offset)*.03; 
  tint(255, 45);
  image(a, offset, 0);
}


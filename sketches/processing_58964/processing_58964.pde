
//Triangle Mess

float x=width/2;
float a = 1;

void setup() {
  size(500, 500);
  background(0);
  colorMode(HSB, 100);
}

void draw() {
  float x = map (sin(a)*sin(a*0.8), -1, 1, 0, width);
  float y= map(sin(a*.9), -1, 1, 50, height);
  float dynamic = map(sin(a*4.04)*sin(a*3.1), -1, 1, 0, 100);
  float triangleSize = map(sin(a*1.7)*sin(a*1.3), -1, 1, 5, 30);
  fill(dynamic, random(255), random(255));
  triangle(x/2, y, mouseX, mouseY, triangleSize, triangleSize); 

  a=a +0.03;

  if (mousePressed) {
    background(0);
    triangle(2*x, y, mouseX, mouseY, triangleSize, triangleSize); 
    a=a +0.03;
  }
}




size(500,500);
float r;
float g;
float b;
float a;

float diam;
float x;
float y;

void setup() {
  size(500,500);
  background(255);
  smooth();
  frameRate(30);
}

void draw() {
  stroke(255);
  fill(r,g,b,a);
  ellipseMode(CENTER);
  ellipse(width/2,height/2,mouseX+1,mouseY+10);
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(20);
  x = random(width);
  y = random(height);
  noStroke();
  fill(r,g,b,a);
  ellipse(mouseX,mouseY,diam,diam);
}



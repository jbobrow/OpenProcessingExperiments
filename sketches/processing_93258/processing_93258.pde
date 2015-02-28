
float r;
float g;
float b;
float a;
float diam;
float x;
float y;


void setup() {  
  size(400, 400);
  smooth();  
}


void draw() {
  background(mouseX, mouseY, 255);
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(40,200);
  x = mouseX;
  y = mouseY;
}


void mousePressed(){
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
}



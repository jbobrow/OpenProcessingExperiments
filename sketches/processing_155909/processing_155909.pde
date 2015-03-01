
float r;
float g;
float b;
float a;

float diam;
void setup(){
  size(1000,1000);
  background(0);
  smooth();
}

void draw(){
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(10);
  diam = random(200);
  
  smooth();
  noStroke();
  fill(r,g,b,a);
  ellipse(500,500,diam-mouseX,diam-mouseY);



}

void mousePressed(){
  saveFrame();
  
}

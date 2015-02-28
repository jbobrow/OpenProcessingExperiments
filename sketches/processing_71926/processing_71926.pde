
//Random circle

float r;
float g;
float b;
float a;

float diam;
float x;
float y;

void setup(){
  size(200,200);
  background(255);
  smooth();
}

void draw(){
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
  diam=random(255);
  x=random(255);
  y=random(255);
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
  
  stroke(0);
  fill(0);
  ellipse(100,100,20,20);
}


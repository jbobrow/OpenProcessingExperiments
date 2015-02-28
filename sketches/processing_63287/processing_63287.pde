
float r;
float g;
float b;
float a;

float w;
float h;
float x;
float y;

void setup(){
  size(200,200);
  background(255);
  frameRate(15);
  stroke(0);
  smooth();
}

void draw(){
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
  w=random(20,40);
  h=random(20,40);
  x=random(width);
  y=random(height);
  
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,w,h);
}



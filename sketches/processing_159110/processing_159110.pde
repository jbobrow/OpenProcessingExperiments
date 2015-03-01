
float r;
float g;
float b;
float a;

float diam;
float x;
float y;

void setup(){
  stroke(x);
  size(500,500);
  background(255);
  smooth(500);
  frameRate(15);
}

void draw(){
  r=random(44);
  g=random(187);
  b=random(191);
  a=random(50);
  
  x=random(width);
  y=random(height);
  

fill(r,g,b,a);
triangle(x,y,x,x,y,x);
}




float r;
float g;
float b;
float a;

float t;
float x;
float y;

void setup() {
  size(400,4000);
  background(#43E5DC);
}

void draw() {
  //Fill all variables with random values
  r= random(255);
  g= random(255);
  b= random(255);
  a= random(255);
  t= random(255);
  x= random(width);
  y= random(height);
  
  
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,t,t);
}
  



float r;
float g;
float b;
float a;

float diam;
float x;
float y;
void setup()  {
  size(500,500);
  background(255);
  smooth();
  
}

 void draw()  {
 
  r=random(150);
  g=random(0);
  b=random(0);
  a=random(100);
  diam=random(10);
  x=random(width);
  y=random(height);
  noStroke();
  fill(r,g,b,a);
  rect( x,y,x,diam);  
  ellipse(r,b,y,diam);
  
  
}

void keyPressed() {
  println(key);
}


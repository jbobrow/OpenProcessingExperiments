
float r;
float g; 
float b;
float a;
float diam;
float x1;
float y1;
float x2;
float y2;
float x3;
float y3;
float x4;
float y4;
void setup(){
  size(800,800);
  background(255);
  smooth();
}
void draw(){
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(40);
  x1 = random(width);
  y1 = random(height);
  x2 = random(width);
  y2 = random(height);
  x3 = random(width);
  y3 = random(height);
  x4 = random(width);
  y4 = random(height);
  noStroke();
  fill(r,g,b,a);
  ellipse(x1,y1,diam,diam);
  fill(r,g,b,a);
  quad(x1,y1,x2,y2,x3,y3,x4,y4);
  fill(r,g,b,a);
  rect(x1,y1,x2,y2);
  fill(r,g,b,a);
  triangle(x1,y1,x2,y2,x3,y3);
}




float a = 50;
float s = 20;
float r = .5;

void setup(){
  size(400, 400);
  background(255);
  smooth();
  frameRate(7);
  
}

void draw(){
  translate (200, 200);
  Circle();
  pushMatrix();
  
  translate( 175, 215);
  Circle();
  popMatrix();
  
}

void Circle(){
  rotate(r);
  fill(200, 0, 200, 10);
  ellipse (s, s, a, a);
  s = s+1;
  a = a*1.2;
  r = r + .5;
}

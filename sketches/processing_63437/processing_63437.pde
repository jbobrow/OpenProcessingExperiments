
PVector p0;
PVector p1;
PVector p2;
PVector p3;

int pZ = 0;

int  l = 400;

void setup(){
  size(600,600);
  
  p0 = new PVector(-l/2,-l/2,pZ);
  p1 = new PVector(l/2,-l/2,pZ);
  p2 = new PVector(l/2,l/2,pZ);
  p3 = new PVector(-l/2,l/2,pZ);
  
}

void draw(){
  smooth();
  background(255,255,255);
  stroke(60);
  noFill();
  
  translate(width/2,height/2);
  
  beginShape(QUADS);
  vertex(p0.x,p0.y);
  vertex(p1.x,p1.y);
  vertex(p2.x,p2.y);
  vertex(p3.x,p3.y);
  endShape();
}




void setup() {
  size (800, 600);
  background(0);
  smooth();
  frameRate(12);
}



void draw() {

  noStroke(); 
  fill (0, 91, 245,10);
  ellipse (width/2, height/2, random(400,500), random(400,500));
  fill (252, 255, 255,80);
  ellipse (width/2, height/2, random(250,350),random(250,350));
  fill (252, 0, 0,255);
  float centro;
  centro = random(100,200);
  ellipse (width/2, height/2,centro ,centro);
}



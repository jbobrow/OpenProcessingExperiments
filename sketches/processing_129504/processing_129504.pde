
//Lauren Ruoff copyright 2014 lruoff

float x, y;
float diam;
float easingco;


void setup(){
  
  size (400, 400);
  background(255);
  frameRate(30);
  x = width/2;
  y = height/2;
  easingco = .1;
  diam = 60;
  
  
}

void draw() {
  background(214, 190, 130);
  
  line(0, 0, x, y);
  line(0, 400, x, y);
  line(400, 0, x, y);
  line(400, 400, x, y);
  
  noCursor();
  float dx = mouseX - x;
  float dy = mouseY - y;
  
 x = x+(dx*easingco);
 y = y+(dy*easingco);
 
  strokeWeight(3);
  stroke(167, 12, 43);
  fill(255, 49, 87);
  ellipse(x, y, diam, diam);
 
 strokeWeight(1);
 stroke(167, 12, 43);
 fill(214, 190, 130);
 ellipse(x, y, 10, 10);
 ellipse(x+10, y+10, 10, 10);
 ellipse(x+10, y-10, 10, 10);
 ellipse(x-10, y-10, 10, 10);
 ellipse(x-10, y+10, 10, 10);
  
}



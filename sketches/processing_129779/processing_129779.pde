
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
 
//corner lines 
  line(0, 0, x, y);
  line(0, 400, x, y);
  line(400, 0, x, y);
  line(400, 400, x, y);
  
  noCursor();
  float dx = mouseX - x;
  float dy = mouseY - y;
  
 x = x+(dx*easingco);
 y = y+(dy*easingco);
 
 
//white rectangles 
 noStroke();
 fill(255, 100);
 rect(0, 0, x, y);
 fill(255, 150);
 rect(x, 0, 400, y);
 fill(255, 200);
 rect(x, y, 400, 400);
 fill(255, 230);
 rect(0, y, x, 400);

//button circle 
  strokeWeight(3);
  stroke(167, 12, 43);
  fill(255, 49, 87);
  ellipse(x, y, diam, diam);
  
//button holes
 strokeWeight(1);
 stroke(167, 12, 43);
 fill(214, 190, 130);
 ellipse(x, y, 10, 10);
 ellipse(x+10, y+10, 10, 10);
 ellipse(x+10, y-10, 10, 10);
 ellipse(x-10, y-10, 10, 10);
 ellipse(x-10, y+10, 10, 10);
  
}



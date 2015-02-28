
//Hello World
//Test 001 [Date:20130925] Wayne Lin
//e-mail:ration.Lin@gmail.com


void setup() {
  size (800, 400);
  smooth();
  background(255, 255, 255);
}

void draw() {
  //color & Weight
  stroke (130, 0, 0);
  strokeWeight(3);
  
  rectMode(CENTER);
  
  fill (105, 214, 232);
  rect (100, 200, 100, 200);
  rect (200, 180,  80, 180);
  rect (300, 160,  60, 160);
  
  
  ellipseMode(CENTER);
  
  fill (214, 224, 177);
  ellipse (800, 400, 900, 1000);
  
  stroke (255, 255, 0);
  strokeWeight(6);
  
  fill (210, 211, 211);
  ellipse (800, 400, 720, 360);
  
  stroke (196, 65, 0);
  strokeWeight(4);
  
  fill (0, 196, 196);
  ellipse (800, 400, 360, 360);
  
  rectMode(CENTER);
  stroke (255, 0, 0);
  strokeWeight(2);
  fill (211, 211, 211);
  
  rect (402, 140,  40, 140);
  rect (500, 120,  20, 120);
  rect (600, 140,  10, 100);
  rect (700, 120,  20,  90);
  rect (650, 100,  40,  80);
}



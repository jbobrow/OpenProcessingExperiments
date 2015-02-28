
//Creative Computing
//Fervido Frias
//March 11, 2013.

void setup() {
  size(400, 400);
}


void face() {
  fill(255, 0, 0); 
  rect(50, 30, 300, 300);  
  smooth();
  fill(255, 0, 0);
  ellipse (width/2, height/2.2, 30, 30);
  fill(254, 255, 3);
  rect (width/4.5, height/6, 50, 50);
  rect (width/1.5, height/6, 50, 50);
  rect (width/2, 180, 10, 30);
  rect (98, height/1.5, 200, 30);
  int u = 20;
  int d = 20;
  fill (0, 255, 0);
  ellipse(width/1.37, height/6, u, d);
  fill (0, 255, 0);
  ellipse(width/3.5, height/6, u, d);
  strokeWeight (5);

  for (int i = 80; i < 300; i += 60) {
    line(i, 30, i + 60, 80);
  }
}

void sad() {
  fill(255, 0, 0); 
  rect(50, 30, 300, 300);  
  smooth();
  fill(255, 0, 0);
  ellipse (width/2, height/2.2, 30, 30);
  fill(254, 255, 3);
  rect (width/4.5, height/6, 50, random (200));
  rect (width/1.5, height/6, 50, random (200));
  rect (width/2, 180, 10, 30);
  rect (98, height/1.5, 200, 5);
  int u = 10;
  int d = 10;
  fill (0, 255, 0);
  ellipse(width/1.37, height/6, random (200), d);
  fill (0, 255, 0);
  ellipse(width/3.5, height/6, random (200), d);
  strokeWeight (random(5));

  for (int i = 80; i < 300; i += 60) {
    line(i, 30, i + 60, 80);
  }
}

void draw() {
  
  background(0,255,0);
  
  face();
  if (mousePressed == true) {
    sad();
  }
}



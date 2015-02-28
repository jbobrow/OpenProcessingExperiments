
//Youshin Song. CC-SecB 

void setup() {
  size (500,500);
  smooth ();
  background (255);
}

// Declare variables & draw code

void draw() {
  fill (255,255,255,50);
  rect (0, 0, 600, 600);
  float x = random(0, 500);
  float y = random(0, 500);
  noStroke ();
  fill (100, 120, 325, 20);
  ellipse (x, y, 100, 100);
  fill (255, 100, 70, 20);
  ellipse (x, y, 50, 50);
  
  float a = random(0, 500);
  float b = random(0, 500);
  noStroke ();
  fill (200, 120, 125, 20);
  ellipse (a, b, 150, 150);
  fill (305, 90, 170, 20);
  ellipse (a, b, 100, 100);
  
  float m = random(0, 500);
  float n = random(0, 500);
  noStroke ();
  fill (70, 320, 215, 20);
  ellipse (m, n, 50, 50);
  fill (90, 190, 320, 20);
  ellipse (m, n, 10, 10);
}



void setup() {

  size(600, 600);
  background(0);
  smooth();
  colorMode(RGB);
  noLoop();
}
void draw() {

  createBackground(); 
  createSquares();
  createRings(255, 150, 100);
  createRings(155, 120, 200);
  createRings(95, 90, 300);
}
// functions 

void createBackground() {
  noStroke();
  for (int i=2; i<650; i+=50) {
    ellipse(width/2, height/2, i, i);
    fill(random(225), random(245), random(235), 50);
  }
}

void createSquares() {
  stroke(random(254), random(255), random(253));
  strokeWeight(5);
  for (int s=0; s<600; s+=50) {
    rectMode(CENTER);
    rect(300, 300, s, s);
    fill(0, 0, 0, 0);
  }
}

void createRings(float a, float b, float c) {

  stroke(random(255), random(255), random(255));
  for (int t= 0; t <360;t+=30) {

  float x =  c * cos(radians(t));
  float y =  c * sin(radians(t));

    ellipse((width/2)+x, (height/2)+y, 50, 50);
    fill(random(a), random(a), random(a), b);
  }
}






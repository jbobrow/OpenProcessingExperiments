
void setup() {
  size(500,500);
  noStroke();
  background(255,255,255);
  rectMode(CENTER);
}


void draw() {
 // background(255,255,255);
  fill(#FF0000, random(100));
  rect(random(width), random(height), 100,100);
}



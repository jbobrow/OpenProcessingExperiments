
void setup() {
  size(900, 200);
  rectMode(CENTER);
  smooth();
  frameRate(20);
}

void draw() {
  background(255, 255, 255);
  stroke(255, 255, 255);
  for (int i=25; i<width; i+=50) {
    fill(random(100,180), random(180,230), random(250,255));
    pushMatrix();
    translate(i, 100);
    rotate(radians(i/5));
    rect(0, 0, 50, 50);
    popMatrix();
  }
}

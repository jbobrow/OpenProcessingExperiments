
void setup() {
  size(900, 200);
  background(255, 255, 255);
  rectMode(CENTER);
  smooth();
  textAlign(CENTER);
  frameRate(20);
}

void draw() {
  stroke(255, 255, 255);
  for (int i=25; i<width; i+=50) {
    fill(random(100,180), random(180,230), random(250,255), 20);
    pushMatrix();
    translate(i, 100);
    rotate(radians(random(i/5,2*i)));
    rect(0, 0, 150, 150);
    popMatrix();
  }
}

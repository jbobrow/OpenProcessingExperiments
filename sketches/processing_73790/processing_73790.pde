
void setup() {
  size(800, 600);
  background(255);
  noStroke();
  smooth();
}

void draw() {
  float s = random(0, 50);
  if (mousePressed == true) {
    fill(random(0, 255), random(0, 255));
    ellipse(random(0, width), random(0, height), s, s);
  } 
  else {
    fill(random(0, 255), random(0, 255));
    rect(random(0, width), random(0, height), s, s);
  }
  if (keyPressed == true ) {
    background(255);
  }
}

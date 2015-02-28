
void setup() {
  size(500, 500);
  colorMode(HSB);
  background(255);
  smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);
}
void draw() {
  stroke(random(255), 255, 255);
  strokeWeight(2);
  noFill();
  if (mousePressed && mouseButton == LEFT) {
    noStroke();
  }
  line(pmouseX, pmouseY, mouseX-10, mouseY-10);
  if (mousePressed && mouseButton == RIGHT) {
    setup();
  }
}

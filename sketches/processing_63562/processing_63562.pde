
// horizontal lines and dots

void setup() {
  size(640, 480);
  background(0);  

  smooth();
  frameRate(15);
}

void draw() {
  strokeWeight(random(1,5));
  stroke(random(255), 50);
  float y = random(height);
  line(0, y, width, y);
  
  float r = random(10, 90);
  noStroke();
  fill(random(50),90);
  ellipse(random(width), random(height), r, r);
}

void mouseMoved() {
  float r = random(2, 19);
  noStroke();
  fill(32, 35, 244, 50);
  ellipse(mouseX, mouseY, r, r);
}

void mousePressed() {
  noStroke();
  fill(0);
  rect(0, 0, width, height);
}

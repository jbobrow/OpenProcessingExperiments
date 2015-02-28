
void setup() {
  size(1400, 950);
  background(0);
}

void draw() {
  frameRate(5);
  stroke(255);
  strokeWeight(10);
  fill(50, 255, 50, 150);
  ellipse(random(width), random(height), 200, 200);
  fill(0, 300, 270, 150);
  ellipse(random(width), random(height), 150, 150);
  fill(255, 150, 0, 150);
  ellipse(random(width), random(height), 100, 100);
  strokeWeight(1);
  fill(0, 30);
  rect(-1, -1, width+1, height+1);
}




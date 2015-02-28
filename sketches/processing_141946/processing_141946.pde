
void setup() {
  size(500, 500);
  smooth();
  background(255);
  frameRate(50);
}

void draw() {
  noFill();
  stroke(random(225, 255), random(225, 255), 0);
  strokeWeight(frameCount/20);
  rect(frameCount/2, frameCount/2, 500-frameCount, 500-frameCount, frameCount/2);
  if (frameCount > 500) {
    frameCount = 0;
  }
  fill(random(225, 255), random(225, 255), 0);
}

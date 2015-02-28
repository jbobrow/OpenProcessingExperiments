
float radius = 100;
float xPos, yPos, yDistance;

void setup() {
  size(800, 800);
  smooth();
  xPos = 0;
  yPos = height/2;
}

void draw() {
  background(255);
  yDistance = sin(frameCount * 0.08) * radius;
  xPos = xPos + 4;
  stroke(0);
  ellipse (xPos, yPos + yDistance, 10, 10);
}



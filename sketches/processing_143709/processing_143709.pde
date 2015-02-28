
int radius = 200;
int segmentCount = 18;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, width, height);
  noStroke();
}

void draw() {
  float angleStep = 360/segmentCount;
  beginShape(TRIANGLE_FAN);
  vertex(width/2, height/2);
  for(float angle = 0; angle <= 360; angle+=angleStep) {
   float vx = width/2 + cos(radians(angle))*radius;
   float vy = width/2 + sin(radians(angle))*radius;
   fill(angle, width, height);
   vertex(vx, vy);
  }
  endShape();
}


void setup() {
  size(1450, 300);
  background(255);
  noStroke();
  fill(0);
  
  cantorSnowflake(0, height/2, 140, 280);
}

void cantorSnowflake(float x, float y, float length, float sideStep) {
  if (length < 0.1) return;
  
  pushMatrix();
  
  hexagon(x, y, length);
  
  translate(sideStep, 0);
  
  for (int i = 0; i < 6; i++) {
    PVector point = vector(i * THIRD_PI, length * 2 / 3);
    cantorSnowflake(point.x, point.y, length / 3, sideStep);
  }
  
  popMatrix();
}

void hexagon(float centerX, float centerY, float length) {
  translate(centerX, centerY);
  
  beginShape();
  for (int i = 0; i < 6; i++) {
    hexPoint(vector(i * THIRD_PI, length));
  }
  endShape(CLOSE);
}

void hexPoint(PVector v) {
  vertex(v.x, v.y);
}

PVector vector(float rads, float length) {
  return new PVector(cos(rads) * length, sin(rads) * length);
}



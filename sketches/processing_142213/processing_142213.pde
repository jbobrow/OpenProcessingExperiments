
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// SHIN Yeonsik
// dnmys11


float count, step, radius, theta;
void setup() {
  size(600, 600);
  fill(0);
  stroke(255, 255, 255, 20);
  strokeWeight(7);
}

void draw() {
  background(0);
  count = map(sin(theta), -1, 1, 8, 10);
  step=360/count;

  float div = map(sin(theta), -1, 1, 6, 2);
  radius = width/div;

  beginShape(TRIANGLE_FAN);
  vertex(width/2, height/2);
  for (float angle=0;angle <=360*4; angle+=step) {
    float vx = width/5 + cos(radians(angle))*radius;
    float vy = height/1 + sin(radians(angle))*radius;
    vertex(vx, vy);
    fill(255, 255, 255, 50);
    radius *=1.02;
  }
  endShape();

  theta += 0.05;
}


float num;
void setup() {
  size(640, 640);
  noStroke();
}

void draw() {
  background(255);
  translate(width/2, height/2);
  rotate(radians(180));
  for (int q = 60; q > 0; q--) {
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < 180; i+=12) {
      float d = map(q, 60, 0, 2, 1);
      fill(sin(radians(i*q))*255, 0, 0, 200);
      vertex(-i*d, cos(radians(i))*20+sin(q+i+num)*20);
    }
    endShape();
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < 180; i+=12) {
      float d = map(q, 60, 0, 2, 1);
      fill(sin(radians(i*q))*255, 0, 0, 200);
      vertex(i*d, cos(radians(i))*20+sin(q+i+num)*20);
    }
    endShape();
  }
  num+=0.01;
}




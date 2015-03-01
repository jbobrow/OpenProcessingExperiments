
float inc = 0.0;
void setup() {
  size(300,300);
  stroke(255,204);
  smooth();
}
void draw() {
  background(0);
  inc += 0.01;
  float angle = sin(inc)/10.0 + sin(inc*1.2)/20.0;
  tail(118, 9, angle/1.3);
  tail(133, 12, angle);
  tail(144, 10, angle/1.3);
  tail(162, 5, angle);
  tail(188, 7, angle*2);
}
void tail(int x, int units, float angle) {
  pushMatrix();
  translate(x, 100);
  stroke(200, 10, 255, 60);
  for (int i = units; i>0; i--) {
    strokeWeight(i);
    line(10,200,0,-8);
    translate(10, -8);
    rotate(angle);
  }
  popMatrix();
}




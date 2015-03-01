
float inc = 0.0;
void setup() {
  size(900,900);
  stroke(255,204);
  smooth();
}
void draw() {
  background(0);
  inc += 0.01;
  float angle = sin(inc)/10.0 + sin(inc*1.2)/20.0;
  //tail(118, 9, 100 *angle/TWO_PI);
  tail(33, 12, angle*5);
  //tail(144, 10, angle/1.3);
  //tail(162, 5, angle);
  //tail(188, 7, angle*2);
}
void tail(int x, int units, float angle) {
  pushMatrix();
  translate(x, 100);
  stroke(200, 10, 255, 60);
  for (int i = units; i>0; i--) {
    strokeWeight(i);
    line(35, 300, 50, 150);
    line(50, 150, 100, 200);
    line(100, 200, 150, 150);
    line(150, 150, 200, 300);
    translate(10, -8);
    rotate(angle);
  }
  popMatrix();
}




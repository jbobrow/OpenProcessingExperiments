
float t = 0;
float v = 0;

void setup() {
  size(500,500,P3D);
}
void draw() {
  background(24, 58, 94);
  float x = (sin(t) + 1) * width/2;
  float y = (sin(v) + 1) * width/2;
  t += 0.015;
  v += 0.02;
  translate(x, y, 20);
  for (int i = 0; i < 500; i = i+50) {
    noFill();
    stroke(39,100,i/2);
    rotate(PI/x);
    box(i);
    rotate(PI/y);
    box(i/x);
    smooth();
  }
}









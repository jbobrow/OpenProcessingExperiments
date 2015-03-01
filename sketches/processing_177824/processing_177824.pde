
void setup() {
  size(400, 400, P3D);
  stroke(100);
  strokeWeight(2);
  smooth(8);
}

float a = 0;
float r = 0;

void draw() {
  background(0);
  float x = map(sin(a)*sin(a*0.6)*sin(a*0.2), -1, 1, -100, 50);
  float y = map(sin(a)*sin(a*0.8)*sin(a*0.5), -1, 1, -100, 50);
  translate(width/2 + x, height/2 + y, map(sin(a), -1, 1, -100, 100));
  rotateY(r);
  rotateZ(r);
  rotateX(r);

  fill(255);
  box(50);

  r = r + 0.03;
  a = a + 0.02;
}


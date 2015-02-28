
void setup() {
  size(1000, 100);
}

float t = 0.;
int x = 0;

void draw() {
  background(0);
  float x = map(noise(t), 0., 1., 0., width);
  rect(x, 10, 20, 80);
  t = t+0.01;
}


int num =20;
float step, sz, offSet, theta, angle;

void setup() {
  size(600, 600);
  strokeWeight(5);
  step = 22;
}

void draw() {
  background(20);
  translate(width / 2, height / 2);
  angle=0;
  for (int i = 0; i < num; i++) {
    stroke(255);
    noFill();
    sz = i * step;
    float offSet = i * TWO_PI / num;
    float arcStart = PI;
    float arcEnd = map(sin(theta+offSet), -1, 1, arcStart, arcStart + TWO_PI * 2/3);
    arc(0, 0, sz, sz, arcStart , arcEnd);
  }
  colorMode(RGB);
  resetMatrix();
  theta += .0523;
}


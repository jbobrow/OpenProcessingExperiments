
void setup() {
  size(500, 500, P3D);
  background(0);
}

float nx = 0.0;
float a = 0.02;

void draw() {
  frameRate(60);
  translate(250, 0);
  //fill(255, 10);
  rotateY(a*PI);
  noStroke();
  //rect(0, 0, 500, 500);
  nx = nx + .01;
  float n = noise(nx) * 250;
  fill(random(0), random(255), random(255), 50);
  rect(n, n, n, n);
  a += 0.02;
}



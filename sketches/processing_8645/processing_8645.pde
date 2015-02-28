
float a;

void setup() {
  size(320, 240, P3D);
}

void draw() {
  a += 0.01;
  lights();
  background(255);
  translate(width >> 1, height >> 1);
  rotateX(a);
  rotateY(a);
  fill(255, 0, 0); noStroke();
  for (int i = 0; i < 5 ; i++) {
    rotateZ(a); rotateY(a);
    box(100);
  }
}



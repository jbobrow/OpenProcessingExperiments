
void setup() {
  size(400, 400);
  background(240, 180, 180);
  stroke(32,20,80);
  fill(200,220,220);
  strokeWeight(2);
  smooth();
}

void draw() {
  int pixel = 70;
  int iter = 5;
  for(int i = 0; i < iter; i++) {
    for(int j = 0; j < iter; j++) {
      translate(j*pixel, i*pixel);
      figure();
      translate(pixel, 0);
      scale(-1, 1);
      figure();
      scale(-1, 1);
      translate(-pixel, 0);
      translate(-(j*pixel), -(i*pixel));
    }
  }
}

void figure() {
  triangle(10, 10, 50, 65, 30, 10);
}


void setup() {
  size(600, 600);
}
void draw() {
  background(250);
  for (int a =0; a<600; a=a+10) {
    for (int b = 0; b <600; b = b + 10) {
      noStroke();
      fill(a/3, b/3, b/3);
      float tamano= random(200);
      ellipse(a, b, tamano, tamano);
    }
  }
}

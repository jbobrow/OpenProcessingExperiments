
void setup() {
  size(600, 600);
}

void draw() {
  background(0);
  for (int a = 0; a < width; a=a+30) {
    for (int b = 0; b < height; b=b+20) {
      fill(a/3, b/3, 0);
      float tamano = random(30);
      ellipse(a, b, tamano, tamano);
    }
  }
}


void setup() {
  size (600, 600);
}
 
void draw() {
  float a = 0.0;
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j += 100) {
      fill(255);
      rect(i, j, i+55, j+55, random(3), random(6), random(12), random(18));
    }
  }
}




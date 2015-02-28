
void setup() {
  size (200, 200);
  background (255);
}
void draw() {
    int coord=1;
  while (coord<=255) {
    rect ((coord*coord), 1, 5, 5);
    coord=coord+2;
  }
}

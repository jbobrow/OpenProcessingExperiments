
void setup() {
  size (200, 200);
  background (0);
}
void draw() {
    int coord=3;
    stroke (163,92,222);
    fill (18,224,188);
  while (coord<=255) {
    rect ((coord*coord), 10, 5, 5);
    coord=coord+2;
  }
}

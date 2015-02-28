
void setup() {
  size (200, 200);
  background (0);
}
void draw() {
    int y=3;
    stroke (255, 8,28);
    fill (y*83, y+253,8);
  while (y<=255) {
    rect (75, y*y, 8, 8);
     rect (105, y*y, 8, 8);
       
y=y+2;
  }
}

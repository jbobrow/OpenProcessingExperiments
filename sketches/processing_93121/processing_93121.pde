
void setup() {
  size (200, 200);
  background (0);
}
void draw() {
    int y=3;
    stroke (255, 8,28);
    fill (y*83, y+253,8);
  while (y<=255) {
    rect (y*y, 15, 8, 8);
    rect (y*y, 55, 8, 8);
    rect (y*y,85, 8, 8);
     rect (y*y, 115, 8, 8);
     rect (y*y, 145, 8, 8);
     rect (y*y, 185, 8, 8);
       
y=y+2;
  }
}

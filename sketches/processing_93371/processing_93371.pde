
void setup() {
size (200, 200);
background (240,12,217);
}
void draw() {
int y=1;
stroke (222, 181,218);
fill (y*90, y+10,82);
while (y<=255) {
rect (15, y*y, 8,8);
  rect (45, y*y, 8,8);
  rect (75, y*y, 8, 8);
rect (105, y*y, 8, 8);
rect (135, y*y, 8,8);
rect (165, y*y, 8,8);
rect (195, y*y, 8,8);
y=y+2;
}
}

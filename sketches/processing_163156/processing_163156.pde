
int x=200;
int y=100;
int z=350;
int q=100;

void setup() {
  size(700, 600);
  background(0);
}
void draw() {
  while (y<height) {
    window(x, y);
    y=y+100;
    q=q+100;
  }
  building();
}
void window(int x, int y) {
  fill(255);
  rect(x, y, 50, 50);
  strokeWeight(3);
  stroke(0);
  line(x+25, y, x+25, y+50);
  line(x, y+25, x+50, y+25);
  fill(255);
  rect(z, q, 50, 50);
  strokeWeight(3);
  stroke(0);
  line(z+25, q, z+25, z+50);
  line(z, q+25, z+50, q+25);
}
void building(){
  fill(255,255,255,2);
  rect(150, 80, 300, 550);
}

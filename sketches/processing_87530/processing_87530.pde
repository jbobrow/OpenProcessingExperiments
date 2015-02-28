
int diam=10;
int x;
int y;
float r, g, b;
void setup() {
  size(800, 800);
  noStroke();
  frameRate(5);
}
void draw() {
  while (y<height) {
    for (int i= 0; i<width; i=i+diam) {
      r=random(200);
      g=random(200);
      b=random(100, 150);
      fill(r, g, b);
      rect( x+i, y, diam, diam);
    }
    y=y+diam;
  }
}

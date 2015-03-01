
void setup() {
  size(500, 500);
  int x=0;
  int y=0;
  while (x<width) {
    while (y<height) {
      float z=random(245);
      float q=random(255); 
      float t=random(255);
      fill(z, q, t);
      rect(x, y, 10, 10);

      y=y+10;
    }
    x=x+10;
    y=0;
  }
}


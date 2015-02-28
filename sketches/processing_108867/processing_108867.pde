
void setup() {
  size(1200, 1200);
  smooth();
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(120);
  for (int i =20; i<width; i+=40) {
    for (int j = 20; j<height; j+=40) {

      if (int(random(0, 2))==0) {
        fill(0);
      }
      else {
        fill(12,345,100);
      }
      ellipse(i, j, 30, 30);
      ellipse(i,j,20,20);
      ellipse(i,j,10,10);
      ellipse(i+20,j+20,5,5);
      stroke(123,43,100);
    }
  }
}

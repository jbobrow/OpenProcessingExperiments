
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
        fill(12, 345, 100);
      }
      line(i,0,i,height);
      line(0,j,width,j);
      
    }
  }
}

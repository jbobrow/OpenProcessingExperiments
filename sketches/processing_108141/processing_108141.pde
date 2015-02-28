
void setup() {
  size(800, 800);
  background(255);
}
void draw() {

  for (int x=0; x<= 800; x = x + 100) {
    for (int y=0; y<= 800; y = y + 100) {
      int i=0;
      int a=0;
      while (i < 100) {    
        noStroke();
        fill(255 - a, 255 - a, 255);
        ellipse (x, y, 100 - i, 100 - i);
        i = i + 10;
        a = a + 10;
      }
      arc(x, y, 100, 100, HALF_PI+PI, PI+PI);
      arc(x, y, 100, 100, HALF_PI, PI);
    }
  }
}

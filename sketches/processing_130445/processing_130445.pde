
void setup() {
  size(600, 600); 
  background(0);
  frameRate(10);
}
void draw() {
  background(0);
  for ( int x = 50; x < width-50; x = x + 50) {
    for ( int y = 50; y < height-50; y = y + 50) {
      for ( float j = 0; j < 10; j= j+.1) {
        fill(255);
        arc(x, y, 30, 30, 0, PI);
      }
    }
  }
}




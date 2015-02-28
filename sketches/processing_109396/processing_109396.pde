
void setup () {
  size(500, 500);
  background (0, 0, 0);
  colorMode(HSB,100);
}
void draw() {
  for (int i = 50; i < 500; i = i+50) {
    for (int j = 50; j < 500; j = j+50) {
      noStroke();
      float c = map(j,0,500,50,20);
      fill(171,c,93);
      
      float m = map(i,50,500,5,35);
      ellipse(i, j, m, m);
    }
  }
}

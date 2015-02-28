
void setup() {
  size(1366, 768);
  smooth();
  colorMode(HSB, 360, 100, 100);
  noLoop();
  noStroke();
}

void draw() {
  background(48,19,93);
  for (int i = 20; i < width; i += 40) {
    for (int j = 20; j < height; j += 40) { 
     // println(i+"i");
     // println(j+"j");
      if (i==820) {
        fill(360, 0, 0);
      }
      else if (j==220) {
        fill(360, 0, 0);
      }
      else {
        float r=random(100);
        if (r<30) {
          r=random(50)+50;
        }
        float l=random(100);
        if (l<30) {
          l=random(50)+50;
        }
        fill(random(360), r, l);
      }

      ellipse(i, j, 30, 30);
    }
  }
}

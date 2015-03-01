
void setup() {
  size(500, 500);
  background(48, 52, 60);
  frameRate(30);
  smooth();

  int col = int(random(217));

  int a = 10;
  int b = 20;
  for (int i = 0; i < 10; i++) {
    int c = int(random(50));
    int d = int(random(50));
    stroke(249, col, 0);
    line(a, b, c, d);
    a = c;
    b = d;
    for (int j = 0; j < 15; j++) {
      int e = 10*j;
      int f = 20*j;
      for (int k = 0; k < 10; k++) {
        int g = int(random(50*j));
        int h = int(random(50*j));
        stroke(249, col, 0);
        line(e, f, g, h);
        e = g;
        f = h;
      }
    }
  }
}

void draw() {
  //col = int(random(217));
}





void setup () {
  frameRate(3);
  size (600, 600);
  fill(255);
  stroke(150);
  background(0);
}

void draw () {
  float b = random(0, 50);
  int a = 0;
  while (a<=120) {
    int d = 0;
    while (d <=600) {
      fill(d, a, b/6);
      ellipse(d*5, a*5, b, b);
      d = d + 10;
    }
    a = a + 10;
  }
}





void setup () {
  size (200, 200);
  background (#1CDFE8);
  strokeWeight (1);
  line (20, 10, 80, 10);
}

void draw () {
  for (int x=10; x<100; x=x+x) {
    stroke (0);
    if (x>30) {
      stroke(255);
    }
    line(20, x*2, 80, x+10);
  }
}

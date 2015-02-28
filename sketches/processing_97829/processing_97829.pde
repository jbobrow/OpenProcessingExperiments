
void setup () {
  size (200, 200);
  background (#1CDFE8);
}
int x;
void draw () {
  strokeWeight (1);
  smooth (1);
  line (20, 10, 80, 10);
  for (int x=10; x<100; x=x+x) {
    line(20, x*2, 80, x+5);
  }
}

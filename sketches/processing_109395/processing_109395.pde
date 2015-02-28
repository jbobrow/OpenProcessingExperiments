
void setup () {
  size(500, 500);
  background (0, 0, 0);

  for (int i = 10; i < 500; i = i+50) {
    line(i-20, 0, 500, i/1.1);
    stroke(76, 250, 255);
  }
}

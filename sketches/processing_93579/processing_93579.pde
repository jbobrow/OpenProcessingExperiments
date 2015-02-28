
void setup() {
  size (200, 200);
  background (225);
}
void draw() {
    int x=5;
    fill (60,50,200);
    noStroke();
  while (x<=200) {
    rect ((x*x), 10, 15, 15);
    rect ((x*x), 60, 15, 15);
    rect ((x*x), 110, 15, 15);
    rect ((x*x), 160, 15, 15);
    x=x+2;
  }
}

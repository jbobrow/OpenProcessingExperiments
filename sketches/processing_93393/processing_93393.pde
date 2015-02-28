
void setup() {
  size (200, 200);
  background (#8EEADF);
}
void draw() {
    int x=4;
    fill (#0931BC);
    noStroke();
  while (x<=200) {
    rect ((x*x), 10, 15, 15);
    rect ((x*x), 60, 15, 15);
    rect ((x*x), 110, 15, 15);
    rect ((x*x), 160, 15, 15);
    x=x+2;
  }
}

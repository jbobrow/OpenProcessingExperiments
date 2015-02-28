
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/71516*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
void setup() {
  size(500, 500);
  background(11, 70, 15);
}
void draw() {
  for (int a = -50; a < 550; a += 79) {
    for (int c = 68; c < 510; c += 135) {
    pattern(c, a);
  }
  }
  for (int i = -90; i < 700; i += 79) {
    for (int b = 0; b < 700; b += 135) {
      pattern(b, i);
    }
  }
}
void pattern(int x, int y) {
  stroke(0, 0, 0);
  strokeWeight(2);
  fill(247, 223, 2);
  beginShape();
  vertex(x, y);
  vertex(x+13, y+8);
  vertex(x+13, y+58);
  vertex(x+57, y+84);
  vertex(x+57, y+97);
  vertex(x+44, y+104);
  vertex(x, y+79);
  vertex(x-44, y+104);
  vertex(x-55, y+100);
  vertex(x-55, y+83);
  vertex(x-13, y+58);
  vertex(x-13, y+8);
  endShape();
}



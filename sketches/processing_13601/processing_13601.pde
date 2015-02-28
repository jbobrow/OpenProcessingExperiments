
void setup() {
  size(100, 100);
  textSize(18);
  textAlign(CENTER);
  frameRate(1);
}

void draw() {
  background(0);
  int s = second();
  int m = minute();
  int h = hour();
  String t = h + ":" + nf(m, 2) + ":" + nf(s, 2);
  //println(t);
  text (t, 50, 55);
}


void setup() {
  size(300, 220);
  PFont font;
  smooth();
  font = loadFont("din.vlw");
  textFont(font, 12);
  frameRate(1);
}

void draw() {
  background(0);
  int s = second();
  int m = minute();
  int h = hour();
  float m1 = map(m, 0, 59, 0, 200);
  float s1 = map(s, 0, 59, 0, 200);
  float h1 = map(h, 0, 23, 0, 200);
  rect(50, 75, s1, 15); //seconds bar
  rect(50, 125, m1, 15); //minutes bar
  rect(50, 175, h1, 15); //hours bar
  text(int(s), 30, 87);
  text(int(m), 30, 137);
  text(int(h), 30, 187);
  text("A 24 hour clock with bars", 50, 40);
  text("representing the time", 50, 52);
}



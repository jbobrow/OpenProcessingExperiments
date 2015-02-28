
void setup() {
  size(300,300);
  PFont font;
  smooth();
  font = loadFont("Monospaced-48.vlw");
  textFont(font, 16);
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
  fill(170, 255, 240) ;
  rect(50, 75, s1, 15); //seconds bar
  fill(5, 210, 180) ; 
  rect(50, 125, m1, 15); //minutes bar
  fill(15, 120, 105) ;
  rect(50, 175, h1, 15); //hours bar
  text(int(s), 30, 87);
  text(int(m), 30, 137);
  text(int(h), 30, 187);
 
}

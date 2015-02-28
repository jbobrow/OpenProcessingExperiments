
PFont font;

void setup() {
  size(600, 600);
  stroke(255, 116, 116);
  font = loadFont("MyriadPro-Cond-48.vlw");
  textFont(font);
}

void draw() {
  background(0);
  float s = map(second(), 0, 60, 0, 600);
  float m = map(minute(), 0, 60, 0, 600);
  float h = map(hour(), 0, 24, 0, 600);
  fill(255, 116, 116);
  rect (0, 0, s, 600);
  fill(200, 71, 71);
  rect(0, 200, m, 400);
  fill(100, 53, 53);
  rect(0, 400, h, 600);
  
  int a = second();
  int b = minute();
  int c = hour();
 // int d = day ();
  // The nf() function spaces the numbers nicely
  String t = nf(c,2) + ":" + nf(b,2) + ":" + nf(a,2) ;
 // textAlign(CENTER);
  text(t, 0, height/2+10);
}


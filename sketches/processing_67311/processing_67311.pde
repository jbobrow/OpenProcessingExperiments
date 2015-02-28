
// credit Thanks this guy http://www.openprocessing.org/sketch/45156 
//to help me to see the structure to adapt for my idea.

void setup() {
  size(270, 270);
  PFont font;
  smooth();
  noStroke();
  font = loadFont("SansSerif-12.vlw");
  textFont(font, 12);
  frameRate(1);
}

void draw() {
  background(255);
  int s = second();
  int m = minute();
  int h = hour();
  float m1 = map(m, 0, 59, 200, 0);
  float s1 = map(s, 59, 0, 0, 200);
  float h1 = map(h, 0, 23, 0, 200);

  fill(241, 90, 36);
  rect( 75, 50, 15, 200); //hours bar2

  fill(250, 150, 30);
  rect( 75, 50, 15, h1); //hours bar


  fill(42, 171, 226);
  rect(125, 50, 15, 200); //minutes bar2

  fill(163, 194, 230);
  rect(125, 50, 15, m1); //minutes bar


  fill(166, 124, 82);
  rect(175, 50, 15, 200); //seconds bar2
  fill(200, 180, 150);
  rect(175, 50, 15, s1); //seconds bar

  fill(128, 128, 128);
  text(int(h), 74, 40);
  text(int(m), 125, 40);
  text(int(s), 173, 40);
  }



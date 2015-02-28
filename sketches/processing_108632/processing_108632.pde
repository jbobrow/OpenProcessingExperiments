
PFont font;
  PImage time;


void setup() {
  size(300, 300);

  smooth();
  font = loadFont("SansSerif-48.vlw");
  textFont(font, 12);
  
   time=loadImage("time.jpg");
   size(300,300);

  frameRate(1);
}
 
void draw() {
  background(1,161,227);



  int s = second();
  int m = minute();
  int h = hour();
  float m1 = map(m, 0, 59, 0, 200);
  float s1 = map(s, 0, 59, 0, 200);
  float h1 = map(h, 0, 23, 0, 200);
  
  noStroke();
  fill(250,89,123);
  rect(50, 75, s1, 30); 
  fill(250,89,3);
  rect(50, 125, m1, 15); 
  fill(249,240,3);
  rect(50, 175, h1, 5); 
  fill(0);
  text(int(s), 30, 87);
  fill(0);
  text(int(m), 30, 137);
  fill(0);
  text(int(h), 30, 187);
 
}




void setup() {
  size(700,200);
  smooth();
}

void draw() {

  background(255);

  PImage j;
  j = loadImage("joanofarc.jpg");
  image(j, 0, 0);

  float s = map(second(), 0, 60, 0, 200);
  float m = map(minute(), 0, 60, 0, 200);
  float h = map(hour(), 0, 24, 0, 200);

  noStroke();
  fill(0);
  rect(0, 0, 30, height); 
  rect(100, 0, 30, height);
  rect(200, 0, 30, height);
  rect(300, 0, 30, height);
  rect(400, 0, 30, height);

  fill(#939393); 
  rect(0, 200, 30, -s);
  fill(#D4D5D6);
  rect(100, 200, 30, -m);
  fill(#F0F4F5);
  rect(200, 200, 30, -h);

  fill(0);
  rect(500, 0, 300, 200);

  PFont font;
  font = loadFont("CalistoMT-Italic-48.vlw");
  textFont(font, 30);
  fill(#E6E9EA);
  text("Tonight.", 500, 100);
  text("Freedom awaits.", 500, 190);
}



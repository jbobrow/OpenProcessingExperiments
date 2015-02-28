
PFont myDisplayFont;

void setup() {
  size(400, 400);
  background(255);
  smooth();
  myDisplayFont = loadFont("BannerPlain-100.vlw");
  fill(10);
  //textFont(nameOfFontVariable, size you want to use);
  textFont(myDisplayFont, 70);
  textAlign(RIGHT);
}


void draw() {
  //text("what you want to say", x-position of left bottom corner, y-position of left bottom corner);
  text("code rocks2!", width-20, 50);
}



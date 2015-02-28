
String txt1 = "the quick brown ";
String txt2 = "fox jumps over!";
String txt3 = "the lazy dog!";

int x = 0;

PFont font;

void setup() {
  size(700, 400);
  smooth();
  font = loadFont("BrownstoneSans-Thin-48.vlw");
}

void draw() {
  background(20);





  fill(#FFFF35);
  textFont(font, 90);
  text(txt1, x, 90);
  text(txt1, x-1400, 90);

  fill(#FFBF18);
  textFont(font, 100);
  text(txt2, x, 220);
  text(txt2, x-1400, 220);

  fill(#FF3300);
  textFont(font, 100);
  text(txt3, x, 340);
  text(txt3, x-1400, 340);


  //speed of the text
  x = x - 4;

  if (x < - 800) {
    x = 400;
  }
  if (mousePressed) {
    x = x - 20;
    textFont (font, 14);
    fill(255);
    text ("R U N  F A S T", mouseX, mouseY);
  }
}




PFont font;
String one = "Everything";
String two = "in its right place...";
float opacity = 0;
int y = 400;
int m;

void setup() {
  size(370, 320);
  font = loadFont("Rockwell-100.vlw");
  textFont(font);
}

void draw() {
  opacity+=0.5;
  y--;
  m++;
  if (m<255) {
    background(0);
    textFont(font);
    textSize(60);
    fill(193, opacity);
    text(one, 15, y);
    textFont(font);
    textSize(40);
    fill(193, opacity);
    text(two, 15, y+50);
  }
}



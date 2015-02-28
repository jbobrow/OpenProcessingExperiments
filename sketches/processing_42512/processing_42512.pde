
String txt = "Lorem ipsum dolor sit amet";

int y = 0;

PFont carattere;

void setup() {
  size(400, 200);
  smooth();
  carattere = loadFont("GothamRounded-Medium-20.vlw");
}

void draw() {
  background(255);
  fill(0, 129, 255);
  textFont(carattere, 20);
  text(txt, 65, y);
  y = y + 1;


  if (y>200) {
    text(txt, 65, y);
    y=0;
  }
}



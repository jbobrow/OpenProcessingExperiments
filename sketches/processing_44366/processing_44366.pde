
String txt = "ERROR";

int lenght = 110;
float x = -lenght;
float speed = 2;
PFont font;

void setup() {
  size(240, 120);
  smooth();
  font = loadFont("BookAntiqua-Bold-48.vlw");
}
void draw() {
  background(74, 5, 5);
  x += speed;
  if (x > width+lenght) {
    x = -lenght;
  }
 fill(255, 0, 0);
textFont(font, 48);
text(txt, x, 70);
}



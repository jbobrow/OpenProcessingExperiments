
String message = "pulse";
float xpos;
float angle = 0.0;

void setup() {
  size(500, 500);
  PFont font;
  font = loadFont("AndaleMono-60.vlw");
  textFont(font, 60);
  smooth();
}

void draw() {
  xpos = 0;
  
  fill(255);
  translate(mouseX, mouseY);
  scale(sin(angle) + 2);
  text("pulse", xpos, 0, 0);
  fill(0);
  text("pulse", xpos, 1, 1);
  angle += 0.1;
}




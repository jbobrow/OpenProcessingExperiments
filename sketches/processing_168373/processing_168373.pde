
PFont font;
float x1 = 0;
float x2 = 100;

void setup() {
  size(300,300);
  font = loadFont("Serif-48.vlw");
  textFont(font);
  fill(0);
}

void draw() {
  background(10, 10, 204);
  text("Two Ships", x1, 50);
  text("In the Night", x2, 100);
  x1 += 1.0;
  if (x1 > 100) { x1 = -150; }
  x2 -= 0.8;
  if (x2 < -150) { x2 = 100;}
}




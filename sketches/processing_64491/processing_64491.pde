
String message = "multiply";
float x, y;
float h, v;

void setup() {
  size(800, 800);
  smooth();
  noStroke();
  PFont font = loadFont ("HelveticaNeue-Bold-48.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);

  h = textWidth(message) /2;
  v = (textAscent() + textDescent()) /2;
}

void draw()
{

  float x, y;
  float speed = dist(random(pmouseX), random(pmouseY), mouseX, mouseY);
  fill(0, 25);
  text("multiply", mouseX, mouseY);

  if ((abs(mouseX) > h) && abs(mouseY) > v) {
  }
}
void blur() {
  background(255, 205);
}



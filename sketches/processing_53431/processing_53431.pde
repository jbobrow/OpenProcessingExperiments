
float angle = 0.0;
PFont scotch;
String donut = "fruitloop";

void setup() {
  size(500, 500);
  smooth();
  loadFont("ScotchRomanMTStd-48.vlw");
}

void draw() {
  translate(mouseX, mouseY);
  rotate(angle);
  float r = random(255);
  float g = random(255);
  float b = random(255);
  fill(r,g,b);
  textSize(20);
  text(donut,20,20);
  angle += 0.1;
}


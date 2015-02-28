
String word = "RUNNN!";

float x, y;
float hr, vr;

void setup() {
  background(255);
  size(500, 500);

  smooth();
  PFont font = loadFont ("Dax-Black-48.vlw");
  textFont(font);
  textAlign(CENTER,CENTER);
  hr = textWidth(word)/2;
  vr = (textAscent() + textDescent()) /2;
  noStroke();
  x = CENTER;
  y = CENTER;
}

void draw() {


  fill(255,50);
  rect(0, 0, width, height);
  fill(0);

  if (abs(mouseX - x) < hr &&
    abs(mouseY - y) < vr) {
    x += random(-1, 5);
    y += random(-1, 5);
  }
  text("RUNNN!", x, y);
  text("RUNNN!", random(x), random (y));
}



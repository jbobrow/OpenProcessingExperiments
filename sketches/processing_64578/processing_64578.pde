
String word = "heavy";

float x, y;
float hr, vr;
float r;

void setup() {
  background(255);
  size(500, 500);
  smooth();

  PFont font = loadFont("MiloOT-Bold-48.vlw");
  textFont(font);
  textAlign(CENTER, CENTER+5);
  hr = textWidth(word) / 2;
  vr = (textAscent() + textDescent()) / 2;

  x = width/2;
  y = height/2;
}

void draw() {

  r=random(2, 25);
  fill(255, 100);
  //rect(0, 0, width, height);

  fill(0,20);

  if (abs(mouseX - x) < hr &&
    abs(mouseY - y) < vr) {
    x += random(-1,1);
    y += random(-1,1);
    textSize(200);
    text("heavy", x+r, y+r);
  }
}



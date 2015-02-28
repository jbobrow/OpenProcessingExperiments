
String message = "tickle";
float x, y; 
float hr, vr; 

void setup() {
  size(500, 500);
  PFont font = loadFont("GillSans-72.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width / 2;
  y = height / 2;
}

void draw() {



  if (abs(mouseX - x) < hr &&
    abs(mouseY - y) < vr) {

    fill(17, 157, 133, 50);
    text("paste", x, y);
    x += random(-50, 50);
    y += random(-50, 50);
  }

  fill(17, 157, 133, 50);
  text("copy", x, y);
}




















String message = "P.I.E.";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text
PFont font;
void setup() {
  size(500, 200);
  String[] fontList = PFont.list();
  println(fontList);
  font = createFont("Times-Roman", 50);
  textFont(font);
  textAlign(CENTER, CENTER);
  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width / 2;
  y = height / 2;
}

void draw() {
  background(#73F2EB);
  fill(204, 120);
  rect(0, 0, width, height);
  fill(255);
  // If the cursor is over the text, change the position
  if (abs(mouseX - x) < hr &&
    abs(mouseY - y) < vr) {
    x += random(-5, 5);
    y += random(-5, 5);
  }
  textFont(font, 44);
  text("P.I.E.", x, y);
  textFont(font, 12);
  text("Prototyping Interactive Experiences", width/2, height-10);
}





String message = "tickle";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text

void setup() {
  size(400, 400);
  PFont font = loadFont("AmericanTypewriter-24.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width / 2;
  y = height / 2;
}

void draw() {
  // instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top
  fill(204, 10, 10, 120);
  rect(0, 0, width, height);
  fill(0);
  // If the cursor is over the text, change the position
  if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
    x += random(-5, 5);
    y += random(-5, 5);
  }
  text("MOUSE", x, y);
}


                
                

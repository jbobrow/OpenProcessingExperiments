
PFont din;
PFont akko;

String message = "d i z z y";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text

void setup() {
  size(500, 500);
  smooth();

  // Create the font
  din = loadFont("DINPro-Bold-48.vlw");
  akko = loadFont("AkkoRoundedStd-Black-48.vlw");
  textAlign(CENTER, CENTER);

  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width / 2;
  y = height / 2;
}

void draw() {
  // Instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top

  fill(0);
  rect(0, 0, width, height);

  // If the cursor is over the text, change the position
  if (abs(mouseX - x) < hr &&
    abs(mouseY - y) < vr) {
    x += random(-5, 5);
    y += random(-5, 5);
  }

  if (keyPressed == true) {
    background(255);
    textFont(din);
    textSize(30);
    text("vértigò", x, y);
  } 

  fill(random(256));
  textFont(akko);
  textSize(random(0, 80));
  text("d i z z y", random(width), random(height));
}




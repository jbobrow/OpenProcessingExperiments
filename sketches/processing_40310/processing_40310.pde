
String words = "cookie";
String message = "mouse";
float x, y; 
float hr, vr;  // horizontal and vertical radius of the text
PFont f;

void setup() {

  size(400, 400);
  background (0, 0, 0);
  strokeWeight(3);
  textAlign(CENTER, CENTER);
  hr = textWidth(message);
  vr = (textAscent() + textDescent());
  noStroke();
  x = width / 2;
  y = height / 2;
  f = loadFont("CourierNewPSMT-60.vlw");
}

void draw() {
  background(0, 0, 0, 100);
  int rows = 20;
  int cols = 20;


  fill(255);

  if (abs(mouseX - x) < hr &&
    abs(mouseY - y) < vr) {
    x += random(-2, 2);
    y += random(-2, 2);
  }
  textSize(15);
  text("mouse ", x, y);

  if (mousePressed == true) {
    textSize(100);
    fill(240, 201, 58);
    textFont(f);
    text("COOKIE", 200, 200);
    x+=random(-15, 15);
    y+=random(-15, 15);
  }
}



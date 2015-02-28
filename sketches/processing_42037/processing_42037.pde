
String txt = "Draw a running text, which is moving uniformly across the workspace...";
int xPos = 300;
PFont Baskerville;

void setup() {
  size(400, 400);
  smooth();
  Baskerville  = loadFont("Baskerville.vlw");
}

void draw() {
  background(200);
  fill(50);
  textFont(Baskerville, 16);
  text(txt, xPos, 40);
  xPos = xPos - 1;
  if (xPos <= -520){
    xPos = 401;
  }
}

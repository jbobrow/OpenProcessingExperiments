
PFont f;
float angle = 0.0;


void setup() {
  size(600, 600);
  smooth();
  f = loadFont ("ConduitITCStd-ExtraLight-48.vlw");
  textFont(f);
  noStroke();
  fill(0);
}

void draw() {
  translate(mouseX, mouseY);
  rotate(angle);
  text("DIZZY", -15, 30);
  angle += 3;
}




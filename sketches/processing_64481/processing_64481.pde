
PFont f;
float angle = 0.0;


void setup() {
  size(600, 600);
  smooth();
  f = loadFont ("ConduitITCStd-Bold-48");
  textFont(f);
  noStroke();
}

void draw() {
  translate(mouseX, mouseY);
  rotate(angle);
  text("DIZZY", -15, 30);
  angle += 0.1;
}




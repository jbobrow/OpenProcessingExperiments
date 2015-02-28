
PFont gyousho, eng;

float theta;

void setup() {
  size(150, 400);
  background(0);
  smooth();

  gyousho = loadFont("gyousho.vlw");
  eng = loadFont("eng.vlw");

  noStroke();
}


void draw() {
  fill(0, 80*abs(sin(theta)));
  rect(0, 0, width, height);

  fill(255, 255, 0);
  textFont(gyousho, 50);
  text("東方永夜抄", 80, 20, 50, 350);

  textFont(eng, 40);
  pushMatrix();
  translate(30, 120);
  rotate(radians(90));
  text("Imperishable Night.", 0, 0);
  popMatrix();

  filter(BLUR, 1);

  theta += 0.05;
}



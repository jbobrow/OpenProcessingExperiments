
void setup() {
  size(1024, 760);
  noStroke();
  // noLoop();
}

void draw() {
  translate((width / 2), 400);
  rotate (PI);
    textSize(20); text("+ origin",0,0);
  drawTree(20, 120, 16);
}

void drawTree(float w, float h, int depth) {
  if (depth == 0) return;
  rect(0,0,w,h);
  // textSize(20); text("+",0,0);
  pushMatrix();
  translate (0,h);
  rotate(PI/6);
  drawTree(w*0.6, h*0.6, depth - 1);
  popMatrix();

  pushMatrix();
  translate (0, h);
  rotate((-1 * PI) / 6);
  drawTree(w*0.6, h*0.6, depth - 1);
  popMatrix();
}

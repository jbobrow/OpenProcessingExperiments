
void drawExploded() {
  drawWheel(0, 130, 0);
  drawTopCase(0, 100, 0);
  drawTopEdge(0, 50, 0);
  drawSide(0, 0, 0);
  drawBottomEdge(0, -50, 0);
  drawBottomFace(0, -100, 0);
}

void drawWheel(float xPos, float yPos, float zPos) {
  pushMatrix();
  translate(xPos, yPos, zPos);
  wheel.draw();
  popMatrix();
}

void drawTopCase(float xPos, float yPos, float zPos) {
  pushMatrix();
  translate(xPos, yPos, zPos);
  topCase.draw();
  popMatrix();
}

void drawTopEdge(float xPos, float yPos, float zPos) {
  pushMatrix();
  translate(xPos, yPos, zPos);
  topEdge.draw();
  popMatrix();
}

void drawSide(float xPos, float yPos, float zPos) {
  pushMatrix();
  translate(xPos, yPos, zPos);
  side.draw();
  popMatrix();
}

void drawBottomEdge(float xPos, float yPos, float zPos) {
  pushMatrix();
  translate(xPos, yPos, zPos);
  bottomEdge.draw();
  popMatrix();
}

void drawBottomFace(float xPos, float yPos, float zPos) {
  pushMatrix();
  translate(xPos, yPos, zPos);
  bottomFace.draw();
  popMatrix();
}


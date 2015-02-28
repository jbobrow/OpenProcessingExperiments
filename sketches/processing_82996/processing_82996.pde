
void drawExploded() { //exploded view position
  drawWheel(0, 130, .5);
  drawTopCase(0, 100, 0);
  drawTopEdge(0, 50, 0);
  drawSide(0, 0, 0);
  drawBottomEdge(0, -50, 0);
  drawBottomFace(0, -100, 0);
}

void drawWheel(float xPos, float yPos, float zPos) {
  pushMatrix();
  float y = lerp(-10, yPos, t);
  translate(xPos, y, zPos);
  wheel.draw();
  popMatrix();
}


void drawTopCase(float xPos, float yPos, float zPos) {
  pushMatrix();
  float y1 = lerp(-10, yPos, t);
  translate(xPos, y1, zPos);
  topCase.draw();
  popMatrix();
}

void drawTopEdge(float xPos, float yPos, float zPos) {
  pushMatrix();
  float y2 = lerp(-10, yPos, t);
  translate(xPos, y2, zPos);
  topEdge.draw();
  popMatrix();
}

void drawSide(float xPos, float yPos, float zPos) {
  pushMatrix();
  float y3 = lerp(-10, yPos, t);
  translate(xPos, y3, zPos);
  side.draw();
  popMatrix();
}

void drawBottomEdge(float xPos, float yPos, float zPos) {
  pushMatrix();
  float y4 = lerp(-10, yPos, t);
  translate(xPos, y4, zPos);
  bottomEdge.draw();
  popMatrix();
}

void drawBottomFace(float xPos, float yPos, float zPos) {
  pushMatrix();
  float y5 = lerp(-10, yPos, t);
  translate(xPos, y5, zPos);
  bottomFace.draw();
  popMatrix();
}



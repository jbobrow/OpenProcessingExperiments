
int[] xPos;
int[] yPos;
int[] varSize;
int xPosVal;
int yPosVal;

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  xPosVal = 75;
  yPosVal = 75;
  xPos = new int[5];
  for (int i = 0; i< xPos.length; i++) {
    xPos[i] = xPosVal;
    xPosVal += 75;
  }
  yPos = new int[5];
  for (int i = 0; i< yPos.length; i++) {
    yPos[i] = yPosVal;
    yPosVal += 75;
  }
  varSize = new int[5];
  for (int i = 0; i < varSize.length; i++) {
    varSize[i] = 34;
  }
}

void draw() {
  background(230, 230, 240);
  rectMode(CENTER);
  for (int i = 0; i < 5; i++) {
    fill(xPos[i], 0, 220, 60);
    if (mouseX > xPos[i] - varSize[i]/2 && mouseX < xPos[i] + varSize[i]/2 && mouseY > yPos[i] - varSize[i]/2 && mouseY < yPos[i] + varSize[i]/2 && mousePressed == true) {
      fill(varSize[i], 100, 200, 60);
    }
    if (mouseX > xPos[i] - varSize[i]/2 && mouseX < xPos[i] + varSize[i]/2 && mouseY > yPos[i] - varSize[i]/2 && mouseY < yPos[i] + varSize[i]/2) {
      varSize[i] += 1;
    }
    rect(xPos[i], yPos[i], varSize[i], varSize[i]);
  }
}



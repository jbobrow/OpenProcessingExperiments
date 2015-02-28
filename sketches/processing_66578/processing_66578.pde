
int[] posXList;
int[] posYList;
int[] squareSize;

void setup() {
  size(500, 500);
  posXList = new int[5];
  posXList[0] = 30;
  posXList[1] = 200;
  posXList[2] = 350;
  posXList[3] = 400;
  posXList[4] = 450;

  posYList = new int[5];
  squareSize = new int[5];
  
  strokeWeight(10);

  rectMode (CENTER);

  for (int i = 0; i < posYList.length; i++) {
    posYList[i] = 200;
  }

  for (int i = 0; i < squareSize.length; i++) {
    squareSize[i] = 20;
  }
}

void draw() { 
  background(mouseX, mouseX/2, mouseY);
  fill(255, 255, 255, 50);

  for (int i = 0; i < posXList.length; i++) {
    if (mousePressed && mouseX > posXList[i] && mouseX < posXList[i] + 50 && mouseY > posYList[i] && mouseY < posYList[i] + 50 ) {
      squareSize[i] = squareSize[i] + 1;
    }
    rect(posXList[i], posYList[i], squareSize[i], squareSize[i]);
  }
}


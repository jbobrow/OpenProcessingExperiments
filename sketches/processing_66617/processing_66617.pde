

int[] posX;
int[] posY;
int[] cubeSize;

void setup() {
  background(255);
  size(500, 500);

  posX = new int[6];
  posY = new int[6];
  cubeSize = new int[12];

  for (int i = 0; i < posX.length; i++) {
    posX[i] = i*80+10;
    posY[i] = i*80+10;

    cubeSize[i] = 50;
  }
}

void draw() {  
  background(255);
  smooth();

  for (int i = 0; i < 6; i++) {
    if (mouseY > posY[i]
      && mouseY < posY[i] + cubeSize[i]
      && mouseX > posX[i]
      && mouseX < posX[i] + cubeSize[i]
      && mousePressed) {
      cubeSize[i]++;
    }
    noFill();
    rect(posX[i], posY[i], cubeSize[i], cubeSize[i]);  
  }
}

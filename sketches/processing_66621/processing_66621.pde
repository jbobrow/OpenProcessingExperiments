
int[] positionXList;
int[] positionYList;
int[] mySize;

void setup() {
  size(700, 700);

  positionYList = new int[5];
  positionYList[0] = 200;
  positionYList[1] = 300;
  positionYList[2] = 350;
  positionYList[3] = 450;
  positionYList[4] = 500;

  positionXList = new int[5];
  positionXList[0] = 200;
  positionXList[1] = 200;
  positionXList[2] = 200;
  positionXList[3] = 200;
  positionXList[4] = 200;

  mySize = new int[5];

  for (int i = 0; i < 5; i++) 
  {
    mySize[i] = 10;
  }
}


void draw() {
  background(100);

  for (int i = 0; i < 5; i++) {
    rect(positionXList[i], positionYList[i], mySize[i], mySize[i]);
  }
}


void mousePressed() {
  for (int i = 0; i <5; i++) {
    if (mouseX > 200 && (mouseX < 200 + mySize[i]) && mouseY > positionYList[i] && (mouseY < positionYList[i]+mySize[i]))
    {
      mySize[i] = mySize[i] + 1; 
    }
  }
}

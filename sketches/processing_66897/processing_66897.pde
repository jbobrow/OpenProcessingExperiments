
int[] positionX;
int[] positionY;
int mySize;

void setup() {
  size(500, 500);
  background(0);
  mySize = 0;
  positionX = new int[100];
  positionY = new int[100];
  for (int i = 0; i < positionX.length; i++) {
    positionX[i] = (int) random(5, 250);
    positionY[i] = (int) random(5, 250);
    mySize = (int) random(5, 250);
    rect(positionX[i], positionY[i], mySize, mySize);
  }
}

void draw() {
}

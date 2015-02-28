
int nElements = 100;
int myArray[];

void setup() {
  myArray = new int[nElements];
  size (200, 200);
  for (int i=0; i < nElements; i++) {
    int randomInt = (int)random(100);
    myArray[i] = randomInt;
    background (randomInt);
  }
}

void draw() {
  for (int i=0; i<nElements; i++) {
    int insideMailboxNumber = myArray[i];
    if (insideMailboxNumber >= 96) {
      text(i, 90, 100);
      break;
    }
  }
}
void mouseClicked() {
    for (int i=0; i < nElements; i++) {
    int randomInt = (int)random(100);
    myArray[i] = randomInt;
    background (randomInt);
  }
}


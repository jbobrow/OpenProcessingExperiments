
int myArray[];
int nElements = 100;

void setup() {
  size (300, 30);
  background (250, 162, 73);

  myArray = new int[nElements];

  for (int i=0; i < nElements; i++) {
    int randomInt = (int)random(100);
    myArray[i] = randomInt;
  }
  int indexNum = -100;

  for (int n=0; n < nElements; n = n+1) {
    if (myArray[n] >= 96) {
      indexNum = n;
    }
  }

  if (indexNum == -100) {
    text ("value >= 96 not found", 70, 20);
  }
  else {
    text ("value >= 96 found at index: " + indexNum, 70, 20);
  }
}


void mousePressed() {
  setup();
}

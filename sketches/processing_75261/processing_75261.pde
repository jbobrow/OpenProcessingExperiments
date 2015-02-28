
int myArray[];
int nElements = 100;

void setup() {
  size(200,50);
  background(0);

  myArray = new int[nElements];
  
  for (int i=0; i < nElements; i++) {
    int randomInt = (int)random(100);
    myArray[i] = randomInt;
  }

  int index = -1;

  for (int j=0; j < nElements; j++) {
    if (myArray[j] >= 96) {
      index = j;
      break;
    }
  }


  if (index == -1) text("value >= 96 not found", 20, 30);
  else text("value >= 96 found at index " + index, 20, 30);

  return;
}

void mousePressed(){
  setup();
}

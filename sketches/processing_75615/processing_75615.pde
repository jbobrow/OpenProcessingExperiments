
size(150, 100);
background(31, 27, 119);

int myArray[];
int nElements = 100;
myArray = new int[nElements];
for (int i=0; i < nElements; i++) {
  int randomInt = (int)random(100);
  myArray[i] = randomInt;
}

for (int i=0; i < nElements; i++) {
  if (myArray[i] >= 96) {
    text ("Array number: " + i, 10, 40);
    text ("Value: " + myArray[i], 10, 60);
    break;
  }
}

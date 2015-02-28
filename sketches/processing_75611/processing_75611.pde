
int myArray[];
size(100,100);
background(114, 167, 38);
int nElements = 100;
myArray = new int[nElements];
for (int i=0; i < nElements; i++){
  int randomInt = (int)random(100);
  myArray[i] = randomInt;
}

for (int i=0; i< nElements; i++) {
  int test = myArray[i];
    if (test >= 96) {
      fill(231, 214, 255);
      textAlign(CENTER);
      text(i, width/2, height/2);
      break;
    }
 }



int myArray[];
int nElements = 100;



float xStep = 5;

void setup() {
  size(500, 400);
  smooth();

  myArray = new int[nElements];
  for (int i = 0; i<nElements; i++) {
    int randomInt = (int)random(100);
    myArray[i] = randomInt;
  }

  findGreaterOrEqual(96);
  drawLines();
}



void drawLines() {


  for (int i=0; i< myArray.length; i++) {
    line(i*xStep, 0, i*xStep, myArray[i]);
  }
}


void findGreaterOrEqual(int number) {
  int Val = 0;
  int index = -1;
  for (int i = 0; i <nElements; i++) {
    int currentVal = myArray[i];
    if (currentVal >= number) {
      Val = currentVal;
      index = i;
    } 
    
  }

  println("Value= " + Val + ", at index " +index);
  //println("Minimum Value= " + minVal + ", at index " +minIndex);
  fill(255, 0, 255);
  ellipse(xStep*index, Val, 5, 5);
}

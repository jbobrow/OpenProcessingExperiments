
int myArray[];
int nElements = 100;

void setup() {
  size(200, 200);
    myArray = new int[nElements];
    for (int i=0; i < nElements; i++){
    int randomInt = (int)random(100);
    myArray[i] = randomInt;
  }
  textSize(30);
}

//returns -1 if element not found
int search(int[] A){
  for(int i = 0; i < A.length; i++) {
    if(A[i] >= 96)
      return i;
  }
  return -1;
}

void draw() {
  background(255);
  fill(0);
  
  text(search(myArray), width/2 - 10, height/2);
}

void mousePressed() {
  setup();
}

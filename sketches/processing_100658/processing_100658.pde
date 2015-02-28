

int myArrayLength = 20;
int [] myArray = new int [myArrayLength];
boolean sorted = false;
PFont font;
 
void setup () {
  size (600, 600);
  background (255); 
  smooth ();
  frameRate (20);
  font = createFont ("Arial", 10, true);

  for (int i = 0; i < myArrayLength; i++) {
    myArray[i] = i+1;
  }
  shuffle(myArray); 
}

void draw() {
  fill(0);
  textFont(font, 20);
  text("Bubble Sort", 50, 100);
  
  if (!sorted) {
    bubbleSort (myArray);
  }
  if (sorted) {
    noLoop();
  }
  visualizeArray (myArray);
  delay (150);
}

void mouseReleased () {
  if (!sorted) {
    loop();
  }
}

void bubbleSort(int[] sortArray) { 
  int holder;
  if (!sorted) {
    sorted = true;
 
    for (int i=0; i < sortArray.length - 1; i++) {
      if (sortArray[i] > sortArray[i+1]) {
        holder = sortArray[i];
        sortArray[i] = sortArray[i+1];
        sortArray[i+1] = holder;
        sorted = false; 
      }
    }
  }
}

void shuffle (int[] shuffleArray) {
  int holder; 
  int pick; 
 
  for (int i=0; i< shuffleArray.length; i++) {
    holder = shuffleArray[i]; 
    pick  = (int) random(shuffleArray.length - 1);
    
    if (pick != i) {
      shuffleArray[i] = shuffleArray[pick];
    } 
    else {
      pick = pick + 1;
      shuffleArray[i] = shuffleArray[pick];
    }
 
    shuffleArray[pick]= holder;
  }
}

  int calcY (int arrayVal, int aLength, int [] a) {
  int bounds = height/aLength; 
  int reverseYAxis = max(a) -arrayVal;
  int lwrBound = reverseYAxis * bounds;
  int uprBound = lwrBound + bounds;
  int yLoc = (lwrBound + uprBound) / 2; 
  return yLoc;
}

  int calcX (int arrayPos, int aLength) {
  int bounds = width/aLength;
  int lwrBound = arrayPos * bounds;
  int uprBound = lwrBound + bounds;
  int xLoc = (lwrBound + uprBound) / 2; 
  return xLoc;
}

void visualizeArray (int[] visualizeArray) {
  int arrayLength = visualizeArray.length;
  fill (255, 255); 
  rectMode(CORNERS);
  noStroke();
  rect (0, 0, width, height);
  
  fill(0);
  textFont(font, 24);
  text("Bubble Sort", 75, 100);
  
  fill(150);
  textFont(font, 20);
  text("Ana Vlajnic", 90, 125);
 
  for (int i = 0; i < arrayLength; i ++) {
    fill (100, 100, 255);
    rectMode (CENTER);
    rect (calcX(i, arrayLength), calcY (visualizeArray [i], arrayLength, visualizeArray), 6, 6);
  }
}



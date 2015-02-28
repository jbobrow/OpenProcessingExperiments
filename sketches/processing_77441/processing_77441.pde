
//Rohan Rathod, andrewid: rkrathod
//Hw_9, Tuesday 30 OCT 2012, 48-257 Processing for the Arts
//All materials and images on this code Copyright (c) Rohan Rathod, 2012. 
//===============================================================
//declaring the array
int [] mynumbers = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};//set of numbers

PFont font1, font2;//load fonts
int fontSize;// store a font size

//====================================================================================================
void setup() {
  size(500, 500);
  background(255);
  fill(0);
  textAlign(CENTER);
  smooth();

  fontSize = width/13;//set font size to be proportional to window size

  font1 = loadFont("Wideawake-48.vlw");
  font2 = loadFont("WideawakeBlack-48.vlw");
}
//====================================================================================================
void draw() {
  background(255);
  compArrayLength();
  compArraySum();
  printMean();
  printGreatLength();
}
//====================================================================================================
// LIST OF FUNCTIONS

void compArrayLength() {//computes the length of the array
  textFont(font1, fontSize);
  text( "Length of array is:" + mynumbers.length, width/2, height/2);
}

void compArraySum() {//computes the sum of all values in the array
  int arraySum = 0;

  for (int i = 0; i < mynumbers.length; i++) {
    arraySum = arraySum + mynumbers[i];
  }
  textFont(font2, fontSize);
  text("Sum of the array is:" + arraySum, width/2, height/2 + fontSize);
}

float meanArray() {//computes the arithemetic mean of the values in the array
  float arraySum = 0;
  float mean;

  for (int i = 0; i < mynumbers.length; i++) {
    arraySum = arraySum + mynumbers[i];
  }
  mean = arraySum/mynumbers.length;
  
  return mean;
}

void printMean(){//prints the arithmetic mean
  textFont(font1, fontSize);
  text("Average of the array is:" + meanArray(), width/2, height/2 + 2 * fontSize);
}

float greatLength() {//finds the sum of all values that are greater than the mean
  float arraySum = 0;
  for (int i = 0; i < mynumbers.length; i++){
    if (mynumbers[i] > meanArray()) {
      arraySum = arraySum + mynumbers[i];
    }
  }
  return arraySum;
}

void printGreatLength(){//prints the sum of all values greater than the mean
    textFont(font2, fontSize);
  text("Sum of values > avg:" + greatLength(), width/2, height/2 + 3 * fontSize);
}


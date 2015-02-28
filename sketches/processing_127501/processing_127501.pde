
//an array is a list of variables that are numbered
//the number appears after the name, between []
//to declare an array, you indicate the type of variable, 
//the name, and then how many items you have in the array
//type name[] = new type[number of items]
//(we have top specify a size when creating an array)
//the numbering in an array starts always in 0
int numCircles = 50;
float myY[] = new float[numCircles];
//this means that I now have myY[0], myY[1], myY[2], myY[3], etx
float myNicePosition[] = new float[numCircles];
float mySpeed[] = new float[numCircles]; 
int red = 0;
void setup() {
  size(500, 500);
  background(255);
  smooth();
  /*a for loop allows to repeat a certain code n number of times
   you can think of it as an intelligent copy-paste, that changes certain
   values in the code automatically
   a for loop has 3 components:
   - declare a variable to be changed and its initial value (usually 0)
   - the maximum value (often the size of the array)
   - how much the variable will be increased in each loop cycle (usually 1,++)
   */
  for (int n=0;n<numCircles;n++) {
    myY[n]=random(500);
    myNicePosition[n]=50;
    mySpeed[n]=random(10);
  }
}
void draw() {
  background(255);
  red+=2;
  noStroke();
  fill(red, 0, 0, 127);
  //
  for (int n=0;n<numCircles;n++) {
    myNicePosition[n]+=mySpeed[n];
    ellipse(myNicePosition[n], myY[n], 50, 50);
    if (myNicePosition[n]>width || myNicePosition[n]<0) {
      mySpeed[n]*=-1;
    }
  }
  //
  if (red>=255) {
    red=0;
  }
}




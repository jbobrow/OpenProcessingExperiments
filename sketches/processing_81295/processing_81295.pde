
/*
 * Jillian Warren
 * jlw29@sfu.ca
 * Novemeber 1, 2012
 *
 * Assignment 3.1: 
 * Using procedural programming, generate a vector(one-­‐dimensional array) that contains
 * all the integers between [1:99] in random order and create an animation that visualizes a sorting
 * algorithm while it orders them in increasing order.
 *
 * Inpsiration from:
 * http://forum.processing.org/topic/randomize-array
 * http://www.processing.org/discourse/alpha/board_Programs_action_display_num_1059766998.html
 *
 * Description: 
 * Y-Axis is the integer value. X-Axis is the position in the array. 
 * The Y-Axis has been reversed so that the small value is at the bottom instead of the top. 
 * For example, when 1 has been sorted into position 0 of the array, it will be located in the bottom left-hand corner of the canvas. 
 * While the mouse is pressed the visualization will pause and display the position and the value in the following format: positionInArray[integer value]
 */


/*Global Variables*/
int myArrayLength = 100;
int [] myArray = new int [myArrayLength];
boolean sorted = false; 
PFont myFont;




/*Setup*/
void setup () {

  size (1200, 800); 
  background (255); //white
  smooth ();
  frameRate (4);
  myFont = createFont ("arial", 10);


  //intialize array with values 1-99  
  for (int i = 0; i < myArrayLength; i++) {
    myArray[i] = i+1;
  }//end for

  //call methed that checks array methods (shuffle, sort)
  //arrayCheck (myArray);

  //comment line below and uncomment previous line to check method functionality
  shuffle(myArray); //shuffle contents of array
}//end setup




/*Draw*/
void draw() {
  if (!sorted) {
    //println ("while is called");
    bubbleSort (myArray);
  }
  if (sorted) {
    noLoop();
  }
  visualizeArray (myArray);
  delay (300);
}




/*Methods*/

void mousePressed() {
  if (!sorted) {
    printArray(myArray);
    noLoop();
  }//end if
}//end mousePressed



void mouseReleased () {
  if (!sorted) {
    loop();
  }//end if
}//end mouseReleased



//create method to sort array
void bubbleSort(int[] sortArray) { 

  int holder; 

  // if the array isn't sorted (sorted initialized as false)
  if (!sorted) { 

    /*change sorted to true 
     *if they are all in order already then if statement - trigger for false - will not be executed, no sorting is necessary
     *if they are not in order, the array will keep being cycled through until false trigger in if statement is no longer triggered
     */
    sorted = true; 

    // loop through array (except for last element: -1)
    for (int i=0; i < sortArray.length - 1; i++) { 
      //println ("I've entered bubble sort for loop");

      if (sortArray[i] > sortArray[i+1]) { 
        //println ("I've entered bubble sort if");
        // swap values 
        holder = sortArray[i]; 
        sortArray[i] = sortArray[i+1]; 
        sortArray[i+1] = holder; 

        sorted = false; // trigger's been hit, array isn't sorted
      }//end if
    }//end for
  }//end while
}//end bubleSort



//create method to check array methods
void arrayCheck (int[] checkArray) {
  println ("Initial array: "); //check all numbers are there
  println (checkArray); 

  println ("Shuffled array: "); //check shuffle of numbers
  shuffle (checkArray);
  println (checkArray);


  println ("Sorted array: "); //check to see if sorted, should look same as initial array
  bubbleSort (checkArray);
  println (checkArray);
}//end arrayCheck



//create method to shuffle array
void shuffle (int[] shuffleArray) {

  int holder; //holder to help swap #'s
  int pick; //pick other # in array

  //swap current item in current postion 'i' with the item in a random position in the array
  for (int i=0; i< shuffleArray.length; i++) {
    holder = shuffleArray[i]; //assign item at current pos to temp
    pick  = (int) random(shuffleArray.length - 1); //choose random # within the bounds of the array to be used for # swap

    //don't allow a position # to switch with itself
    if (pick != i) {
      shuffleArray[i] = shuffleArray[pick];
    } //end if
    else {
      pick = pick + 1;
      shuffleArray[i] = shuffleArray[pick];
    }//end else

    shuffleArray[pick]= holder;
  }//end for
}//end shuffle



//create method to find y location (arrayVal is value at pos [x], aLength is length of array)
int calcY (int arrayVal, int aLength, int [] a) {
  int bounds = height/aLength; //will be 6 in the current case (600/100)
  int reverseYAxis = max(a) -arrayVal; // reverse order of representation on Yaxis (smallest value in array will be displayed at bottom instead of top)
  int lwrBound = reverseYAxis * bounds;
  int uprBound = lwrBound + bounds;
  int yLoc = (lwrBound + uprBound) / 2; // center within section vertically

  return yLoc;
}//end calcY



//create method to find x location (arrayPos is position in array, aLength is length of array)
int calcX (int arrayPos, int aLength) {
  int bounds = width/aLength;
  int lwrBound = arrayPos * bounds;
  int uprBound = lwrBound + bounds;
  int xLoc = (lwrBound + uprBound) / 2; // center within section horizontally

  return xLoc;
}//end calcX



//create method to visualize array
void visualizeArray (int[] visualizeArray) {
  int arrayLength = visualizeArray.length;

  fill (255, 100); // set alpha level so trail can be left of previous locations
  rectMode(CORNERS);
  noStroke();
  rect (0, 0, width, height);

  for (int i = 0; i < arrayLength; i ++) {
    fill (0);
    rectMode (CENTER);
    rect (calcX(i, arrayLength), calcY (visualizeArray [i], arrayLength, visualizeArray), 6, 6);
  }//end for
}//end visualizeSort



//create method to visualize array
void printArray (int[] printArray) {
  int arrayLength = printArray.length;
  textFont (myFont);

  for (int i = 0; i < arrayLength; i ++) {
    fill (255, 0, 0);
    text (i + "[" + printArray[i] + "]", calcX(i, arrayLength) + 5, calcY (printArray [i], arrayLength, printArray));
  }//end for
}//end printSort




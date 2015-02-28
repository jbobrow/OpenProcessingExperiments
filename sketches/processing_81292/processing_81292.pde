
/* title: eylul_iscen_A3_Q1
 description: create an animation that visualizes a sorting algorithm
 created: November, 2012
 by:Ozgun Eylul Iscen
 */

//create global variables
int [] myNumbers = new int [100]; //holds the numbers 

int temp;
Square [] [] matrix; //declare a 2d array (cols and rows) to hold Square objects
int cols=10; //columns of the matrix to be displayed
int rows=10; //rows of the matrix to be displayed
int insert; //variable used in insertion sort
int i = 1; // used as the loop iterator variable for sorting


//set the initials
void setup () {
  size (400, 400);  //set the size 
  matrix=new Square [cols] [rows]; // initialize the matrix of Square objects

  //loop over the rows and columns of the matrix in the nested for loop
  for (int k=0; k <cols; k++) {
    for (int l=0; l<rows; l++) {
      matrix [k][l]=new Square (k*40, l*40, 40, 40, 255); //initialize each of the Square instances in the matrix
    }
  }//end nested loop

  // fill the myNumbers array with ordered integers first from 0 to 99 (so 100 values in total) 
  for (int i=0; i<=99; i++) {
    myNumbers[i] = i;
  }

  shuffle(myNumbers);// call shuffle function to randomize the order within myNumbers array
} // end setup

//call the draw method type of void
void draw () {
  frameRate(15); //set the framerate (assing lower value to observe the animation of sorting slower)
  background (255); //update the background
  //loop over the cols and rows in nested loop
  for (int k=0; k<cols; k++) {
    for (int l=0; l<rows; l++) {
      matrix [k][l].setColor(myNumbers[l + k*rows]*2); //set the color of the Square's with the 
      //corresponding number in the myNumbers array
      matrix [k][l].display(); //call the display function of each Square in the matrix
    }
  }

  //create an algorithm for insertion sort
  if (i <myNumbers.length) //iterate over the length of myNumbers
  {
    int moveItem = i;  //declare a variable to initialize the location where to insert the value
    int insert = myNumbers[i]; //declare variable insert to hold the temporary values to insert while the other values are moved
    //search for a place to put the value with while statement
    while (moveItem > 0 && myNumbers[moveItem-1] > insert)  //while the value is larger than 0 and the value to be inserted 
    {
      myNumbers[moveItem] = myNumbers[moveItem -1];  //shift the value right one slot
      moveItem=moveItem-1;
    } //end while

    myNumbers[moveItem] = insert;  //place the inserted value
    i++; //increment loop variable
  } //end if
}

void shuffle(int[]a) // function to shuffle the numbers in an array so that they are in random order
{
  int temp; //variable to store the value of current position 
  int pick; //variable to hold the picked value 
  for (int i=0;i<a.length;i++) { //iterate over the elements of given array
    pick  = (int)random(a.length); // picks a rondom position in the array
    temp = a[i]; // stores the value of current position
    a[i] = a[pick]; // copies picked value into current position
    a[pick]= temp; // store original value in picked position
  }
}

/*note: For sorting algorithm, I looked at some exercises in the chapter 'Sorting:A Deeper Look' 
 from the book'How To Program C' written by Deitel&Deitel (2007).
 */
/**
 *  Square.pde
 *  Created by Ozgun Eylul Iscen
 *  Nov, 2012
 *  Class to create a matrix made of squares all over the canvas
 *  defines attributes xpos, ypos, width, height, and color
 *  defines setColor and display methods
 */


// create a class identified as Sqaure to create a matrix with squares all over the canvas
class Square {
  
  float xpos, ypos;  //x and y location
  float w,h;  //width and height
  color c; //color
  
  //has one constructor with defined with arguments
  Square (float tempXpos, float tempYpos, float tempW, float tempH, color tempC) {
    //the constructor rewritten to incorporate multiple argumetns by using temporary local variables
    xpos=tempXpos;
    ypos=tempYpos;
    w=tempW;
    h=tempH;
    c=tempC;
  } //end constructor
  
  //the Square class has two methods (setColor and display)
  void setColor( int col)  //create a function identified as setColor
  {
    c = col; // set the color of the square
  } //end setColor
  
  void display () {  //create a function identified as display
    stroke (0);  //turn on stroke function
    strokeWeight (2); //set stroke thickness to 2
    fill (c);  //fill with variable c 
    rect (xpos, ypos,w,h); // //render the rectangle at xpos, ypos coordinates with w on x axis and h on y axis
  } //end display
} //end class 



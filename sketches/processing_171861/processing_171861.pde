
/* (<This is a multi-line comment, start comment with this)
 Click the black box to use the program.
 Type any key to produce colors.
 Click the mouse to clear the screen.
 Program makes a grid of colors starting at top left going
 to the right. And top right going down. The color is controlled
 by typing a key. The mouse click clears the screen.
 (end comment with this >) */
// (<This is a single line comment)
// void just means that the function setup() will not be given any arguments
void setup() { //Initial code the program starts with, does this once in the program at the beginning
  size(310, 310); //size of display 290 * 290
  frameRate(30); //do what ever is in the draw() function 30 times a second
  noStroke(); //no stroke on outside of rectangle
  colorMode(HSB); //colormode HSB : (hue,saturation,brightness)  so I can change just the Hue and make pretty colors
  background(0); //background starts as black
  rectMode(CORNERS); //rectangles are made corner to corner
}
//the int function tells the program that the value will be an integer, float variable; would denote a float
int squarex1 = 10; //first square's x value starts at 10
int squarey1 = 10; //first square's y value starts at the top
int change = 20; //change in values, it's 20 because i want the squares to be evenly spaced apart
int squarex2 = 290; //second square's x value starts at right side
int squarey2 = 10; //second square's y value starts at the top
// these values will change and move the squares

void draw() { //draw all of this stuff continuously 30 times a second
  if ( mousePressed == true) { //if the mouse is pressed
    background(0); //erase the screen by making the background black
  }
  float randomhue = random(255); //random hue (makes random colors), hue.
  fill(randomhue, 255, 255); //makes the fill color the random colors with most saturation and most brightness 
  /* if statements are like so
   if (condition) {
   statement
   }
   if the condition is true then do the statement. condition in paranthesi and statement in brackets.
   */
  if (keyPressed == true) { //if any key is being pressed do what is indented.
    println("Colors!!!"); //print Colors at black box on bottom of screen 'ln' means make a new line every time
    if (squarex1>width) { //if first square's x value is greater than the width, if it hits the right side of screen,
      squarex1=10; //make the first square's x value 0, so start on left side of screen again.
      squarey1=squarey1+change; //then drop the square down the change amount (20). it makes the square go down to the next row.
    }
    if (squarey1>height) { //if the square hits the bottom of the screen
      squarey1=10; //make it go back up to the top
    }
    if (squarex2<10) { //if the second square hits the left of screen
      squarex2=290; //go back to the right
    }
    if (squarey2>height) { //if the 2nd square hits the bottom of the screen 
      squarey2=10; //go to the top
      squarex2=squarex2-change; //move the 2nd square to the left by the change value
    }
    rect(squarex1, squarey1, squarex1+10, squarey1+10); //make the first square from its x,y values +10 makes it a square
    rect(squarex2, squarey2, squarex2+10, squarey2+10); //same
    squarex1 += change; //move 1st square right by change, notice that this code will execute only if a key is being pressed so the squares wont move if you don't type.
    squarey2 += change; //moves the 2nd square down (by change) each time
  }
}


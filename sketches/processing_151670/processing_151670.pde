
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * In the next iteration of the square drawing sketch, this version selects a random number of squares
 * and a random gap between them. From this it calculates the width of each square then draws the squares
 * using two nested for loops.
 *
 * A simple drop shadow is also drawn to give the illusion of depth.
 * 
 */

int betweenGap;
int maxOffset;

int maxSquareSize;
int minSquareSize;


void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(1);
  randomSeed(hour() + minute() + second() + millis());
  
  // Variables to set the maximum (initial) square size and the smallest square size possible
  maxSquareSize = 130;
  minSquareSize = 10;
}


void draw() {

  background(220); // clear the screen to grey
  
  int betweenGap = getBetweenGap(maxSquareSize);
  
  // calculate number of squares that will fit width and height
  int NoOfXSquares =(int) (width / (maxSquareSize + betweenGap));
  int NoOfYSquares = (int) (height / (maxSquareSize + betweenGap));
  
  // calculate space around edges of image
  int XEdgeGap = (width - (NoOfXSquares * maxSquareSize + (NoOfXSquares - 1) * betweenGap)) / 2;
  int YEdgeGap = (height - (NoOfYSquares * maxSquareSize + (NoOfYSquares - 1) * betweenGap)) / 2;
  
  // debug line
  println("No Of X Squares = " + NoOfXSquares + ", No Of Y Squares = " + NoOfYSquares + ",  X Edge = " + XEdgeGap + ",  Y Edge = " + YEdgeGap);
  
  // begin drawing sqauares on a grid of specified size, at the specified position
  traverseGrid(NoOfXSquares, NoOfYSquares, XEdgeGap, YEdgeGap, maxSquareSize);
  
} //end of draw 

/*
* Draws squares on grid of xSquares by ySquares with starting position of xOffset, yOffset.
* Calls itself recursively if it randomly decides not to draw a square, but set up a new
* smaller 2x2 grid in its place.
*/
void traverseGrid(int xSquares, int ySquares, int xOffset, int yOffset, int squareSize) {
  
  //Setup variables to calculate max position change and whether smaller squares can be
  //drawn based on the current size
  betweenGap = getBetweenGap(squareSize);
  int maxJitter = (int)(betweenGap * 2.5);
  int breakupSize = ((int)squareSize)/2;
  boolean breakupAllowed = breakupSize > minSquareSize;
  
  // itterate through each square on grid
  for (int i=0; i<xSquares; i++) {
    for (int j=0; j<ySquares; j++) {
      // calculate this square's position
      int xJitter = (int) random(-maxJitter, maxJitter);
      int yJitter = (int) random(-maxJitter, maxJitter);
      int newXOffset = xOffset + i*(squareSize+betweenGap) + xJitter;
      int newYOffset = yOffset + j*(squareSize+betweenGap) + yJitter;
      
      // If smaller squares are possible, randomly decide whether to draw at the current size
      // or bread down into a 2x2 grid
      int breakupChoice = (int) random(10);
      if (breakupAllowed && breakupChoice < 7) {
        // draw smaller squares on new grid at current position
        traverseGrid(2, 2, newXOffset, newYOffset, breakupSize);
      }
      else {
        // draw square of current size
        drawSquare(newXOffset, newYOffset, squareSize);      
      }
    }
  }
  if (keyPressed && key == 's') {
    saveFrame("squares" + frameCount + ".jpg");
  }
}

/*
* Draws square at given position of given size
*/
void drawSquare(int xPos, int yPos, int squareSize) {
  // setup approx. ! in 10 chance of square being light purple
  int colourChoice = (int) random(10);
  if (colourChoice == 0) {
    fill(141, 65, 214, 180);
  }
  else {
    fill(59, 4, 112, 180);
  }
  
  //draw square
  rect(xPos, yPos, squareSize, squareSize);
}

/*
* Dynamically work out the gap between individual squares based on the square size
*/
int getBetweenGap(int squareSize) {
  if (squareSize > 40) {
    return squareSize/20;
  }
  else {
    return max(2, squareSize/10);
  }
}




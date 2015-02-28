
// Jason Safir :: db 5.4 :: 03/22/06

/*
5.4 Take db5.3 and implement a CheckerBoard class that is 
responsible for drawing a checker board. Use it to do so.
*/

/*-------global variables----------*/
int cellSize = 50;

//False until after the *first* click of the mouse
boolean firstClick = false;

boolean followMode = false;

CheckerBoard layout;      // assigns CheckerBoard class

/*-------initialization--------------*/
void setup() {
  size(400,400);
  background(255);
  stroke(0);
  framerate(15);
  layout = new CheckerBoard(cellSize);
  layout.fillCheckerBoard();     //fill checkerBoard with CheckerCells
}


/*----------------------CheckerBoard properties--------------*/

class CheckerBoard {
  //an array holding all of the CheckerCell objects necessary to create the checker board
  CheckerCell checkerBoard[]; 
  int cellSize; 

/*----------------------CheckerBoard Methods--------------*/

public CheckerBoard(int ccFocus) {
  cellSize = ccFocus;
  checkerBoard = new CheckerCell[width/cellSize*height/cellSize];
  }

//fill checkerBoard with CheckerCells
public void fillCheckerBoard() {
  //the number of cells in a row
  int cellsInRow = width/cellSize;
  //the number of cells in a column
  int cellsInColumn = height/cellSize;

  //index into checkerBoard array
  int checkerBoardIndex = 0;

  //the fill color
  int ccFill = 0;
  int r = 102;
  int g = 150;
  int b = 220;

  //track the fill color of the first cell in each column to ensure 
  //no two adjacent are the same
  boolean topFill = false;

  //iterate through the checkerBoard array and construct a new CheckerCell
  //for each element in the array
  //
  //traverse across the columns
  for (int row = 0; row < cellsInRow; row++) {
    if (topFill) { 
      ccFill = 0; 
    }
    else { 
      ccFill = 255;
    }
    //traverse down each column
    for (int column = 0; column < cellsInColumn; column++) {
      //create a new CheckerCell object with the correct parameters
      checkerBoard[checkerBoardIndex] = new CheckerCell(row*cellSize,column*cellSize,r,g,b,cellSize,ccFill, random(255));
      checkerBoardIndex++;
      //flip the fill value
      ccFill = 255 - ccFill;
    }
    //flip boolean that records whether the first cell of the new column is white or black,
    //based on the value of the first cell of the previous column.
    topFill = !topFill; 
  } 
}

//change the locations of the cells
public void moveCheckerBoard() {
  for (int checkerBoardIndex = 0; checkerBoardIndex < checkerBoard.length; checkerBoardIndex++) {
    checkerBoard[checkerBoardIndex].move();
  }
}

//steps through the object array and gives mouse position target coordinates
public void mouseTargets() {
  for(int i=0; i< checkerBoard.length; i++) {
    checkerBoard[i].setTarget(mouseX,mouseY);
   
  }
}

//this function steps through the object array and gives random target coordinates
public void randomizeTargets() {
  for(int i=0; i< checkerBoard.length; i++) {
    checkerBoard[i].setTarget(random(height),random(width));
   
  }
}

//draw the checker board
//returns: an integer indicating which cell is under the mouse
public void drawCheckerBoard() {
  //  CheckerCell CCell;
  //the cell that is outlined; -1 tells us that there is no cell under the mouse
  int ccFocus = -1;

  //traverse the checkerBoard array and extract each object, and tell it to draw itself
  for (int checkerBoardIndex = 0; checkerBoardIndex < checkerBoard.length; checkerBoardIndex++) {
   checkerBoard[checkerBoardIndex].draw();
 
    //check to see if that cell is under the mouse
    if (checkerBoard[checkerBoardIndex].checkFocus()) {
      //if it is, set cFocus to the index number
      ccFocus = checkerBoardIndex;
    }
  }
  
  //was there a cell with the mouse over it?
  if (ccFocus != -1) {
    //if so, then tell that cell to draw its focus
    checkerBoard[ccFocus].focus();
  }
}

}

/*---------------------- CheckerCell properties--------------*/

// Class that defines a single cell of a checker board
class CheckerCell {
  //position
  int x;
  int y;
  //speed
  private int xSpeed;
  private int ySpeed;
  //target position
  private  float targetX;
  private  float targetY;
  //varies the speed
  private float deltaSpeed;

  // colors
  private int r;
  private int g;
  private int b;
  
  private int ccSize;
  private int ccStroke;
  private int ccAlpha;
  private Logo safir;

  /*----------------------CheckerCell methods--------------*/
  //constructor method
  public CheckerCell(int x, int y, int r, int g, int b, int ccSize, int ccStroke, float ccAlpha) {
    //assign a value to our x property
    this.x = x;
    this.y = y;
    this.r = r;
    this.g = g;
    this.b = b;
    this.ccSize = ccSize;
    this.ccStroke = ccStroke;
    this.ccAlpha = int(ccAlpha);
    this.deltaSpeed = random(10,30);
    safir = new Logo(x + ccSize/2, y + ccSize/2);    // assigns and centers Safir logo inside cell
  }

  //draws the cell. This is public because other objects will need to be able to tell
  //the object to draw itself.
  public void draw() {
    int r = (int)random(50,75);
    int g = (int)random(0,50);
    int b = (int)random(200,255);
    fill(r, g, b, ccAlpha);
    stroke(r, g, b);
    rect(x,y,ccSize,ccSize);
    safir.drawLogo();
  }

  //draws a rectangle around the cell to show that it's the focus
  //This is public because other objects will need to be able to tell
  //the object to display this.
  public void focus() {
    noFill();
    strokeWeight(2);
    stroke(0,0,0);
    rect(x,y,ccSize,ccSize);
  }

  //check to see if this cell is under the mouse
  public boolean checkFocus() {
    if (mouseX > x && mouseX < x + ccSize && mouseY > y && mouseY < y + ccSize) {
      return true;
    } 
    else {
      return false;
    }
  }

// Eases and moves the cells
  public void move()
  {
    //change the speed, moving faster when further from the target.
    xSpeed += (targetX - x)/deltaSpeed;
    ySpeed += (targetY - y)/deltaSpeed;

    //slow the speed down over time
    xSpeed *= 0.92;
    ySpeed *= 0.92;

    //adjust the current location by the new speed.
    x += xSpeed;
    y += ySpeed;
    
    safir.move(x + ccSize/2, y + ccSize/2);
  }

  /*
   This is a function to set new values for some of the object's variables.
   A function like this is often called a "mutator function" or "mutator method".
   */
   
// Updates positions for cells  
  public void setTarget(float x, float y){
    targetX = x;
    targetY = y;
  }
}

/*----------------------logo properties--------------*/

class Logo {
  int xPos;
  int yPos;
  int safirXPos;

/*----------------------logo methods--------------*/

//constructor method
public Logo (int x, int y) {
    xPos = safirXPos = x;
    yPos = y;
  }

// Draws logo and animates them
public void drawLogo() {
  jiggle();
  
  int n = 10;
  int xPos = safirXPos;
  
  stroke(0);
  strokeWeight(1);
  line((xPos-105/n), (yPos-35/n), (xPos-77/n), (yPos-35/n));
  line((xPos-105/n), (yPos-35/n), (xPos-105/n), (yPos+1/n));
  line((xPos-105/n), (yPos+1/n), (xPos-77/n), (yPos+1/n));
  line((xPos-77/n), (yPos+1/n), (xPos-77/n), (yPos+47/n));
  line((xPos-77/n), (yPos+47/n), (xPos-105/n), (yPos+47/n));
  // Letter: A
  line((xPos-64/n), (yPos+47/n), (xPos-64/n), (yPos-35/n));
  line((xPos-64/n), (yPos-35/n), (xPos-32/n), (yPos-35/n));
  line((xPos-32/n), (yPos-35/n), (xPos-32/n), (yPos+47/n));
  line((xPos-64/n), (yPos-7/n), (xPos-32/n), (yPos-7/n));
  // Letter: F
  line((xPos-15/n), (yPos+47/n), (xPos-15/n), (yPos-35/n));
  line((xPos-15/n), (yPos-35/n), (xPos+15/n), (yPos-35/n));
  line((xPos-32/n), (yPos-35/n), (xPos-32/n), (yPos+47/n));
  line((xPos-15/n), (yPos-3/n), (xPos+15/n), (yPos-3/n));
  // Letter: I
  line((xPos+48/n), (yPos-35/n), (xPos+48/n), (yPos+47/n));
  // Letter: R  
  line((xPos+80/n), (yPos+48/n), (xPos+80/n), (yPos-35/n));
  line((xPos+80/n), (yPos-35/n), (xPos+104/n), (yPos-35/n));
  line((xPos+104/n), (yPos-35/n), (xPos+104/n), (yPos-5/n));
  line((xPos+104/n), (yPos-5/n), (xPos+80/n), (yPos-5/n));
  line((xPos+101/n), (yPos-5/n), (xPos+101/n), (yPos+42/n));
  line((xPos+101/n), (yPos+42/n), (xPos+106/n), (yPos+48/n));
  }

// Updates logo position
void move(int newX, int newY) {
  xPos = safirXPos = newX;

  yPos = newY;
}

// Animated logo
void jiggle() {
  safirXPos++;
  if (safirXPos > xPos+1) {
    safirXPos = xPos-1;
  }
}
}

/*----------------------USER INPUT-------------------------*/
//on mouse click, follow the mouse
void mousePressed() {
  followMode = true;
  
  if(!firstClick) {
    firstClick = true;
    layout.randomizeTargets();;
    }
}

//cells follow mouse
void mouseMoved() {
  if(followMode) {
  layout.mouseTargets();
  }
}

//on space bar, give random target coordinates to all the cells.
void keyPressed() {
  if(key == ' ') {
    followMode = false;
    layout.randomizeTargets();
  }
}

//main drawing loop
void draw() {
  background(255);
  //if the mouse has been clicked, then move the checker board
  if (firstClick) {
    layout.moveCheckerBoard();
  }
  //draws the checkerboard
    layout.drawCheckerBoard();
}


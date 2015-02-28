
/*
 * a simple sketch by Cym - http://cymspace.net/
 * as part of the processing class - October 3, 2009
 *
 * move squares back into the right order on a 3x3 grid
 *
 * click on a square next to the empty square to play
 * try to get the squares in this shape:
 *
 *  1 | 2 | 3
 * ---|---|---
 *  4 | 5 | 6
 * ---|---|---
 *  7 | 8 | 9 
 *
 */

color backgroundColor = color(204);
color squareColor = color(204,0,0);
color squareColorEmpty = color(51);
color squareColorHighlight = color(204,102,0);

/* an extra variable is needed to swap the square and the empty field */
int newEmptyLocation;
int newEmptyX;
int newEmptyY;

/* count the number of moves for the score at the end */
int totalMoves;
boolean playing;
boolean gameOver;

/* 
 * an array is used to store the squares with the numbers
 * there are only 9 squares, squares[0] is not used,
 * but it needs to be created anyway for the array
 */
SquareButton[] squares = new SquareButton[10];
SquareEmpty empty;

void setup() {
  size(400,300);
  background(backgroundColor);
  frameRate(15);
  
  playing = false;
  gameOver = false;
  totalMoves = 0;

  newEmptyLocation = 0;
  newEmptyX = 350;
  newEmptyY = 250;
  
  /* initialize each square
   * element 'empty' is used for the empty square
   * squares[0] is not used, but initialized anyway
   * it is easier to start counting with 1 for the squares
   * but the array starts with element 0
   */
  squares[0] = new SquareButton(350,250,0);
  squares[1] = new SquareButton(50,50,1);
  squares[2] = new SquareButton(150,50,2);
  squares[3] = new SquareButton(250,50,3);
  squares[4] = new SquareButton(50,150,4);
  squares[5] = new SquareButton(150,150,5);
  squares[6] = new SquareButton(250,150,6);
  squares[7] = new SquareButton(50,250,7);
  squares[8] = new SquareButton(150,250,8);
  squares[9] = new SquareButton(250,250,9);
  empty = new SquareEmpty(350,250,0);

  /* draw the squares on the grid */
  empty.display(squareColorEmpty);
  for(int i=1; i<=9; i++) {
    squares[i].display(squareColor);
  }
  
  /* and shuffle them to start the game */
  shuffleSquares();
}

void draw() {
  /*
   * void draw() is empty, but it is necessary to include it.
   * without void draw() the program will not loop.
   * if void draw() is left out, the program will just 
   * run once through the code and will then stop.
   * the lines will still be visible on the screen, but
   * the program will not react on mouse clicks.
   */
}

/* play many random moves to shuffle the game */
void shuffleSquares(){
  int shuffleMoves = 0;
  int oldSelected = 0;
  int selected = 9;
  while(shuffleMoves<=99) {
    if(selected!=oldSelected) {
      playSquare(selected);
      oldSelected = selected;
      shuffleMoves++;
    }
    selected = int(random(8))+1;
  }
  playing=true;
}

/* a field is selected on mouseRelease, not on mousePress */
void mouseReleased() {
  if(gameOver!=true) {
    for(int i=1; i<=9; i++) {
      if(squares[i].selected()==true) {
        playSquare(i);
        break;
      }
    }
  }
}

void playSquare(int selected) {
    switch(squares[selected].location) {
       case 1:
         if(empty.location==2 ||
            empty.location==4) { moveSquare(selected); }
         break;
       case 2:
         if(empty.location==1 ||
            empty.location==3 ||
            empty.location==5) { moveSquare(selected); }
         break;
       case 3:
         if(empty.location==2 ||
            empty.location==6) { moveSquare(selected); }
         break;
       case 4:
         if(empty.location==1 ||
            empty.location==5 ||
            empty.location==7) { moveSquare(selected); }
         break;
       case 5:
         if(empty.location==2 ||
            empty.location==4 ||
            empty.location==6 ||
            empty.location==8) { moveSquare(selected); }
         break;
       case 6:
         if(empty.location==3 ||
            empty.location==5 ||
            empty.location==9) { moveSquare(selected); }
         break;
       case 7:
         if(empty.location==4 ||
            empty.location==8) { moveSquare(selected); }
         break;
       case 8:
         if(empty.location==5 ||
            empty.location==7 ||
            empty.location==9) { moveSquare(selected); }
         break;
       case 9:
         if(empty.location==6 ||
            empty.location==8 ||
            empty.location==0) { moveSquare(selected); }
         break;
       case 0:
         if (empty.location==9) {
            moveSquare(selected);
          /* the game can only finish when the piece on field 0 is moved
             check if the game is solved correctly */
            checkResult();
        }
        break;
    }
}

void moveSquare(int selected) {
         newEmptyLocation = squares[selected].location;
         newEmptyX = squares[selected].x;
         newEmptyY = squares[selected].y;

         squares[selected].location = empty.location;
         squares[selected].x = empty.x;
         squares[selected].y = empty.y;
         
         empty.location = newEmptyLocation;
         empty.x = newEmptyX;
         empty.y = newEmptyY;

         empty.display(squareColorEmpty);
         squares[selected].display(squareColor);
         if (playing==true) { totalMoves++; }
}

void checkResult() {
  gameOver = true;
  int c = 1;
  while (gameOver==true && c<=9) {
    if (squares[c].location!=c) {
      gameOver=false;
    }
    c++;
  }
  if (gameOver==true) {
    empty.display(backgroundColor);
    for(int i=1; i<=9; i++) {
      squares[i].display(squareColorHighlight);
    }
    noStroke();
    fill(0);
    textAlign(LEFT);
    textFont(loadFont("LucidaSans-Demi-12.vlw"));
    text("Well done!",310,25);
    text(totalMoves+" moves",310,50);
    text("Press a key:",310,225);
    text("[R] restart",310,250);
    text("[Q] quit",310,275);
  }
}

void keyPressed() {
  if (key==ESC) {
    key=0;
  }
  if (key=='q' || key=='Q') {
    exit();
  }
  if (key=='r' || key=='R') {
    setup();
  }
}

/* ****************************** classes ****************************** */

class Square {
  int number; // the number of the square
  int location; // the locations of the square
  int x; // the x position of the square
  int y; // the y position of the square
  int s; // the size of the square
  color c; // the color of the square
  boolean selected;
  
  boolean selected() {
/* check if the mouse is over the square */
   if (mouseX >= x-(s/2) && mouseX <= x+(s/2) && 
         mouseY >= y-(s/2) && mouseY <= y+(s/2)) {
      return true;
    } else {
      return false;
    }
  }
}
  
class SquareButton extends Square {

  SquareButton (int tempX, int tempY, int tempN) {
    x = tempX;
    y = tempY;
    s = 96;
    c = color(192);
    number = tempN;
    location = tempN;
  }
  
  void display(int squareColor) {
    /* draw the square */
    int margin = 49;
    rectMode(CENTER);
    noStroke();
    fill(squareColor);
    rect(x,y,s,s);
    
    /* draw the number inside the square */
    noStroke();
    fill(255);
    textFont(loadFont("TrebuchetMS-Bold-48.vlw"), 48);
    textAlign(CENTER);
    text(number,x,y+18);
  }
}

class SquareEmpty extends Square {

  SquareEmpty(int tempX, int tempY, int tempN) {
    x = tempX;
    y = tempY;
    s = 96;
    c = color(42);
    number = tempN;
    location = 0;
  }
  void display(int squareColor) {
    /* draw the empty square */
    rectMode(CENTER);
    noStroke();
    fill(squareColor);
    rect(x,y,s,s);
  }
}


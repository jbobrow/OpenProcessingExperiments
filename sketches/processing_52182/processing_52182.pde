
// (VERY) simple game of Cidouri. For rules, see
// http://www.welovepuzzles.com/channel/japanese/cidouri/
//
// Author: Bob Roos; Allegheny College, Meadville, PA
// 11 Feb. 2012
//
// Illustrates "if" statements and boolean variables.
// (Not intended to be a viable Cidouri game; for that
// we should use arrays or array lists to hold data.)
//
// Missing (but doable with just "if" statements and
// simple variables): a check to see if the puzzle
// has been solved.
//
// Circles are in three columns, three rows, numbered
// as shown below. "(B)" means black, "(W)" means white:
//      11(B)   21(B)   31(W)
//      12(W)   22(B)   32(W)
//      13(W)           33(B)
//
// "x21" and "y21" are the x and y coordinates of
// the circle in column 2, row 1, etc.
//
// Boolean variables like "line1112" stand for "line from
// position 11 to 12, i.e., from the upper left circle
// to the circle immediately below it. Only valid
// lines (connecting black and white) have boolean 
// variables. In this trivial puzzle we don't need to worry
// about lines crossing.

// (x,y) coordinates of all circles in the puzzle:
float x11, y11, x21, y21, x31, y31, 
      x12, y12, x22, y22, x32, y32, 
      x13, y13,           x33, y33;
      
// If a boolean variable is true, we draw the corresponding
// line; otherwise, we don't:
boolean line2131, line2232, line1112, line1222, line3233, line1333;

int clickNumber;  // number of mouseclicks so far

int oddX, oddY, evenX, evenY; // mouse coordinates on
         // even-numbered and odd-numbered mouse clicks

void setup() {
  size(200, 200);
  smooth();
  // Assign locations to all circles in the puzzle:
  x11 = 50;  y11 = 50;
  x21 = 100; y21 = 50;
  x31 = 150; y31 = 50;

  x12 = 50;  y12 = 100;
  x22 = 100; y22 = 100;
  x32 = 150; y32 = 100;

  x13 = 50;  y13 = 150;
  x33 = 150; y33 = 150;
  
  // Initially, no lines show:
  line2131 = false;
  line2232 = false; 
  line1112 = false;
  line1222 = false;
  line3233 = false;
  line1333 = false;
  
  ellipseMode(CENTER);
  clickNumber = 0;
}

// Draws all circles, plus all lines whose boolean
// variables have been set to true:
void draw() {
  background(255);
  stroke(0);
  
  // Black circles:
  fill(0);
  ellipse(x11, y11, 30, 30);
  ellipse(x21, y21, 30, 30);
  ellipse(x22, y22, 30, 30);
  ellipse(x33, y33, 30, 30);
  
  // White circles:
  fill(255);
  ellipse(x31, y31, 30, 30);
  ellipse(x12, y12, 30, 30);
  ellipse(x32, y32, 30, 30);
  ellipse(x13, y13, 30, 30);
  
  // For each line, see if we should display it:
  if (line2131) {
    line(x21+15,y21,x31-15,y31);
  }
  if (line2232) {
    line(x22+15,y22,x32-15,y32);
  }
  if (line1112) {
    line(x11,y11+15,x12,y12-15);
  }
  if (line1222) {
    line(x12+15,y12,x22-15,y12);
  }
  if (line3233) {
    line(x32,y32+15,x33,y33-15);
  }
  if (line1333) {
    line(x13+15,y13,x33-15,y33);
  }
}

// When user presses mouse, remember where; do this
// separately for even and odd mouse clicks.
//
// The idea is that the user selects a starting point on
// an odd-numbered mouse click and the ending point on
// an even-numbered mouse click.
void mousePressed() {
  clickNumber = clickNumber + 1;
  
  // See if odd number of clicks:
  if (clickNumber % 2 == 1) {
    oddX = 1+(mouseX-20)/50; // use int division to translate
    oddY = 1+(mouseY-20)/50; // mouseX, mouseY to 1, 2, or 3
  }
  else {
    evenX = 1+(mouseX-20)/50; // use int division to translate
    evenY = 1+(mouseY-20)/50; // mouseX, mouseY to 1, 2, or 3
    
    // Now we tediously check all legal possibilities:
    //   Did the user click on the points at 11 and 12?
    if ( (oddX == 1 && oddY == 1 &&
          evenX == 1 && evenY == 2)
            ||  // We have to consider both orderings
         (oddX == 1 && oddY == 2 &&
          evenX == 1 && evenY == 1)) {
      line1112 = true;
      line1222 = false; // can't have 12 joined to two others
    }
    else // Did user click on 21 and 31?
    if ( (oddX == 2 && oddY == 1 &&
          evenX == 3 && evenY == 1)
            ||  // Consider both orderings
         (oddX == 3 && oddY == 1 &&
          evenX == 2 && evenY == 1)) {
      line2131 = true;
    }
    else  // Did user click on 12 and 22?
    if ( (oddX == 1 && oddY == 2 &&
          evenX == 2 && evenY == 2)
            ||  // Consider both orderings
         (oddX == 2 && oddY == 2 &&
          evenX == 1 && evenY == 2)) {
      line1222 = true;
      line1112 = false; // Can't have 12 connected to two others
      line2232 = false; // Can't have 22 connected to two others
    }
    else // Did user click on  22 and 32?
    if ( (oddX == 2 && oddY == 2 &&
          evenX == 3 && evenY == 2)
            ||  // Consider both orderings
         (oddX == 3 && oddY == 2 &&
          evenX == 2 && evenY == 2)) {
      line2232 = true;
      line1222 = false; // Can't have 22 connected to two
      line3233 = false; // Can't have 32 connected to two
    }
    else // Did user click on 32 and 33?
    if ( (oddX == 3 && oddY == 2 &&
          evenX == 3 && evenY == 3)
            ||  // Consider both orderings
         (oddX == 3 && oddY == 3 &&
          evenX == 3 && evenY == 2)) {
      line3233 = true;
      line2232 = false; // Can't have 32 connected to two
      line1333 = false; // Can't have 33 connected to two
    }
    else // Did user click on 13 and 33?
    if ( (oddX == 1 && oddY == 3 &&
          evenX == 3 && evenY == 3)
            ||  // Consider both orderings
         (oddX == 3 && oddY == 3 &&
          evenX == 1 && evenY == 3)) {
      line1333 = true;
      line3233 = false; // Can't have 33 connected to two
    }
  }
}



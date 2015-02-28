
// { imaginary opening code block for global variables

// global variables

// declare its name and assign a value
int xPos = 225;  // data type | variable name = value
int yPos = 225;
String firstname = "Ray";

void setup() {  // opening code block
  size(425, 425);

  // local variables
  int stageWidth = width;
  int stageHeight = height;
  println("hello " + firstname);  //

  background(69, 157, 191);
  smooth();
  stroke(255, 255, 255);
  strokeWeight(1);
  noFill();
  //fill(255, 0, 0);
}  // closing code block

void draw() {

  background(69, 157, 191);

  // cannot access the setup local variable stageHeight
  // println("stageHeight is " + stageHeight);

  xPos = 300;  // update the global variable xPos to 300
  int d = 40;  // create local variable for circle diameter to 40
  int e = 40;
  // 1st set
  // ellipse(20, 20, d, d);
  // ellipse(40, 20, d, d);
  // ellipse(20, 40, d, d);
  // ellipse(40, 40, d, d);

  // 2nd set
  // ellipse(20, 20, d, d);
  // ellipse(40, 20, d, d);
  // ellipse(20, 40, d, d);
  // ellipse(40, 40, d, d);

  // loop to create each column
  for (int cols = 0; cols < 10; cols++) {
    // nested loop to create rows for each column
    for (int rows = 0; rows < 10; rows++) {
      drawTile(40 * cols, 40  * rows, d);


// create second loop for the squares so they end a column and row early
      for (int cols2 = 0; cols2 < 9; cols2++) {
        // nested loop to create rows for each column
        for (int rows2 = 0; rows2 < 9; rows2++) {
          drawTile2(40 * cols2, 40  * rows2, e);
        }
      }
    }
  }
  // can access the setup local variable firstname
  // println("My firstname is " + firstname);
}


void drawTile(int xPos, int yPos, int d) { 
  ellipse(xPos + 20, yPos + 20, d, d);
  ellipse(xPos + 40, yPos + 20, d, d);
  ellipse(xPos + 20, yPos + 40, d, d);
  ellipse(xPos + 40, yPos + 40, d, d);
}


//} imaginary closing code block for global variables
void drawTile2(int xPos, int yPos, int e) {
  rect(xPos + 20, yPos + 20, e, e);
  rect(xPos + 40, yPos + 20, e, e);
  rect(xPos + 20, yPos + 40, e, e);
  rect(xPos + 40, yPos + 40, e, e);
}




// { imaginary opening code block for global variables
 
// global variables
 
// declare its name and assign a value
int xPos = 225;  // data type | variable name = value
int yPos = 225;
String firstname = "Steve";
 
void setup() {  // opening code block
  size(450, 450);
 
  // local variables
  int stageWidth = width;
  int stageHeight = height;
  println("stageHeight is " + stageHeight);  //
 
  background(15, 0 , 78);
  smooth();
  stroke(255, 255, 255);
  strokeWeight(1);
  ///fill(32, 141, 169);
  //fill(255, 0, 0);
}  // closing code block
 
void draw() {
 
  background(15, 0, 78);
 
  // cannot access the setup local variable stageHeight
  // println("stageHeight is " + stageHeight);
 
  xPos = 300;  // update the global variable xPos to 300
  int diameter = 40;  // create local variable for circle diameter to 40
 
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
      drawTile(40 * cols, 40 * rows, diameter);
    }
  }
 
  // can access the setup local variable firstname
  // println("My firstname is " + firstname);
}
 
void drawTile(int xPos, int yPos, int d) {
  fill(25, 100, 255);
  ellipse(xPos + 60, yPos + 60, d, d);
  fill(255, 255, 255);
  ellipse(xPos + 80, yPos + 60, d, d);
  fill(0, 0, 0);
  ellipse(xPos + 60, yPos + 80, d, d);
  fill(232, 29, 131);
  ellipse(xPos + 80, yPos + 80, d, d);
}
 
//} imaginary closing code block for global variables




//define global variables
int xPos = 0; //set up variable for x position and value starting at 0
int yPos = 0; //set up variable for y position and value starting at 0

//setup
void setup() {
  size(450, 450); //define window size
  background(255, 255, 255); //set background color
  smooth(); //smooth all vector graphics with anti aliase
}

//create custom function
void drawTile(int xPos, int yPos, int w, int h) { //define custom function with parameters including xposition, ypostition, width, and height
  stroke(200, 200, 200); //define stroke color
  fill(255, 255, 255); //set fill color for box 1
  rect(xPos, yPos, h, w); //set position and size for box 1
  fill(137, 149, 166); //set fill color for box 2
  rect(xPos+h, yPos, h, w); //set positionand size for box 2
  fill(224, 232, 243); //set fill color for box 3
  rect(xPos, yPos+w, w, h); //set position and size for box 3
  fill(166, 151, 120); //set fill color for box 4
  rect(xPos+w, yPos, w, h); //set position and size for box 4
  fill(243, 236, 224); //set fill color for box 5
  rect(xPos+w, yPos+h, h, w); //set position and size for box 5
  fill(255, 255, 255); //set fill color for box 6
  rect(xPos+w+h, yPos+h, h, w); //set position and size for box 6
}

//draw
void draw() {
  int w = 25; //setup local variable for width with orignal value at 25
  int h = w/2; //setup local variable for height with original value at 1/2 of width
  for (int cols = 0; cols < 10; cols++) { //define for loop with variable cols at 0, if less than ten, add 1
    for (int rows = 0; rows < 15; rows++) { //define for loop with variable rows at 0, if less than 15, add 1
      drawTile(50 * cols, 37 * rows, w, h); //call custom drawTile function with x position at 50 times cols, and 37 times, rows, width and height
    }
  }
}



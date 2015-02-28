
//define global variables
int xPos = 0; //setup variable for xposition starting at 0
int yPos = 0; //setup variable for yposition starting at 0

//setup
void setup() {
  size(450, 450); //setup window size
  background(255, 255, 255); //setup background color
  smooth(); //smooth all vector graphics
}

//setup custom function
void drawTile(int xPos, int yPos, int w, int h) { //setup custom variable with parameters for xposition, yposition, width, and height
  noStroke(); //setup no stroke
  fill(208, 91, 36); //setup fill color for box 1
  rect(xPos, yPos, h, w); //setup position and size for box 1
  fill(210, 172, 129); //setup fill color for box 2
  rect(xPos+h, yPos, h, w); //setup position and size for box 2
  fill(237, 119, 44); //setup fill color for box 3
  rect(xPos+w, yPos, w, h); //setup position and size for box 3
  fill(166, 142, 121); //setup fill color for box 4
  rect(xPos+w, yPos+h, w, h); //setup position and size for box 4
}

//draw
void draw() {
  int w = 10; //setup local variable for width starting at 10
  int h = w/2; //setup local variable for height starting at 1/2 width
  for (int cols = 0; cols < 23; cols++) { //start for loop with variable cols at 0, if less than 23, add 1
    for (int rows = 0; rows < 45; rows++) { //start for loop with variable rows at 0, if less than 45, add 1
      drawTile(20 * cols, 10 * rows, w, h); //call drawTile function with 20 times cols for xposition, 10 times rows for y position, and width and height
    }
  }
}



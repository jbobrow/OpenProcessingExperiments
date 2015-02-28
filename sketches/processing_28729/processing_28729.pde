
//define global variables
int xPos = 0; //setup global variable for xposition starting at 0
int yPos = 0; //setup global variable for yposition starting at 0

//setup
void setup() {
  size(450, 450); //setup window size
  background(255, 255, 255); //setup background color
  smooth(); //smooth all vector graphics
}

//setup custom function
void drawTile(int xPos, int yPos, int w, int h) { //setup custom function with parameters for xposition, yposition, width and height
   noStroke(); //set no stroke
   fill(0, 199, 195); //set fill color for box 1
   rect(xPos, yPos, w, h); //set postition and size for box 1
   fill(41, 71, 102); //set fill color for box 2
   rect(xPos, yPos+h, h, w); //set position and size for box 2
   fill(206, 85, 51); //set fill color for box 3
   rect(xPos+h, yPos+h, h, w); //set position and size for box 3
   fill(168, 33, 23); //set fill color for box 4
   rect(xPos, yPos+w+h, w, h); //set position and size for box 4
}

//draw
void draw() {
   int w = 20; //setup local variable for width at 
   int h = w/2; //setup local variable for height at 1/2 width
   for(int cols = 0; cols < 24; cols++) { //start for loop with variable cols at 0, if less than 24, add 1
     for (int rows = 0; rows < 40; rows++) { //start for loop with variable rows at 0, if less than 40, add 1
       drawTile(20 * cols, 40 * rows, w, h); //call drawTile function with 20 times cols, 40 times rows, width and height
     }
   }
}


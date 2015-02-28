
// { imaginary global variable code block
//global variables

//declare its name and assign value
//int xPos = 0;  // data type | variable name = value
//int yPos = 0;

void setup () { //opening code block
size (450,450);
background(218,234,237);
smooth();
noFill();
strokeWeight (1);

} // closing code block for setup

  int diameter = 40;  

void draw(){
    // loop to create each column for the ellipses
  for (int x = 0; x < width+50; x+=30) {
    for (int y = 0; y < height+ 10 ; y+=30) {
     fill(255,140,0);
    strokeWeight(5);
    //drawTile(x,y,10,10);
    //quad(25,2,48,25,25,48,2,25);
    rect(x,y,20,20);
    }
 
  }
   // loop to create each column
  
  for (int cols = 0; cols < 60; cols++) {
    // nested loop to create rows for each column
    for (int rows = 0; rows < 60; rows++) {
      noFill();
      drawTile(40 * cols, 40 * rows, diameter);
    }
  }
}
 
void drawTile(int xPos, int yPos, int d) {
  strokeWeight(1);
  fill(24,201,234,10);
  ellipse(xPos + 2, yPos + 2, d, d);
  ellipse(xPos + 20, yPos + 2, d, d);
  ellipse(xPos + 2, yPos + 20, d, d);
  ellipse(xPos + 20, yPos + 20, d, d);
}


//quad(25,2,48,25,25,48,2,25);



Square[][] grid; //2D array of objects

//Number of columns and rows
int cols = 30;
int rows = 30;

//Setup Sketch
void setup() {
  size(250,250); 
  grid = new Square[cols][rows];
  for (int i = 0; i < cols; i++) { 
    for (int j = 0; j < rows; j++) {
      // Now we initialise each object!
      grid[i][j] = new Square(i*20,j*20,20,20,i+j);
    }
  }
}

// time to draw

void draw() {
 for (int i = 0; i < cols; i++) {    // This is for the boundaries
  for (int j = 0; j < rows; j++) {   // of the x and y axis.
   // Oscillate and display objects. This will allow our picture to move
  grid[i][j].oscillate();
 grid[i][j].display();
  }
 }
} 

//Next we need to create a class for each line

class Square {
  // As it's a class, each one will be placed plus will have equal dimensions
  float x,y; // the coordinates for the square
  float w,h; // the dimensions width and height
  float tilt; // the angle of the tilt at which the sketch will oscillate at!
  
  //Next we need to make the square constructor
  Square(float tempX, float tempY, float tempW, float tempH, float tempTilt) {
    x = tempX; // This allows us to put temperary values into the code
    y = tempY; // making them different each time the code is refreshed.
    w = tempW; // We then have to make them equal to the temp value so
    h = tempH; // each object will have the same characteristics.
    tilt = tempTilt;
  }
  
  // Tilt = increase tilt
  void oscillate() {
    tilt += 0.50; // Will need to be high due to the amount of
                  // lines that will be created.
  }
  
  // Display!!!
  void display() {
    stroke(255);
    // Colour Calculation time. With the use of using tan as well
    // as the posistion of the mouse, will allow for creative effects
    // to be made.
    fill(mouseX, 100+127*tan(tilt), mouseY);
    triangle(x,y,w,h,PI,PI); // Adding the PI distorts the image
                             // allowing for a "wall's of jericho" type effect.
  }
}

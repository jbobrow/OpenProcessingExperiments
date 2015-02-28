
// How many squares would you like? Keep it squared please, - 4, 9, 16...
int squareCount = 9;
// We divide the space to equally sized cuts to create a grid - one cut is a half of square side.
int cutCount = 2 + int(sqrt(squareCount)*2) + int(sqrt(squareCount)) - 1;
// We declare the size of one cut
int cutSize = round(600/cutCount);
int squaresDrawn = 0;

// Declare the object type - square
class Square {
  int x,y;
  boolean drawn;
  // Constructor of a Square object
  Square(int xPos, int yPos, boolean isDrawn) {
    x = xPos;
    y = yPos;
    drawn = isDrawn;
  }
}

// Create an array of our custom square objects
Square[][] squares = new Square[int(sqrt(squareCount))][int(sqrt(squareCount))];

void setup() {
  size(600,600);
  background(0,0,0);
  frameRate(60);
}

void draw() {
  // If the array is empty, fill it with square objects and set their x,y positions to form a grid
  if(squares[0][0] == null) { 
    for(int row = 0; row < squares.length; row++) {
     for(int col = 0; col < squares[row].length; col++) {
        squares[row][col] = new Square(cutSize + col * (cutSize + (2*cutSize)), cutSize + row * (cutSize + (2*cutSize)), false);
      }
    }
  }
  // While there still are somes not drawn
  if(squaresDrawn < squareCount) {
    // Target random square in the array
    int row = int(random(squares.length)),
        col = int(random(squares.length));
    // If it isn't drawn yet, generate random colour and draw it
    if(!squares[row][col].drawn) {
      fill(random(255),random(255),random(255));
      rect(squares[row][col].x, squares[row][col].y, cutSize * 2, cutSize * 2);
      squaresDrawn++;
      squares[row][col].drawn = true;
    }
  } else {
    squaresDrawn = 0;
    // Reset all square states to not drawn
    for(int row = 0; row < squares.length; row++) {
     for(int col = 0; col < squares[row].length; col++) {
      squares[row][col].drawn = false;
      }
    }
    // Clear the canvas
    fill(0,0,0,0.2);
    rect(0,0,width,height);
  }
}

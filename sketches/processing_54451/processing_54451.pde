
//Problem Set 1.5 by Nathan Smofsky
//8x8 checker board (using loops and conditionals)

size(400, 400);

int numSquares = 8;

// assumes a square sketch
// otherwise we also need to calculate width and height
int squareSize = width / numSquares; 

for (int i=0; i < numSquares; i++) {
  for (int j=0; j < numSquares; j++) {
    // alternate between black and white squares 
    if ( (i+j) % 2 == 1) {
      fill(0);
    }
    else {
      fill(255);
    }

    // draw each square 
    rect(i*squareSize, j*squareSize, squareSize, squareSize);
  }
}




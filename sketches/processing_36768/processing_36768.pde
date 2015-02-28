
size(500, 500);
background(0, 0, 0);

float randomNumber = random(0, 500);
int x = (int) randomNumber;
float randomNumber2 = random(0, 500);
int y = (int) randomNumber2;
int stuff = 100;

// The positions of the shapes are all based on the first shape, 
//which is given a random position on the screen. The sizes vary
// randomly, depending on the finalSquareSize, which is the size 
//of the first square and the maximum size of the rest of the squares.
int finalSquareSize = 20;
int squareSize = finalSquareSize;

rect(x, y, squareSize, squareSize);

int counter = 1;

for (int i = 1; i < stuff; i++) {
  if (counter == 1) {
    float floatX = (float)x;
    floatX = (width - floatX) /2;
    x = (int)floatX;
    
    squareSize = (int)random(1, finalSquareSize);
    rect(x, y, squareSize, squareSize);  
    counter = 2;
  }
  else {
    float floatY = (float)y;
    floatY = (height - floatY) / 2;
    y = (int)floatY;
    
    squareSize = (int)random(1, finalSquareSize);
    rect(x, y, squareSize, squareSize);
    counter = 1;
  }
}
                

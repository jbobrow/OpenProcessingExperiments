
//unravel the code, wdka.nl

//8 x 8 pattern, replacing and rotating with a function

int  posX = 1;
int  posY = 1;
int  turning = 0;

int[][] pixelArray= {
  {
    1, 1, 1, 1, 0, 0, 0, 0,
  } 
  , 
  {
    1, 1, 0, 0, 0, 0, 0, 0,
  } 
  , 
  {
    1, 0, 1, 0, 0, 0, 0, 0,
  } 
  , 
  {
    1, 0, 0, 1, 0, 0, 0, 0,
  } 
  , 
  {
    0, 0, 0, 0, 1, 0, 0, 0,
  } 
  , 
  {
    0, 0, 0, 0, 0, 1, 0, 0,
  } 
  , 
  {
    0, 0, 0, 0, 0, 0, 1, 0,
  } 
  , 
  {
    0, 0, 0, 0, 0, 0, 0, 1,
  } 
  ,
}; 

void setup() {
  size(400, 400);

  //test
  for (int y = 0; y <8; y++) {
    for (int x = 0; x <  8; x++) {
      print ( pixelArray[x][y] );
    }
    println();
  }

  strokeWeight(0);
  stroke(255);
}

void draw() {
  posX = 1;
  posY = 1;
  turning = 0;
  drawPAttern(  posX, posY, turning);
  posX = 2;
  posY = 1;
  turning = 2;
  drawPAttern(  posX, posY, turning);
  
  drawPAttern(  3, 3, 0);
  drawPAttern(  3, 4, 1);
}

void drawPAttern(int posX, int posY, int turning) {

  for (int y = 0; y <8; y++) {
    for (int x = 0; x <  8; x++) {
      int myPixel = 0;
      if ( turning == 0 ) myPixel = pixelArray[x][y];
      if ( turning == 1 ) myPixel = pixelArray[x][7-y];
      if ( turning == 2 ) myPixel = pixelArray[7-x][7-y];
      if ( turning == 3 ) myPixel = pixelArray[7-x][y];
      if ( myPixel == 1 )
        fill(0);
      else
        fill(255);
      rect(x*10 + posX*80, y*10 + posY*80, 10, 10);
    }
  }
}


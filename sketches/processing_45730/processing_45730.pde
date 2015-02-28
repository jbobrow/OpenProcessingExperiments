
//////////// ///////////////////
// Game of Life    By ASH    //
///////////////////////////////
int sizeX = 100; // num of cells on x axis
int sizeY = 100; // num cells on y axis
int sizeCell = 7;
int[][] currentGen = new int[sizeX][sizeY];
boolean bool = true;

void setup() 
{
  size(500, 400);
  noStroke();
  frameRate(8); //controlls how fast the game is played

}  

void draw() {

  if (bool == true) {
  for (int i = 0; i < sizeX; i++) { 
    for (int j = 0; j < sizeY; j++) {
      if (currentGen[i][j] == 1) {
        fill(13,209,50); // living cell
      } else {
        fill(25); // dead cell
      }
      rect(i*sizeCell, j*sizeCell, sizeCell, sizeCell);
    }
  }
  }
  da_game666(); 
}

// function calculates the next set of values
// draw function draws values for the next generation
void da_game666() {
  int[][] nextGen = new int[sizeX][sizeY];
  for (int i = 0; i < sizeX; i++) {
    for (int j = 0; j < sizeY; j++) {
      int neighborCount = neighbors(i,j);
      if ((neighborCount == 3) && (currentGen[i][j] == 0)) {
        nextGen[i][j] = 1;
      } else if ((neighborCount < 2 || neighborCount > 3) && currentGen[i][j] == 1) {
        nextGen[i][j] = 0;
      } else {
        nextGen[i][j] = currentGen[i][j];
      }
    }
  }
  for (int i = 0; i < sizeX; i++) {
    for (int j = 0; j < sizeY; j++) {
      currentGen[i][j] = nextGen[i][j];
    }
  }       
}
int neighbors(int i, int j) 
{  // the rules
  int nb = 0;
  if (currentGen[(i+sizeX-1) % sizeX ][(j+sizeY-1) % sizeY ] == 1) { nb++; }
  if (currentGen[ i                  ][(j+sizeY-1) % sizeY ] == 1) { nb++; }
  if (currentGen[(i+1)       % sizeX ][(j+sizeY-1) % sizeY ] == 1) { nb++; }
  
  if (currentGen[(i+sizeX-1) % sizeX ][ j                  ] == 1) { nb++; }
  if (currentGen[(i+1)       % sizeX ][ j                  ] == 1) { nb++; }
  
  if (currentGen[(i+sizeX-1) % sizeX ][(j+1)       % sizeY ] == 1) { nb++; }
  if (currentGen[ i                  ][(j+1)       % sizeY ] == 1) { nb++; }
  if (currentGen[(i+1)       % sizeX ][(j+1)       % sizeY ] == 1) { nb++; }
  return nb;
} 

void initialize() 
{
  for (int i = 0; i < sizeX; i++) { 
    for (int k = 0; k < sizeY; k++) {
      if ((int)random(2)%2 == 0) {
        currentGen[i][k] = 1;
      }
    }
  }
}

void keyPressed()
{
  if(key == 'c' || key == 'C') // c clears the screen
  {
    for (int i = 0; i < sizeX; i++) { 
      for (int k = 0; k < sizeY; k++) {
        currentGen[i][k] = 0;
      }
    }
  } 
  if(key == ' ')  // space bar creates a random sequence
  {
    bool = true;
    initialize(); 
  } 
}
 


                
                                                                                                                                                                                                                                                                                                                

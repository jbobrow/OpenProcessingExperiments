
int cols = 50;
int rows = 50;
int videoScale = 10;

// Declare 2D array
Life[][] myArray = new Life[cols][rows];

boolean start = true;

void setup() {
  size(500, 500);
  background(0);
  frameRate(15);
}


void draw() {
  if (keyPressed == true && (key == 'r' || key == 'R')) {
    start = true;
  }

  if (start == true) {
    start = false;
    // create random board
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        boolean status = randBool();
        myArray[i][j] = new Life(i, j, status, false);
      }
    }

    // Draw points
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        drawLife(i, j, myArray[i][j].living);
      }
    }
  }

  int neighbors;
  // simulating life
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      neighbors = countNeighbor(i, j);
      if (myArray[i][j].living == false && neighbors == 3) {
        myArray[i][j].next = true;
      }

      if (myArray[i][j].living == true && (neighbors == 1 || neighbors > 3)) {
        myArray[i][j].next = false;
      }
    }
  }
  //make the new values
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (myArray[i][j].next == true) {
        myArray[i][j].living = true;
      }
      if (myArray[i][j].next == false) {
        myArray[i][j].living = false;
      }
      drawLife(i, j, myArray[i][j].living);
    }
  }
}




class Life {
  int positionX;
  int positionY;
  boolean living;
  boolean next;
  Life (int posX, int posY, boolean alive, boolean nextLife) {
    positionX = posX;
    positionY = posY;
    living = alive;
    next = nextLife;
  }
}

boolean randBool() {
  int swag = (int)random(9);
  if (swag == 0) {
    return true;
  } 
  else {
    return false;
  }
}

void drawLife (int posX, int posY, boolean life) {
  int x = posX*videoScale;
  int y = posY*videoScale;

  if (life) {
    fill(255);
  } 
  else {
    fill(0);
  }
  stroke(27, 155, 70);
  rect(x, y, videoScale, videoScale);
}

int countNeighbor(int posX, int posY) {
  int neighbor = 0;
  for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <= 1; y++) {
      if (y == 0 && x == 0) {
        continue;
      }
      if ((posX + x >= 0 && posX + x < cols) && (posY + y >= 0 && posY + y < rows) && (myArray[posX+ x][posY + y].living == true)) {
        neighbor++;
      }
    }
  }
  return neighbor;
}




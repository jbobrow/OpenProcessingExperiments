
/*
 Modificación del Tutorial de Processing
 By Joan Soler-Adillon
 www.joan.cat
 @jsoleradillon
 
 Adaptat a partir d'un exemple d'Eloi Roma
 */

// Size of cells
int HrCellSize = 25;
int MinCellSize = 10;
int SecCellSize = 10;

int secCounter = 0;
int minCounter = 0;
int hrCounter = 0;

//array of cells
int[][] greenColors;
int[][] redColors;
int[][] blueColors;
//limit of greeb below
int minimColor = 100;

void setup() {
  size (600, 600);
  redColors = new int[width/SecCellSize][61];
  //initialization of cells
  for (int x=0; x<width/SecCellSize; x++) {
    for (int y=0; y<=60; y++) {
      int red = int(random (minimColor, 255));
      //int green = int(random (minimColor, 255));
      redColors[x][y] = red;
    }
  }
  blueColors = new int[width/MinCellSize][61];
  //initialization of cells
  for (int x=0; x<(2*width/3)/MinCellSize; x++) {
    for (int y=0; y<=60; y++) {
      int blue = int(random (minimColor, 255));
      //int green = int(random (minimColor, 255));
      blueColors[x][y] = blue;
    }
  }
  greenColors = new int[width/HrCellSize][25];
  //initialization of cells
  for (int x=0; x<(width/3)/HrCellSize; x++) {
    for (int y=0; y<=24; y++) {
      //int green = minimColor;
      int green = int(random (minimColor, 255));
      greenColors[x][y] = green;
    }
  }
}


void draw() {
  int secCounter = second();
  int minCounter = minute();
  int hrCounter = hour();

  //Draw grid
  for (int x=0; x<width/SecCellSize; x++) {
    for (int y=0; y<=60; y++) {
      fill(redColors[x][y]+minimColor, 0, 0);
      rect (x*SecCellSize, y*SecCellSize, SecCellSize, SecCellSize);
    }
  }
  //Draw grid
  for (int x=0; x<(2*width/3)/MinCellSize; x++) {
    for (int y=0; y<=60; y++) {
      fill(0, 0, blueColors[x][y]+minimColor);
      rect (x*MinCellSize, y*MinCellSize, MinCellSize, MinCellSize);
    }
  }
  //Draw grid
  for (int x=0; x<(width/3)/HrCellSize; x++) {
    for (int y=0; y<=24; y++) {
      fill(0, greenColors[x][y]+minimColor, 0);
      rect (x*HrCellSize, y*HrCellSize, HrCellSize, HrCellSize);
    }
  }

  //iterate
  for (int x=0; x<width/SecCellSize; x++) {
    for (int y=0; y<=secCounter; y++) {
      int red = int(random (minimColor, 255)%(255-minimColor));
      //int green = int(random (minimColor, 255));
      redColors[x][y] = red;
     // redColors[x][y] = (redColors[x][y] + 1 ) %(255-minimColor);
       if (secCounter==59){
        redColors[x][y] = 0;
      }
    }
  }
  //iterate
  for (int x=0; x<(2*width/3)/MinCellSize; x++) {
    for (int y=0; y<=minCounter; y++) {
      int blue = int(random (minimColor, 255)%(255-minimColor));
      //int green = int(random (minimColor, 255));
      blueColors[x][y] = blue;
      // redColors[x][y] = (redColors[x][y] + 1 ) %(255-minimColor);
      if (minCounter==59) {
        blueColors[x][y] = 0;
      }
    }
  }
  //iterate
  for (int x=0; x<(width/3)/HrCellSize; x++) {
    for (int y=0; y<hrCounter; y++) {
      int green = int(random (minimColor, 255)%(255-minimColor));
      //int green = int(random (minimColor, 255));
      greenColors[x][y] = green;
      // redColors[x][y] = (redColors[x][y] + 1 ) %(255-minimColor);
      if (hrCounter==24) {
        greenColors[x][y] = 0;
      }
    }
  }


  //counter = second();
  println(second());
  //greenColors[counter][counter] = 0;
}

void mousePressed() {
  minimColor = int(map(mouseX, 0, width, 0, 255));
  //re-initialization of cells
  for (int x=0; x<width/MinCellSize; x++) {
    for (int y=0; y<height/MinCellSize; y++) {
      int green = int(random (minimColor, 255));
      greenColors[x][y] = green;
    }
  }
}




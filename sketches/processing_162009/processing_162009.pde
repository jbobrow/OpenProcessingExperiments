
int gridSizeX = 90;
int gridSizeY = 55;

int numberOfRows;
int numberOfColumns;

void setup () {
  size(1000, 400); 
  background(0); 
  noStroke();
  rectMode(CENTER);
}

void draw () {
  background (0);

  //draw the word time
  line (gridSizeX-1, gridSizeY-1, gridSizeX*3-1, gridSizeY-1);
  line (gridSizeX*2-1, gridSizeY-1, gridSizeX*2-1, gridSizeY*6-1);
  line (gridSizeX*4-1, gridSizeY-1, gridSizeX*4-1, gridSizeY*6-1);
  line (gridSizeX*5-1, gridSizeY-1, gridSizeX*5-1, gridSizeY*6-1);
  line (gridSizeX*7-1, gridSizeY-1, gridSizeX*7-1, gridSizeY*6-1);
  line (gridSizeX*8-1, gridSizeY-1, gridSizeX*8-1, gridSizeY*6-1);
  line (gridSizeX*5-1, gridSizeY-1, gridSizeX*6-1, gridSizeY*3-1);
  line (gridSizeX*7-1, gridSizeY-1, gridSizeX*6-1, gridSizeY*3-1);
  line (gridSizeX*8-1, gridSizeY-1, gridSizeX*10-1, gridSizeY-1);
  line (gridSizeX*8-1, gridSizeY*3-1, gridSizeX*10-1, gridSizeY*3-1);
  line (gridSizeX*8-1, gridSizeY*6-1, gridSizeX*10-1, gridSizeY*6-1);

  if (second() < 10) {
    numberOfRows = 1;
  }

  //  int min = 20;
  //  int max = 30;
  //
  //for (int k = 2; k < 7; k++) {
  //if (second() < k*10 && second() >   
  //  
  //}


  if (second() <= 20 && second() > 10) {
    numberOfRows = 2;
  }
  if (second() <= 30 && second() > 20) {
    numberOfRows = 3;
  }
  if (second() <= 40 && second() > 30) {
    numberOfRows = 4;
  }
  if (second() <= 50 && second() > 40) {
    numberOfRows = 5;
  }
  if (second() <= 60 && second() > 50) {
    numberOfRows = 6;
  }

  if (second() != 0) {
    numberOfColumns = 10 + (second()-numberOfRows*10);
  } else {
    numberOfColumns = 10;
    numberOfRows = 0;
  }

  //draw gray grid of squares representing entire minute
  for (int x = gridSizeX; x <= width - gridSizeX; x += gridSizeX) {
    for (int y = gridSizeY; y <= height - gridSizeY; y += gridSizeY) {
      noStroke();
      fill(100);
      rect(x-1, y-1, 3, 3);
      stroke(255, 50);
    }
  }

  //draw a new row with new columns each second
  for (int x = gridSizeX; x <= gridSizeX*numberOfColumns; x += gridSizeX) {
    for (int y = gridSizeY; y <= gridSizeY*numberOfRows; y += gridSizeY) {
      noStroke();
      fill(255);
      rect(x-1, y-1, 5, 5);
      stroke(255, 50);
    }
  }

  //draw rows of white squares where time has already passed
  for (int j = 0; j < 7; j++) {
    if (numberOfRows == j) {
      for (int x = gridSizeX; x <= gridSizeX*10; x += gridSizeX) {
        for (int y = gridSizeY; y <= gridSizeY* (j-1); y += gridSizeY) {
          noStroke();
          fill(255);
          rect(x-1, y-1, 5, 5);
          stroke(255, 50);
        }
      }
    }
  }

  //  println("number of columns: " + numberOfColumns);
  println(second());
}




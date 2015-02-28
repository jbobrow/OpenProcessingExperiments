
// Conway's game of life glider
// by Alasdair Turner

boolean [][] cells;
boolean [][] nextcells;

void setup()
{
  size(400,400);
  cells = new boolean [100][100];
  nextcells = new boolean [100][100];
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      cells[i][j] = false;
    }
  }  
  // glider setup
  cells[50][50] = true;
  cells[49][50] = true;
  cells[51][50] = true;
  cells[51][49] = true;
  cells[50][48] = true;
  frameRate(6);
}

void draw()
{
  background(192); 
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      if (cells[i][j] == true) {
        rect(i*4,j*4,4,4);
      }
      // count up how many alive around us
      int number = 0;
      for (int m = -1; m <= 1; m++) {
        for (int n = -1; n <= 1; n++) {
          if (!(m == 0 && n == 0)) {
            if (cells[(i+m+100)%100][(j+n+100)%100] == true) {
              number++;
            }
          } 
        }
      }
      // counted up... now set state of cell for next generation
      if (number < 2 || number > 3) {
        nextcells[i][j] = false;
      }
      else if (number == 3) {
        nextcells[i][j] = true;
      }
      else {
        nextcells[i][j] = cells[i][j];
      }
    }
  }    
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      cells[i][j] = nextcells[i][j];
    }
  }
}



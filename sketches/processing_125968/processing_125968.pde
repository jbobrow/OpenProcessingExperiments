
//Conway's Game of Life

int cellSize = 10;

int matrixW = 700/cellSize; // width of matrix
int matrixL = 700/cellSize; // length of matrix

int[][] matrix1 = new int[matrixW][matrixL];

int[][] matrix2 = new int[matrixW][matrixL];

int dim=2;



void setup() {
  size(700, 700);
  /*for(int x = 0; x < matrixW; x ++) {
   for(int y = 0; y < matrixL; y ++) {
   matrix1[x][y] = floor(random(0, 2));
   }
   }*/
}

void draw() {
  background(0);

  PFont font = loadFont("Times-Roman-48.vlw");
  textFont(font);
  textSize(15);
  fill(255);
  text(dim + "x" + dim, 30, 40);

  //Rules of Life:



  for (int x = 0; x < matrixW; x ++) {
    for (int y = 0; y < matrixL; y ++) {
      int n = countNeighbours1(x, y);

      if ((n == 3 || n == 2) && matrix1[x][y] == 1) {
        matrix2[x][y] = 1;
      }
      if ((n<2 || n>3) && matrix1[x][y] == 1) {
        matrix2[x][y] = 0;
      }
      if (n==3 && matrix1[x][y] == 0) {
        matrix2[x][y] = 1;
      }
      if ((n>3 || n<3) && matrix1[x][y] == 0) {
        matrix2[x][y] = 0;
      }

      //We are only displaying data from one matrix; matrix2 is only used for
      //copying data from matrix1 (this would not work with only 
      //one matrix because each cell needs to work independently
      //of the others).
    }
  }

  for (int x = 0; x < matrixW; x++) {
    for (int y = 0; y < matrixL; y++) {
      if (matrix2[x][y] == 1) {
        matrix1[x][y] = 1;
      }
      if (matrix2[x][y] == 0) {
        matrix1[x][y] = 0;
      }
      updateMatrix1(x, y);
    }
  }

  if (keyPressed) {
    if (key==CODED) {
     
        if (keyCode==RIGHT) {
          dim+=1;
        }
        if (keyCode==LEFT) {
          dim-=1;
        }
        if (keyCode==UP) {
          clearMatrix();
        }
      }
    
  }
}

void updateMatrix1(int x, int y) {
  if (matrix1[x][y] == 1) {
    fill(0, 255, 0, 100);
    stroke(0, 0, 100);
    strokeWeight(2);
    strokeCap(ROUND);
    rect(x*cellSize, y*cellSize, cellSize, cellSize);
  }
}

int countNeighbours1(int x, int y) {
  return matrix1[(x+1)%matrixW][y]
    + matrix1[(x+1)%matrixW][(y+1)%matrixL]
    + matrix1[x][(y+1)%matrixL]
    + matrix1[(x+matrixW-1)%matrixW][(y+1)%matrixL]
    + matrix1[(x+matrixW-1)%matrixW][y]
    + matrix1[(x+matrixW-1)%matrixW][(y+matrixL-1)%matrixL]
    + matrix1[x][(y+matrixL-1)%matrixL]
    + matrix1[(x+1)%matrixW][(y+matrixL-1)%matrixL] ;
}

void initializeMatrix(int x, int y) {
  /*for(int x = 0; x < matrixW; x += 1) {
   for(int y = 0; y < matrixL; y += 1) {
   matrix1[x][y] = floor(random(0, 2));
   }
   }
   */
  if (x>=2 && y>=2) { 
    for (int i = 0; i < dim; i+=1) {
      for (int j = 0; j<dim; j+=1) {
        matrix1[(x+i)%matrixW][(y+j)%matrixL] = 1;
      }
    }
  }
}

void clearMatrix() {
  for (int x = 0; x < matrixW; x += 1) {
    for (int y = 0; y < matrixL; y += 1) {
      matrix1[x][y] = 0;
    }
  }
}

void mousePressed() {
  initializeMatrix(ceil(mouseX/10), ceil(mouseY/10));
}




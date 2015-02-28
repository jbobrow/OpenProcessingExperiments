
//openprocessing made me do it. 

//DECLARE

int col;
int row;
color [][] colors;

void setup() {
  size(600, 600);
  smooth();
 

  //INITIALISE

  col = 10;
  row = 10;
  colors = new color[col][row];


  for (int i = 1; i < row; i++) {
    for (int j = 1; j < col; j++) {
      colors[i][j] = color((25*i), ((i+j)), (25*j));
    }
  }
}

//DRAW LOOP

void draw() {
   background(0);
  for (int i = 1; i < row; i++) {
    for (int j = 1; j < col; j++) {
     fill(colors[i][j]);
      rect(i*(width/col), j*(height/row), 30, 30);
    }
  }
}



//FUNCTIONS

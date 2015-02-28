
//Tsang Hiu Fong, Annie// 52957053// Assignment 2

int columns, rows, interval = 20;
int[][] rectlength; // Declare 2D array

void setup() {
  size(400, 400);
  columns = int(width/interval);
  rows = int(height/interval);
  rectlength = new int[columns][rows]; // Create
  // Initialize values of 2D array rectlength 
  for (int i = 0; i < columns; i ++ ) {
    for (int j = 0; j < rows; j ++ ) {
      rectlength[i][j] = int(random(10,40));//set the size of the rect
    }
  }
  noStroke();
  smooth();
  frameRate(10);
}

void draw() {
  background(0);//set black as bkg
  // referring to nested for() loops
  for (int i = 0; i < columns; i ++ ) {
    for (int j = 0; j < rows; j ++ ) {
      if(mouseX<200 && mouseY<200){
      fill(random(255), random(0), random(0), random(255));//Draw red rect
      rect(i*interval,j*interval,rectlength[i][j],rectlength[i][j]);
      } else if(mouseX>200 && mouseY<200){
        fill(random(0), random(255), random(0), random(255));//Draw green rect
        rect(i*interval,j*interval,rectlength[i][j],rectlength[i][j]);
      } else if(mouseX>200 && mouseY>200){
      fill(random(0), random(0), random(255), random(255));//Draw blue rect
      rect(i*interval,j*interval,rectlength[i][j],rectlength[i][j]);
      } else if(mouseX<200 && mouseY>200){
        fill(random(100));//Draw grey rect
        rect(i*interval,j*interval,rectlength[i][j],rectlength[i][j]);
      }
    }
  }
}

//refernce to wk3_2D_array_example_02

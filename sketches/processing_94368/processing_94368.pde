
int squareSize = 20;
int horizontalSquares;
int verticalSquares;
int squarePadding = 1;
color [][] colorMatrix;

//Global Variables


//Configurations
void setup(){
  size(600, 600);
  sketchFullScreen();
  noCursor();
  smooth();
  horizontalSquares = width/(squareSize+squarePadding) + 1;
  verticalSquares = height/(squareSize+squarePadding) + 1;
  colorMatrix = new color[verticalSquares][horizontalSquares];
}

//Drawing Loop
void draw(){
  background(255);
  fillWithSquares();
  updateSquares();
}

//Fullscreen Variable
boolean sketchFullScreen() {
  return true;
}

//Screen Capturer
void keyPressed() {
  if (keyCode == ENTER) {
    saveFrame("screen-####.jpg");
  }
}

void drawSquare(float _xpos, float _ypos){
  stroke(30, 128, 120);
  rectMode(CENTER);
  rect(_xpos, _ypos, squareSize, squareSize); 
}

void fillWithSquares(){
  for(int j = 0; j < verticalSquares; j++){
    for(int i = 0; i < horizontalSquares; i++){
      fill(colorMatrix[j][i]);
      drawSquare(i*(squareSize+squarePadding)+squareSize/2, j*(squareSize+squarePadding)+squareSize/2);
    }
  }  
}

void updateSquares(){
  for(int j = 0; j < colorMatrix.length; j++){
    for(int i = 0; i < colorMatrix[0].length; i++){
      colorMatrix[j][i] = color(random(128, 190));
    }
  }
}

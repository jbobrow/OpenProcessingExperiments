
boolean[][] state;
int[] antLoc;
int antDirection;

int squareSize = 5;
int columns, rows;

color bgCol = color(0,128,128);
color antCol = color (255,0,0);
color sqCol = color(128,128,128);

void setup(){
  size(800,600);
  background(bgCol);
  columns = width/squareSize;
  rows = height/squareSize;

  state = new boolean[rows][columns];
  for(int j = 0; j < rows; j++){
    for(int i = 0; i < columns; i++){
      state[j][i] = false;
    }
  }
  antLoc = new int[]{rows/2,columns/2};
  antDirection = 1;
}

void drawScene(){
  fill(sqCol);
  for(int j = 0; j < rows; j++){
    for(int i = 0; i < columns; i++){
      if(state[j][i]){
        rect(i*squareSize,j*squareSize,squareSize,squareSize);
      }
    }
  }
  fill(antCol);
  rect(antLoc[1]*squareSize,antLoc[0]*squareSize,squareSize,squareSize);
}

void turnLeft(){
  if (antDirection > 1){
    antDirection--;
  } else{
    antDirection = 4;
  }
}

void turnRight(){
  if (antDirection < 4){
    antDirection++;
  } else {
    antDirection = 1;
  }
}

void moveForward(){
  if (antDirection == 1){
    antLoc[0]--;
  }
  if (antDirection == 2){
    antLoc[1]++;
  }
  if (antDirection == 3){
    antLoc[0]++;
  }
  if (antDirection == 4){
    antLoc[1]--;
  }
}

void updateScene(){
  moveForward();
  if (state[antLoc[0]][antLoc[1]] == false){
    state[antLoc[0]][antLoc[1]] = true;
    turnRight();
  } else {
    state[antLoc[0]][antLoc[1]] = false;
    turnLeft();
  }
}

void draw(){
  background(bgCol);
  drawScene();
  for(int i = 0; i < 10; i++){
      updateScene();
  }

}


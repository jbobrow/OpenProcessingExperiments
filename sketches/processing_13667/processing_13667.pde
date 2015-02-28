


boolean scene[][];
boolean nextScene[][];
int squareSize = 5;
int columns = 800;
int rows = 600;
int fps = 1;
int nCount = 0;

//Fonts
PFont myFont = createFont("Free Sans", 10);

void setup(){
  textFont(myFont);
  frameRate(1);
  size(columns,rows);
  columns = width/squareSize;
  rows = height/squareSize;
  scene = new boolean[rows][columns];
  nextScene = new boolean[rows][columns];
  for (int j = 0; j < rows; j++){
    for (int i = 0; i < columns; i++){
      scene[j][i] = false;
    }
  }
  /*
  scene[rows/2][columns/2] = true;
  scene[(rows/2)+1][columns/2] = true;
  scene[(rows/2)-1][columns/2] = true;
  scene[rows/2][(columns/2)+1] = true;
  scene[rows/2][(columns/2)-1] = true;
  */
  
  /*
  scene[10][10] = true;
  scene[9][10] = true;
  scene[8][9] = true;
  scene[10][9] = true;
  scene[10][8] = true;
  */
  
  /*
  scene[10][10] = true;
  scene[11][10] = true;
  scene[11][11] = true;  
  scene[10][11] = true;  


  scene[20][20] = true;
  scene[21][20] = true;
  scene[21][21] = true;
  */
  /*
  scene[30][40] = true;
  scene[31][40] = true;
  scene[29][40] = true;
  scene[30][39] = true;
  scene[29][41] = true;
  */
  
  scene[(rows/2)][(columns/2)] = true;
  scene[(rows/2)-1][(columns/2)] = true;
  scene[(rows/2)][(columns/2)-1] = true;
  scene[(rows/2)+1][(columns/2)] = true;
  scene[(rows/2)-1][(columns/2)+1] = true;
  
  
  /*
  o(10,50);
  c(0,0);
  c(10,0);
  */
  
  background(0,128,128);
  showScene();
  updateScene();
  
}

void showScene(){
  for (int j = 0; j < rows; j++){
    for (int i = 0; i < columns; i++){
      if (scene[j][i] == true){
        //fill(255);
        fill(127,map(j,0,rows-1,0,255),map(i,0,columns-1,0,255));
        rect(i*squareSize,j*squareSize,squareSize,squareSize);
      }
    }
  }
}

void updateScene(){
  for (int j = 0; j < rows; j++){
    for (int i = 0; i < columns; i++){
      nCount = neighbourCount(j,i);
      if (nCount < 2 || nCount > 3){// 0, 1, 4, 5, 6, 7, 8
        nextScene[j][i] = false;
      } else {
        if (nCount == 3){// 3
          nextScene[j][i] = true;
        } else {// 2
          nextScene[j][i] = scene[j][i];
        }
      }
    }
  }
  for (int j = 0; j < rows; j++){
    for (int i = 0; i < columns; i++){
      scene[j][i] = nextScene[j][i];
    }
  }
}

int neighbourCount(int y, int x){
  int result = 0;
  if(x < columns-1){//right
    if(isLive(y,x+1)){
      result++;
    }
  } else {//rightmost
    if(isLive(y,0)){
      result++;
    }
  }
  if(x > 0){//left
    if(isLive(y,x-1)){
      result++;
    }
  } else {//leftmost
    if(isLive(y,columns-1)){
      result++;
    }
  }
  if(y < rows-1){//down
    if(isLive(y+1,x)){
      result++;
    }
  } else {//lowermost
    if(isLive(0,x)){
      result++;
    }
  }
  if(y > 0){//up
    if(isLive(y-1,x)){
      result++;
    }
  } else {//uppermost
    if(isLive(rows-1,x)){
      result++;
    }
  }
  
  if(y > 0 && x > 0){
    if(isLive(y-1,x-1)) {//top left
      result++;
    }
  } else { //we're in either the top or leftmost row
    if(y == 0){// we're in the top row
      if(x == 0){//we're the top left pixel
        if(isLive(rows-1,columns-1)){
          result++;
        }
      } else { //we're elsewhere in the top row
        if(isLive(rows-1,x-1)){
          result++;
        }
      }
    }else{//we're not in the top row
      if(isLive(y-1,columns-1)){
        result++;
      }
    }
  }
  
  if(y > 0 && x < columns-1){
    if(isLive(y-1,x+1)) {//top right
      result++;
    }
  } else { //we're in either the top or rightmost row
    if(y == 0){// we're in the top row
      if(x == columns-1){//we're the top right pixel
        if(isLive(rows-1,0)){
          result++;
        }
      } else { //we're elsewhere in the top row
        if(isLive(rows-1,x+1)){
          result++;
        }
      }
    }else{//we're not in the top row
      if(isLive(y-1,0)){
        result++;
      }
    }
  }
  
  if(y < rows-1 && x > 0){
    if(isLive(y+1,x-1)) {//bottom left
      result++;
    }
  } else { //we're in either the bottom or leftmost row
    if(y == rows-1){// we're in the bottom row
      if(x == 0){//we're the bottom left pixel
        if(isLive(0,columns-1)){
          result++;
        }
      } else { //we're elsewhere in the bottom row
        if(isLive(0,x-1)){
          result++;
        }
      }
    }else{//we're not in the bottom row
      if(isLive(y+1,columns-1)){
        result++;
      }
    }
  }
  
  if(y < rows-1 && x < columns-1){
    if(isLive(y+1,x+1)) {//bottom right
      result++;
    } 
  } else { //we're in either the bottom or rightmost row
    if(y == rows-1){// we're in the bottom row
      if(x == columns-1){//we're the bottom right pixel
        if(isLive(0,0)){
          result++;
        }
      } else { //we're elsewhere in the bottom row
        if(isLive(0,x+1)){
          result++;
        }
      }
    }else{//we're not in the bottom row
      if(isLive(y+1,0)){
        result++;
      }
    }
  }
  /*
  if(y > 0 && x < columns-1 && isLive(y-1,x+1)){//top right
    result++;
  }
  if(y < rows-1 && x > 0 && isLive(y+1,x-1)){//bottom left
    result++;
  }
  if(y < rows-1 && x < columns-1 && isLive(y+1,x+1)){//bottom right
    result++;
  }*/
  return result;
}

boolean isLive(int y, int x){
  if(scene[y][x] == true){
    return true;
  } else {
    return false;
  }
}

void o(int y, int x){
  scene[y][x] = true;
}

void c(int y, int x){
  scene[(rows/2)+y][(columns/2)+x] = true;
}

void mousePressed(){
  if(fps < 50){
    fps += 5;
    frameRate(fps);
  } else {
    fps = 1;
    frameRate(fps);
  }
  /*
  if(fps == 5){
    frameRate(10);
    fps = 10;
  }
  if (fps == 10){
    frameRate(1);
    fps = 1;
  }
  if (fps == 1){
    frameRate(5);
    fps = 5;
  }
  */
}

void draw(){
  background(0,128,128);
  text("fps: "+fps+", frameRate: "+frameRate,10,10);
  showScene();
  updateScene();
}


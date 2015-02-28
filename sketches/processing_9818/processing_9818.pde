
/*
in class assignment
celluar practice

refered from:
Fractals and Cellular Automata
http://www.shiffman.net/teaching/nature/week7/

author:Ricky Lai
*/

int worldX = 200;
int worldY = 100;
int[][] data = new int[worldX][worldY];

void setup(){
  size(600,300);
  //noStroke();
  for(int i = 0; i < worldX; i++){
    for(int j = 0; j< worldY; j++){
      data[i][j] = int(random(300))%2;
    }
  }
  frameRate(10);
}

void draw(){
  rule();
  for(int i = 0; i < worldX; i++){
    for(int j = 0; j < worldY; j++){
      int eachSizeX = width / worldX;
      int eachSizeY = height / worldY;
      int x = i*eachSizeX;
      int y = j*eachSizeY;
      if(data[i][j] == 1){
        fill(255,255,0);
        rect(x,y,eachSizeX,eachSizeY); 
      }
      else{
        fill(0);
        rect(x,y,eachSizeX,eachSizeY); 
      }
    }
  } 
}

void rule() {
  int[][] temp = new int[worldX][worldY];
  for(int i = 0; i < worldX; i++){ 
    for(int j = 0; j < worldY; j++){
      int result = neighbors(i,j);
      if(data[i][j] == 1 && result < 2){
        temp[i][j] = 0;
      }
      else if(data[i][j] == 1 && result > 3){
        temp[i][j] = 0;
      }
      else if(data[i][j] == 0 && result == 3){
        temp[i][j] = 1;
      }
      else{
        temp[i][j] = data[i][j];
      }

    }
  }
  for(int i = 0; i < worldX; i++){
    for(int j = 0; j < worldY; j++){
      data[i][j] = temp[i][j];
    }
  } 
}

int neighbors(int i, int j) {
  int result = 0;

  if(i > 0 && j > 0 && data[i-1][j-1] == 1){
    result = result + 1; 
  }
  if(j > 0 && data[i][j-1] == 1){
    result = result + 1; 
  }
  if(i < worldX - 1 && j > 0 && data[i+1][j-1] == 1){
    result = result + 1; 
  }
  if(i > 0 && data[i-1][j] == 1){
    result = result + 1; 
  }
  if(i < worldX -1 && data[i+1][j] == 1){
    result = result + 1; 
  }
  if(i > 0 && j < worldY -1 && data[i-1][j+1] == 1){
    result = result + 1; 
  }
  if(i < worldX -1 && j < worldY -1 && data[i+1][j+1] == 1){
    result = result + 1; 
  }
  if(j < worldY -1 && data[i][j+1] == 1){
    result = result + 1; 
  }
  return result;

}





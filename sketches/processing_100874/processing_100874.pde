
int w = 40;
int h = 40;
int[][] world = new int[w][h];
int[][] worldAge = new int[w][h];
int[][] worldBuffer = new int[w][h];
void setup() {
  size(400, 400);
  frameRate(30);
  for(int i = 0; i < w; i ++){
    for(int j = 0; j < h; j++){
      if(Math.random()*100 < 25){
        world[i][j] = 1;
        worldBuffer[i][j] = 1;
        worldAge[i][j] = 1;
      }
    }
  }
}
void draw(){
  background(0);
  calcWorldStatus();
  for(int i = 0; i < w; i++){
    for(int j = 0; j < h; j++){
      if(world[i][j]==1) {
        fill(worldAge[i][j] * 30, worldAge[i][j] * 20, worldAge[i][j]);
        rect(i*10,j*10,10,10);
      }
    }
  }
}
void calcWorldStatus(){
  for(int i = 0; i < w; i++){
    for(int j = 0; j < h; j++){
      int count = 0;
      try{
        count = countNeighbours(i,j);
      }catch(ArrayIndexOutOfBoundsException e){
      }
      if(world[i][j]== 0 && count == 3){
        if(count == 3) birth(i,j);
        else continue;
      }
      if(count < 2 || count > 3) kill(i,j);
      else worldAge[i][j]++;
    }
  }  
  arrayCopy(worldBuffer, world);
}
void birth(int i, int j){
  worldBuffer[i][j] = 1;
  worldAge[i][j]++;
}
void kill(int i, int j){
  worldBuffer[i][j] = 0;
  worldAge[i][j] = 0;
}
int countNeighbours(int i, int j) throws ArrayIndexOutOfBoundsException {
  int count = 0;
  if(world[i+1][j] == 1) count++;
  if(world[i-1][j] == 1) count++;
  if(world[i][j+1] == 1) count++;
  if(world[i][j-1] == 1) count++;
  if(world[i+1][j+1] == 1) count++;
  if(world[i+1][j-1] == 1) count++;
  if(world[i-1][j-1] == 1) count++;
  if(world[i-1][j+1] == 1) count++;
  return count;
}
void mousePressed(){
  setup();
}

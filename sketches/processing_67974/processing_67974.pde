

int mapSize = 64*4*2;
int cellSize = 2;
int maxDigs = 15000;
int waterfallMax = 25;
int[][] tiles = new int[mapSize][mapSize];
boolean isCleaning = true;
ArrayList miners = new ArrayList(); // each miner contains a position value for the miner

void setup() {
  size(1200,1200);
  background(0);
  noStroke();
}
void draw(){
  if (keyPressed) {
    clearCave();
    genCave(new PVector(mapSize/2,mapSize/2));
    for (int i = 0; i < 10; i++)
      genCave(new PVector(random(0,mapSize),random(0,mapSize)));
    genWaterfalls();
    drawCave();
  }
}

void drawCave() {
  println("Starting Drawing");
  for(int i = 0; i < mapSize; i++)
    for (int j = 0; j < mapSize; j++) {
      if (tiles[i][j] == 0) fill(0);
      else if (tiles[i][j] == 1) fill(255);
      else if (tiles[i][j] == 2) fill(0,155,255);
      rect(i*cellSize,j*cellSize,cellSize,cellSize);
    }
  println("Finished Drawing");
}
// If miner has no walls around it (tiles all are 1) and miners.size() > 1 (aka not last miner) then miners.remove(i)

void clearCave() {
  for(int i = 0; i < mapSize; i++)
    for (int j = 0; j < mapSize; j++) {
      tiles[i][j] = 0;
    }
}
void genCave(PVector caveBegin) {
  miners = new ArrayList();
  miners.add(caveBegin);
  int minedTiles = 0;
  println("Starting Mining");
  while (miners.size() != 0 && minedTiles < maxDigs)
  for (int i = 0; i < miners.size(); i++){
    caveDig(i);
    minedTiles++;
    print(":" + minedTiles);
  }
  println("Finished Mining");
  println("Culling Single Ones");
  cullLonelyTiles();
  println("Culled single tiles");
}
void genWaterfalls() {
  for (int i = 0; i < waterfallMax; i++){
    boolean foundPlace = false;
    while (!foundPlace) {
      PVector waterLoc = new PVector(random(1,mapSize-1),random(1,mapSize-1),0);
      if (tiles[(int) waterLoc.x][(int)waterLoc.y] == 1 && tiles[(int) waterLoc.x][(int)waterLoc.y-1] == 0)
      {
        tiles[(int) waterLoc.x][(int)waterLoc.y] = 2;
        while (!foundPlace) {
          waterLoc.y += 1;
          if (waterLoc.y > 0 && waterLoc.y < mapSize && tiles[(int) waterLoc.x][(int)waterLoc.y] == 1)
            tiles[(int) waterLoc.x][(int)waterLoc.y] = 2;
          else {
            foundPlace = true;
          }
        }
      }
    }
  }
}
void caveDig(int i){
  //print(" D " );
    PVector miner = (PVector) miners.get(i);
    float r = random(0,1);
    if (r < 0.25) {
      if ((int)miner.x > 0){
        miner.set(miner.x-1,miner.y,0);
        tiles[(int) miner.x][(int)miner.y] = 1;
      }
    } else if (r >= 0.25 && r <= 0.5) {
      if ((int)miner.y < mapSize-1){
      miner.set(miner.x,miner.y+1,0);
      tiles[(int) miner.x][(int)miner.y] = 1;
      }
    } else if (r >= 0.5 && r <= 0.75) {
    if ((int)miner.y > 0){
      miner.set(miner.x,miner.y-1,0);
      tiles[(int) miner.x][(int)miner.y] = 1;
    }
    } else if (r > 0.75) {
    if ((int)miner.x < mapSize-1){
      miner.set(miner.x+1,miner.y,0);
      tiles[(int) miner.x][(int)miner.y] = 1;
    }
    }
    if ((int)miner.x > 0 && (int)miner.x < mapSize-1 && (int)miner.y > 0 && (int)miner.y < mapSize-1)
      if (tiles[(int)miner.x][(int)miner.y+1] == 1 && tiles[(int)miner.x][(int)miner.y-1] == 1 && 
      tiles[(int)miner.x+1][(int)miner.y] == 1 && tiles[(int)miner.x-1][(int)miner.y] == 1 && miners.size() >1) 
        miners.remove(i);
    else {
      float s = random(0,1);
      if (s < 0.08);
        //miners.add(new PVector(miner.x,miner.y));
    }
}

void cullLonelyTiles() {
  for(int i = 1; i < mapSize-1; i++)
    for (int j = 1; j < mapSize-1; j++) {
      if (tiles[i+1][j] == 1 &&tiles[i-1][j] == 1 &&tiles[i][j+1] == 1 &&tiles[i-1][j-1] == 1)
        tiles[i][j] = 1;
      else if (isCleaning) {
       int checkAdjTiles = 0;
       if (tiles[i+1][j] == 1) checkAdjTiles++;
       if (tiles[i-1][j] == 1) checkAdjTiles++;
       if (tiles[i][j+1] == 1) checkAdjTiles++;
       if (tiles[i-1][j-1] == 1) checkAdjTiles++;
       if (checkAdjTiles > 2)
        tiles[i][j] = 1;
      }
    }
}


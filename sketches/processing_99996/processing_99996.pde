
final int gridWidth = 10;
final int gridHeight = 22;
final int gridHidden = 2;
final int gridStartX = 0;
final int gridStartY = 0;

int level = 1;
int score = 0;
int speedDelay = 500;
int grid[][];
int rectWidth, rectHeight;
float timer;

int tetrPosX;
int tetrPosY;
int tetrType;
int tetrRot;
int tetrSize;

boolean tetrLocked;
boolean tetrDownStep;
boolean tetrDrop;

int tetrSaved;
boolean tetrCanSave;

final int maxQueue = 4;
int tetrQueue[];
int queueX;
int queueY;

boolean gameOver = false;

void setup() {
  size (450, 600);
  background(225);
  
  grid = new int[gridWidth][gridHeight];
  
  for (int x = 0; x < gridWidth; x++ ) {
    for (int y = 0; y < gridHeight; y++ ) {
      grid[x][y] = 0;
     }
  }
  
  rectWidth = 30;
  rectHeight = 30;
  queueX = 315;
  queueY = 15;
  
  tetrQueue = new int[maxQueue];
  for (int i = 0; i < maxQueue; i++) {
    tetrQueue[i] = (int)random(0,7);
  }
  
  tetrNew();
  
  tetrSaved = 7;
  tetrCanSave = true;
  timer = millis();

}

void draw() {
  board();
  renderQueue();
  renderGrid();
  if (!gameOver && (millis() > timer + speedDelay || tetrDownStep || tetrDrop)) {
    if (tetrDrop) {
      while (tetrDrop) {
        tetrStepDown();
        tetrDrop = tetrCheckMove(0,1);
      }
    } else {
      tetrStepDown();
    }

    tetrDownStep = false;
    tetrDrop = false;
    timer = millis();
  }  

  if (gameOver) {
    tetrLocked = true;
    renderGameOver();
  }
}
void renderQueue() {
  for(int y = 0 ; y < 4; y++) {
    for(int x = 0; x < 4; x++) {
      switchFillColor(gridTemplate[tetrQueue[0]][0][y][x]);
      rect(queueX + x*rectWidth, queueY + y*rectHeight, rectWidth, rectHeight);
    }
  }
  for (int i = 1; i < maxQueue; i++){
    for(int y = 0; y < 4; y++) {
      for(int x = 0 ; x < 4; x++) {
        int yi = 150 + (i-1)*(75);
          switchFillColor(gridTemplate[tetrQueue[i]][0][y][x]);
          rect(rectWidth + queueX + x*(rectWidth/2), yi + (y*(rectHeight/2)), rectWidth/2, rectHeight/2);
      }
    }
  }
  int yi = (16 * rectHeight ) - queueY;
  for(int y = 0; y < 4; y++) {
    for(int x = 0 ; x < 4; x++) {
      switchFillColor(gridTemplate[tetrSaved][0][y][x]);
      rect(queueX + x*rectWidth, yi + y*rectHeight, rectWidth, rectHeight);
    }
  }
}
void renderShadow() {
  int x1 = tetrPosX;
  int y1 = tetrPosY;
  boolean moveOK = false;
  while (tetrCheckMove(0, 1, x1, y1, tetrRot)) {
    y1++;
  }
  
  for (int y = 0; y < tetrSize; y++) {
    for (int x = 0; x < tetrSize; x++) {
      if (gridTemplate[tetrType][tetrRot][y][x] != 0 && y + y1 > gridHidden) {
         fill(50);
         rect((x + x1) * 30,(y + y1 - gridHidden) * 30, 30, 30);
      }
    }
  }
}
void renderGrid() {
  stroke(100);
  
  for(int x = 0;x < gridWidth; x++) {
    for(int y = 0;y < gridHeight; y++) {
        switchFillColor(grid[x][y]);
        rect(x*rectWidth,(y - gridHidden)*rectHeight, rectWidth, rectHeight);
    }
  }
    renderShadow();
    
  for(int y = 0; y < tetrSize; y++) {
    for(int x = 0; x < tetrSize; x++) {
      if (gridTemplate[tetrType][tetrRot][y][x]!=0 && y + tetrPosY >= gridHidden) {
        switchFillColor(gridTemplate[tetrType][tetrRot][y][x]);
        rect((x + tetrPosX)*rectWidth,(y + tetrPosY - gridHidden)*rectHeight, rectWidth, rectHeight);
      }
    }
  }  
}
void switchFillColor(int c) {
  switch (c) {
    case 0: fill(0,0,0); break;
    case 1: fill(0,255,255); break;
    case 2: fill(0,0,255); break;
    case 3: fill(255,165,0); break;
    case 4: fill(255,255,0); break;
    case 5: fill(0,255,0); break;
    case 6: fill(148,0,211); break;
    case 7: fill(255,0,0); break;
    default: fill(255); break;
  }
}
boolean tetrCheckMove(int xm, int ym) {
  return tetrCheckMove(xm, ym, tetrPosX, tetrPosY, tetrRot);
}
boolean tetrCheckMove(int xm, int ym, int tetrX, int tetrY, int tetrR) {
  boolean moveOK = true;
  int gridC = 1;
  for(int y = tetrSize - 1; y >= 0; y--) {
    for(int x = tetrSize - 1; x >= 0; x--) {
      if (!(tetrY + y + ym >= 0 && tetrY + y + ym < 22) || !(tetrX + x + xm >= 0 && tetrX + x + xm < gridWidth)) {
        gridC = 1;
      } else {
        gridC = grid[tetrX + x+ xm ][tetrY + y + ym];
      }
      if (!(gridC == 0 || gridTemplate[tetrType][tetrR][y][x] == 0)) 
        moveOK = false;
    }
  }
  return moveOK;
}
boolean tetrStepDown() {
  boolean moveOK = tetrCheckMove(0,1);
       
  if (moveOK) {
    tetrPosY++;
  } else {
    if (tetrPosY == 0) {
      gameOver = true;
    } else {
      tetrFixToGrid();
      gridCheck();
      tetrNew();
      tetrCanSave = true;
    }
  }

  return !moveOK;
}
boolean tetrCheckRotate(int rm) {
  boolean rotateOK = false;
  int x = tetrPosX;
  int y = tetrPosY;
  int tetrR = tetrRot + rm;
  if (tetrR == 4) 
    tetrR = 0;
    
    rotateOK = tetrCheckMove(0, 0, x, y, tetrR);
      if (rotateOK || tetrCheckMove(-1, 0, x, y, tetrR)) {
         x--;
        rotateOK = tetrCheckMove(0, 0, x, y, tetrR);
    }
        
    if (rotateOK || tetrCheckMove(-2, 0, x, y, tetrR)) {
        x = x - 2; 
        rotateOK = tetrCheckMove(0, 0, x, y, tetrR);
    }

    if (rotateOK || tetrCheckMove(1, 0, x, y, tetrR)) {
        x++;
        rotateOK = tetrCheckMove(0, 0, x, y, tetrR);
    }

    if (rotateOK || tetrCheckMove(2, 0, x, y, tetrR)) {
        x = x +2 ;
        rotateOK = tetrCheckMove(0, 0, x, y, tetrR);
    }
  if (rotateOK) 
    tetrPosX = x;
  return rotateOK;
}
void gridCheck() {
  boolean removeLine;
  int c1 = 0;
  int c2 = 0;
  for (int y = 0; y < gridHeight; y++) {
    for (int x = 0; x < gridWidth; x++) {
      if (grid[x][y] != 0) {
        c1++;
      }
    }
  }
  
  for (int y = gridHeight - 1; y >= 0; y--) {
    removeLine=true;
    for (int x = 0; x < gridWidth; x++) {
      if (grid[x][y] == 0) {
      removeLine=false; 
      break;}
    }
    if (removeLine) {
      for (int yi = 0; yi <= y; yi++) {
        for (int xi = 0; xi < gridWidth; xi++) {
          grid[xi][yi] = grid[xi][yi - 1];
        }
      }
      for (int xi = gridWidth - 1; xi >= 0 ; xi--) {
        grid[xi][0] = 0;
      }
    }
  }
   for (int y = 0; y < gridHeight; y++) {
    for (int x = 0; x < gridWidth; x++) {
      if (grid[x][y] != 0) {
        c2++;
      }
    }
  }
  Scoring((c1 - c2)/10);
  speed();
}
void tetrFixToGrid() {
  for(int y = tetrSize - 1; y >= 0; y--) {
    for(int x = tetrSize - 1; x >= 0; x--) {
      if (gridTemplate[tetrType][tetrRot][y][x]!=0) {
        grid[tetrPosX + x][tetrPosY + y] = gridTemplate[tetrType][tetrRot][y][x];
      }
    }
  }
}

void tetrSave() {
  int t = tetrSaved;
  tetrSaved = tetrType;
  if (t != 7) {
    tetrNew(t);
    tetrCanSave=false;
  }else{
    tetrNew();
  }
}
void renderGameOver() {
  fill(255);
  background(0);
  textSize(70);
  int x1 = int(((gridWidth*rectWidth)/2)-(textWidth("Score : ")/2));
  text("Game Over!!", 21, 150);
  textSize(50);
  text("Score : " + score,x1 ,250);
  fill(200);
  text("Press \"ENTER\" \nto restart \na new game.",x1-15 ,350);
  if (keyCode == ENTER) {
    gameOver = false;
    tetrLocked = false;
    score = 0;
    level = 1;
    reset(); 
    }
  
}
void Scoring(int y) {
  if ( y == 4 ) {
    score += 800;
  }else if ( y == 1 || y == 2 || y == 3) {
   score += y * 100;
  }   
}
void speed() {
  if ( score >= 1000 && level <= 10 ) {
    speedDelay = 500 - ((int)score / 1000) * 40 ;
    level = (int)score / 1000 + 1;
  }
}
void board() {
  textSize(23);
  fill(50);
  background(225);
  text("Score : " + score, 300 , 400);
  text("Level : " + level, 300 , 430);
}
void tetrNew() { 
  int type = tetrQueue[0];
  for(int i = 0; i < maxQueue-1; i++) {
    tetrQueue[i] = tetrQueue[i + 1];
  }
  tetrQueue[maxQueue-1] = (int)random(0,7);

  tetrNew(type);
}

void tetrNew(int type) {
  tetrType = type; 
  tetrSize = 4; 

  tetrRot=0;
  tetrPosY=0;
  tetrPosX = int(gridWidth / 2) - (tetrSize - 1);
}
void reset() {
  size (450, 600);
  background(225);
  
  grid = new int[gridWidth][gridHeight];
  
  for (int x = 0; x < gridWidth; x++ ) {
    for (int y = 0; y < gridHeight; y++ ) {
      grid[x][y] = 0;
     }
  }
  
  rectWidth = 30;
  rectHeight = 30;
  queueX = 15 + rectWidth* gridWidth;
  queueY = 15;
  
  tetrQueue = new int[maxQueue];
  for (int i = 0; i < maxQueue; i++) {
    tetrQueue[i] = (int)random(0,7);
  }
  
  tetrNew();
  
  tetrSaved = 7;
  tetrCanSave = true;
  timer = millis();
}
void keyPressed() {
  if (!tetrLocked) {
    // MOVE LEFT
    if (keyCode == LEFT) {
      if (tetrCheckMove(-1,0)) tetrPosX--;
    }
    // MOVE RIGHT
    if (keyCode == RIGHT && tetrCheckMove(1,0))
      tetrPosX++;
    // DOWN
    if (keyCode == DOWN)
      tetrDownStep=true;
    // UP
    if (keyCode == ' ') 
      tetrDrop=true;
    // SAVE TETRIMINO
    if ((keyCode == SHIFT) && tetrCanSave)
      tetrSave();
    
    // ROTATE RIGHT
    if ((keyCode == UP) && tetrCheckRotate(+1)) { 
      tetrRot++; timer = millis();
    }
      
    if (tetrRot == 4)
      tetrRot = 0;
  }
}
final int gridTemplate[][][][] = {
  {{{0,0,0,0}, // I = 0
    {1,1,1,1},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,0,1,0},
    {0,0,1,0},
    {0,0,1,0},
    {0,0,1,0}},
   {{0,0,0,0},
    {0,0,0,0},
    {1,1,1,1},
    {0,0,0,0}},
   {{0,1,0,0},
    {0,1,0,0},
    {0,1,0,0},
    {0,1,0,0}}},
  {{{2,0,0,0}, // J = 1
    {2,2,2,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,2,2,0},
    {0,2,0,0},
    {0,2,0,0},
    {0,0,0,0}},
   {{0,0,0,0},
    {2,2,2,0},
    {0,0,2,0},
    {0,0,0,0}},
   {{0,2,0,0},
    {0,2,0,0},
    {2,2,0,0},
    {0,0,0,0}}},
  {{{0,0,3,0}, // L = 2
    {3,3,3,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,3,0,0},
    {0,3,0,0},
    {0,3,3,0},
    {0,0,0,0}},
   {{0,0,0,0},
    {3,3,3,0},
    {3,0,0,0},
    {0,0,0,0}},
   {{3,3,0,0},
    {0,3,0,0},
    {0,3,0,0},
    {0,0,0,0}}},
  {{{0,4,4,0}, // O = 3
    {0,4,4,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,4,4,0},
    {0,4,4,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,4,4,0},
    {0,4,4,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,4,4,0},
    {0,4,4,0},
    {0,0,0,0},
    {0,0,0,0}}},
  {{{0,5,5,0}, // S = 4
    {5,5,0,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,5,0,0},
    {0,5,5,0},
    {0,0,5,0},
    {0,0,0,0}},
   {{0,0,0,0},
    {0,5,5,0},
    {5,5,0,0},
    {0,0,0,0}},
   {{5,0,0,0},
    {5,5,0,0},
    {0,5,0,0},
    {0,0,0,0}}},
  {{{0,6,0,0}, // T = 5
    {6,6,6,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,6,0,0},
    {0,6,6,0},
    {0,6,0,0},
    {0,0,0,0}},
   {{0,0,0,0},
    {6,6,6,0},
    {0,6,0,0},
    {0,0,0,0}},
   {{0,6,0,0},
    {6,6,0,0},
    {0,6,0,0},
    {0,0,0,0}}},
  {{{7,7,0,0}, // Z = 6
    {0,7,7,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,0,7,0},
    {0,7,7,0},
    {0,7,0,0},
    {0,0,0,0}},
   {{0,0,0,0},
    {7,7,0,0},
    {0,7,7,0},
    {0,0,0,0}},
   {{0,7,0,0},
    {7,7,0,0},
    {7,0,0,0},
    {0,0,0,0}}},
  {{{0,0,0,0}, // clear
    {0,0,0,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,0,0,0},
    {0,0,0,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,0,0,0},
    {0,0,0,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,0,0,0},
    {0,0,0,0},
    {0,0,0,0},
    {0,0,0,0}}}
};



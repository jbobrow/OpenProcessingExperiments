
int[] tiles = {-4, 10, 36, -16, -9, 3, 0, 8, -8, -12, -6, 4, 12, 15, 18, 24};
int[] from = {0, 1, 3, 4, 6, 7, 0, 1, 2, 3, 4, 5};
int[] to    = {1, 2, 4, 5, 7, 8, 3, 4, 5, 6, 7, 8};
int[] finalX = {50, 210, 370,  50, 210, 370,  50, 210, 370};
int[] finalY = {50,  50,  50, 210, 210, 210, 370, 370, 370};
int[] shuffle = {14, 5, 10, 0, 11, 2, 1, 3, 4, 8, 15, 7, 13, 12, 9, 6};

int activeTile;
int xOffset, yOffset;
boolean drag = false;
boolean win = false;

int numTiles = tiles.length;
int numEdges = from.length;
int numTargets = finalX.length;

int[] slots = new int[numTiles];
int[] currentX = new int[numTiles];
int[] currentY = new int[numTiles];
int[] labels = new int[numEdges];

void setup() {
  size(720, 540);
  background(240, 240, 255);

  for (int i = 0; i < numTiles; i++) {
    slots[i] = -1;
    int j = shuffle[i];
    currentX[i] = 490 + 80 * (int) (j / 6);
    currentY[i] = 10 + 80 * (j % 6);
  }

  for (int i = 0; i < numEdges; i++) {
    labels[i] = tiles[from[i]] * tiles[to[i]];
  }
}

void draw() {
  background(240, 240, 255);
  stroke(0);
        
  // Draw edges
  for (int i=0; i < numEdges; i++) {
    line(finalX[to[i]]+30, finalY[to[i]]+30, 
          finalX[from[i]]+30, finalY[from[i]]+30);
  }
        
  // Draw edge labels
  fill(0);
  textSize(16);
  for (int i=0; i < numEdges; i++) {
    int midptX = (int) ((finalX[to[i]] + finalX[from[i]])/2);
    int midptY = (int) ((finalY[to[i]] + finalY[from[i]])/2);
    text("" + labels[i], midptX, midptY+20);
  }
        
  // Draw target squares
  fill(192, 192, 192);
  for (int i=0; i < numTargets; i++) {
    rect(finalX[i], finalY[i], 60, 60);
    text("" + labels[i], currentX[i]+20, currentY[i]+20);
  }
        
  // Draw inactive tiles
  
  textSize(24);
  for (int i=0; i < numTiles; i++) {
    if (!drag || activeTile != i){
      fill(192, 102, 51);
      rect(currentX[i], currentY[i], 60, 60);
      fill(0);
      text("" + tiles[i], currentX[i]+10, currentY[i]+40);
    }
  }
        
  // Draw active tile
  if (drag) {
    fill(204, 102, 102);
    rect(currentX[activeTile], currentY[activeTile], 60, 60);
    fill(0);
    text("" + tiles[activeTile], currentX[activeTile]+10, currentY[activeTile]+40);
  }
    
  // Congratulate the player
  if (win) {
    textSize(32);
    fill(255,0,0);
    text("Success!", 180, 480);
  }
}


void mousePressed(){
  activeTile = -1;
  for (int i = 0; i < numTiles; i++) {
    int x = mouseX - currentX[i];
    int y = mouseY - currentY[i];
    if (0 <= x && x <= 60 && 0 <= y && y <= 60) {
      activeTile = i;
      break;
    }
  }
  if (activeTile > -1){
    drag = true;
    xOffset = mouseX - currentX[activeTile];
    yOffset = mouseY - currentY[activeTile];
  }
}


void mouseDragged(){
  if (drag){
    currentX[activeTile] = (int) mouseX - xOffset;
    currentY[activeTile] = (int) mouseY - yOffset;
  }
}

void mouseReleased(){
  if (drag) {
    drag = false;
    int x = currentX[activeTile];
    int y = currentY[activeTile];
    x = 10 * (int)((x+5)/10);
    y = 10 * (int)((y+5)/10);
    currentX[activeTile] = x;
    currentY[activeTile] = y;
    slots[activeTile] = -1;
    for (int i=0; i < finalX.length; i++) {
      if (finalX[i] == x && finalY[i] == y) {
        slots[activeTile] = i;
        break;
      }
    }
    // check for win
    win = true;
    for (int i = 0; i < numEdges; i++) {
      int j = from[i];
      int k = to[i];
      if (slots[j] < 0 || slots[k] < 0 || tiles[j] * tiles[k] != labels[i]) {
        win = false;
        break;
      }
    }
  }
}



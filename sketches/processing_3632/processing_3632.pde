
/* 
 * Loops by Algirdas Rascius (http://mydigiverse.com).
 */
/**
 * Inspired by Loops Of Zen game by Dr. Arend Hintze (http://www.alproductions.us/Loops_Of_Zen). 
 * <br>
 * Click to restart. Each time parameters used to generate lines will differ.
 */ 

static final float SMALL_SIZE = 0.5;
static final float LINE_SIZE = 0.2;
static final int CELL_SIZES[] = {10, 20, 25, 50};

boolean horizontalDivisions[][];
boolean verticalDivisions[][];
int cellSize;
int xCount;
int yCount;
float probabilityOffset;

void setup() {
  size(750, 500);
  smooth();
  noFill();
  
  initialize();
}

void initialize() {
  background(255);
  stroke(0);
  ellipseMode(CENTER);
  cellSize = CELL_SIZES[(int)random(CELL_SIZES.length)];
  xCount = width/cellSize;
  yCount = height/cellSize;
  probabilityOffset = random(TWO_PI);
  strokeWeight(cellSize*LINE_SIZE);
  
  horizontalDivisions = new boolean[xCount][yCount];
  verticalDivisions = new boolean[xCount][yCount];

  float connectionProbability = getConnectionProbability();
  for (int x=1; x<xCount; x++) {
    for (int y=0; y<yCount; y++) {
      verticalDivisions[x][y] = random(1) < connectionProbability;  
    }
  }
  for (int x=0; x<xCount; x++) {
    for (int y=1; y<yCount; y++) {
      horizontalDivisions[x][y] = random(1) < connectionProbability;  
    }
  }
  for (int x=0; x<xCount; x++) {
    for (int y=0; y<yCount; y++) {
      drawCell(x, y);  
    }
  }
  
  frameRate(yCount);
}

void mouseClicked() {
   initialize();
}

void keyPressed() {
   initialize();
}

float getConnectionProbability() {
  return  max(0.3, min(0.9, sin((frameCount/2.0/xCount/yCount - probabilityOffset)%TWO_PI)));
}

void draw() {
  float connectionProbability = getConnectionProbability();

  if (random(1) < 0.5) {
    int x = (int)random(1, xCount);
    int y = (int)random(0, yCount);
    verticalDivisions[x][y] = random(1) < connectionProbability;
    drawCell(x-1, y);
    drawCell(x, y);
  } else {
    int x = (int)random(0, xCount);
    int y = (int)random(1, yCount);
    horizontalDivisions[x][y] = random(1) < connectionProbability;
    drawCell(x, y-1);
    drawCell(x, y);
  }
}

void drawCell(int x, int y) {
  fill(255);
  noStroke();
  rect(cellSize*x, cellSize*y, cellSize, cellSize);
  noFill();
  stroke(0);
  
  boolean drawn = false;
  if (horizontalDivisions[x][y] && verticalDivisions[(x+1)%xCount][y]) {
    arc(cellSize*(x+1), cellSize*y, cellSize, cellSize, PI/2, PI);
    drawn = true;
  }
  if (verticalDivisions[(x+1)%xCount][y] && horizontalDivisions[x][(y+1)%yCount]) {
    arc(cellSize*(x+1), cellSize*(y+1), cellSize, cellSize, PI, PI+PI/2);
    drawn = true;
  }
  if (horizontalDivisions[x][(y+1)%yCount] && verticalDivisions[x][y]) {
    arc(cellSize*x, cellSize*(y+1), cellSize, cellSize, PI+PI/2, TWO_PI);
    drawn = true;
  }
  if (verticalDivisions[x][y] && horizontalDivisions[x][y]) {
    arc(cellSize*x, cellSize*y, cellSize, cellSize, 0, PI/2);
    drawn = true;
  }

  if (!drawn) {
    if (horizontalDivisions[x][y] && horizontalDivisions[x][(y+1)%yCount]) {
      line(cellSize*(x+0.5), cellSize*y, cellSize*(x+0.5), cellSize*(y+1));
      drawn = true;
    }
    if (verticalDivisions[x][y] && verticalDivisions[(x+1)%xCount][y]) {
      line(cellSize*x, cellSize*(y+0.5), cellSize*(x+1), cellSize*(y+0.5));
      drawn = true;
    }    
  }
  
  if (!drawn) {
    if (horizontalDivisions[x][y]) {
      ellipse(cellSize*(x+0.5), cellSize*(y+0.5), cellSize*SMALL_SIZE, cellSize*SMALL_SIZE);
      line(cellSize*(x+0.5), cellSize*y, cellSize*(x+0.5), cellSize*(y+0.5-SMALL_SIZE/2)); 
    }
    if (verticalDivisions[(x+1)%xCount][y]) {
      ellipse(cellSize*(x+0.5), cellSize*(y+0.5), cellSize*SMALL_SIZE, cellSize*SMALL_SIZE);
      line(cellSize*(x+1), cellSize*(y+0.5), cellSize*(x+0.5+SMALL_SIZE/2), cellSize*(y+0.5)); 
    }
    if (horizontalDivisions[x][(y+1)%yCount]) {
      ellipse(cellSize*(x+0.5), cellSize*(y+0.5), cellSize*SMALL_SIZE, cellSize*SMALL_SIZE);
      line(cellSize*(x+0.5), cellSize*(y+1), cellSize*(x+0.5), cellSize*(y+0.5+SMALL_SIZE/2)); 
    }
    if (verticalDivisions[x][y]) {
      ellipse(cellSize*(x+0.5), cellSize*(y+0.5), cellSize*SMALL_SIZE, cellSize*SMALL_SIZE);
      line(cellSize*x, cellSize*(y+0.5), cellSize*(x+0.5-SMALL_SIZE/2), cellSize*(y+0.5)); 
    }
  }  
}



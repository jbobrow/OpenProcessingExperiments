
/* 
 * Fancy Braid by Algirdas Rascius (http://mydigiverse.com).
 */
/** 
 * Click to restart. Each time parameters used to generate braid will differ.
 */ 
 
static final int CELL_HEIGHT = 10;
static final int CELL_WIDTH = 15;
static final float MARGIN_X = 7;
static final float MARGIN_Y = 5.5;
static final float lineWidth = 2.0;
static final float outlineWidth = 5.0;
static final int EMPTY = -1;

int sizeX;
int sizeY;
int cells[][];
int maxAreaSize;
float straightProbability;

void setup() {
  size(750, 500);
  smooth();
  sizeX = (width - (int)MARGIN_X) / CELL_WIDTH;
  sizeY = height / CELL_HEIGHT;
  cells = new int[sizeX][sizeY];
  
  initialize();
}

void initialize() {
  background(255);
  stroke(0);
  strokeWeight(lineWidth);
  for (int y=0; y<sizeY; y++) {
    float yPos = MARGIN_Y + CELL_HEIGHT*y;
    line(0, yPos, width, yPos);
    for (int x=0; x<sizeX; x++) {
      cells[x][y] = EMPTY;
    }
  }
  maxAreaSize = (int)random(2, 5);
  straightProbability = random(1);
}

void mouseClicked() {
   initialize();
}

void keyPressed() {
   initialize();
}

void draw() {
  int areaSize = (int)random(1, maxAreaSize);
  int x = (int)random(0, sizeX-areaSize+1);
  int y = (int)random(0, sizeY-areaSize);
  if (isEmpty(x, y, areaSize)) {
    drawBraidElement(x, y, areaSize);  
  } else {
    if (random(1)<0.2 && cells[x][y] != EMPTY) {
      redrawBraidElement(x, y);
    }
  }
}

boolean isEmpty(int x, int y, int areaSize) {
  for (int i=0; i<areaSize; i++) {
    for (int j=0; j<=areaSize; j++) {
      if (cells[i+x][j+y] != EMPTY) {
        return false;
      }
    }
  }
  return true;
}

void drawBraidElement(int x, int y, int areaSize) {
  for (int i=0; i<areaSize; i++) {
    for (int j=0; j<=areaSize; j++) {
      cells[i+x][j+y] = frameCount;
    }
  }

  fill(255);
  noStroke();
  rect(MARGIN_X + CELL_WIDTH*x, MARGIN_Y + CELL_HEIGHT*(y-0.5), CELL_WIDTH*areaSize, CELL_HEIGHT*(areaSize+1));
  
  if (random(1) < straightProbability) {
    // Draw only straight connections 
    boolean leftDone[] = new boolean[areaSize+1];
    boolean rightDone[] = new boolean[areaSize+1];
    for (int j=0; j<=areaSize; j++) {    
      int left = getRandomEmpty(leftDone);
      int right = getRandomEmpty(rightDone);
      drawConnection(x, y+left, x+areaSize, y+right, x+areaSize*0.5);   
    } 
  } else {
    // Draw any connections
    int count = areaSize+1;
    boolean done[] = new boolean[2*count];
    for (int j=0; j<count; j++) {    
      int one = getRandomEmpty(done);
      int two = getRandomEmpty(done);
      drawConnection(x+areaSize*(one/count), y+one%count, x+areaSize*(two/count), y+two%count, x+areaSize*0.5);   
    } 
  }
}

void redrawBraidElement(int x, int y) {
  while (x>0 && cells[x-1][y]==cells[x][y]) {
    x--;
  }
  while (y>0 && cells[x][y-1]==cells[x][y]) {
    y--;
  }
  int areaSize = 1;
  while (x+areaSize < sizeX && cells[x+areaSize][y]==cells[x][y]) {
    areaSize++;
  }
  drawBraidElement(x, y, areaSize);
}

int getRandomEmpty(boolean doneArray[]) {
  int i = (int)random(doneArray.length);
  while (doneArray[i]) {
    i = (i+1) % doneArray.length;
  }
  doneArray[i] = true;
  return i;
}

void drawConnection(int x1, int y1, int x2, int y2, float xMiddle) {
  noFill();
  stroke(255);
  strokeWeight(outlineWidth);
  strokeCap(SQUARE);
  drawConnectionLine(x1, y1, x2, y2, xMiddle);
  stroke(0);
  strokeWeight(lineWidth);
  strokeCap(ROUND);
  drawConnectionLine(x1, y1, x2, y2, xMiddle);
}

void drawConnectionLine(int x1, int y1, int x2, int y2, float xMiddle) {
  if (x1==x2) {
    xMiddle = x1 + 0.5 * abs(y1-y2) * (xMiddle>x1 ? 1 : -1);
  }
  bezier(
    MARGIN_X+CELL_WIDTH*x1, MARGIN_Y+CELL_HEIGHT*y1,
    MARGIN_X+CELL_WIDTH*xMiddle, MARGIN_Y+CELL_HEIGHT*y1,
    MARGIN_X+CELL_WIDTH*xMiddle, MARGIN_Y+CELL_HEIGHT*y2,
    MARGIN_X+CELL_WIDTH*x2, MARGIN_Y+CELL_HEIGHT*y2);
}



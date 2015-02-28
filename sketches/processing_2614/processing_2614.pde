
/* 
 * Ornamental TreeOrnamental Tree by Algirdas Rascius (http://mydigiverse.com).
 */
/** 
 * Click to restart.
 */ 

static final int SIZE = 25;
static final int MARGIN = 25;
static final float LEAF_SIZE = 0.4;
static final float SEED_SIZE = 0.3;

float animateProbability;
int sizeX;
int sizeY;
int dirsX[][];
int dirsY[][];
boolean isBranch[][];
LinkedList points1;
LinkedList points2;
Iterator pointIterator;

void setup() {
  size(750, 500);
  smooth();
  stroke(0);
  strokeWeight(1.0/SIZE);
  noFill();
  sizeX = (width - MARGIN) / SIZE;
  sizeY = (height - MARGIN) / SIZE;
  dirsX = new int[sizeX][sizeY];
  dirsY = new int[sizeX][sizeY];
  isBranch = new boolean[sizeX][sizeY];
  points1 = new LinkedList();
  points2 = new LinkedList();  
  
  initialize();
}

void initialize() {
  background(255);
  animateProbability = random(0.05, 1);
  for (int x=0; x<sizeX; x++) {
    for (int y=0; y<sizeY; y++) {
      dirsX[x][y] = 0;
      dirsY[x][y] = 0;
      isBranch[x][y] = false;
    }
  }
  points1.clear();
  points2.clear();
  pointIterator = points1.iterator();
}

void mouseClicked() {
   initialize();
}

void keyPressed() {
   initialize();
}

void draw() {
  translate(MARGIN, MARGIN);
  scale(SIZE);
  
  for (int i=0; i<2/animateProbability; i++) {  
    if (pointIterator.hasNext()) {
      Point p = (Point)pointIterator.next();
      if (random(1) < animateProbability) {
        if (!p.animate()) {
          pointIterator.remove();
        }
      }
    } else {
      LinkedList tempPoints = points1;
      points1 = points2;
      points2 = tempPoints;
      addRandomPoint();
      pointIterator = points1.iterator();
    }
  }
}

void addRandomPoint() {
  int x = (int)random(sizeX-2) + 1;
  int y = (int)random(sizeY-2) + 1;
  if (dirsX[x][y] == 0) {
    dirsX[x][y] = random(1)< 0.5 ? 1 : -1;
    dirsY[x][y] = random(1)< 0.5 ? 1 : -1;
    isBranch[x][y] = true;
    points2.add(new Point(x, y));
    fill(0);
    ellipse(x, y, SEED_SIZE, SEED_SIZE);
    noFill();
  }
}

void drawArc(float x1, float y1, float xc, float yc, float x2, float y2) {
  beginShape();
  vertex(x1, y1);
  bezierVertex(
    (x1+xc)/2, (y1+yc)/2,
    (x2+xc)/2, (y2+yc)/2,
    x2, y2);
  endShape();
}

class Point {
  int x;
  int y;
  
  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }

  boolean animate() {
    int r1 = (int)random(3);
    int r2 = (int)random(2) + 1;
    for (int i=0; i<3; i++) {
      if (r1 == 0) {
        if (canAnimateX()) {
         animateX();
         return true;
        }
      }
      if (r1 == 1) {
        if (canAnimateY()) {
         animateY();
         return true;
        }
      }
      if (r1 == 2) {
        if (canAnimateXY()) {
         animateXY();
         return true;
        }
      }
      r1 = (r1+r2)%3;
    }
    if (!isBranch[x][y]) {
      drawLeaf();
    }
    return false;
  }
  
  boolean canAnimateX() {
    int newX = x + dirsX[x][y];
    return newX>=0 && newX<sizeX && dirsX[newX][y]==0;
  }

  boolean canAnimateY() {
    int newY = y + dirsY[x][y];
    return newY>=0 && newY<sizeY && dirsY[x][newY]==0;
  }

  boolean canAnimateXY() {
    int newX = x + dirsX[x][y];
    int newY = y + dirsY[x][y];
    return newX>=0 && newX<sizeX && newY>=0 && newY<sizeY && dirsY[newX][newY]==0 && 
      (newX+dirsX[newX][y]!=x || y+dirsY[newX][y]!=newY) && (x+dirsX[x][newY]!=newX || newY+dirsY[x][newY]!=y); 
  }
  
  void animateX() {
    int newX = x + dirsX[x][y];
    dirsX[newX][y] = dirsX[x][y];
    dirsY[newX][y] = -dirsY[x][y];
    isBranch[x][y] = true;
    points2.add(new Point(newX, y));
    strokeWeight(1.5/SIZE);
    drawArc(x, y, (x+newX)*0.5, y+dirsY[x][y]*0.5, newX, y);    
  }

  void animateY() {
    int newY = y + dirsY[x][y];
    dirsX[x][newY] = -dirsX[x][y];
    dirsY[x][newY] = dirsY[x][y];
    isBranch[x][y] = true;
    points2.add(new Point(x, newY));
    strokeWeight(1.5/SIZE);
    drawArc(x, y, x+dirsX[x][y]*0.5, (y+newY)*0.5, x, newY);
  }

  void animateXY() {
    int newX = x + dirsX[x][y];
    int newY = y + dirsY[x][y];
    isBranch[x][y] = true;
    dirsX[newX][newY] = dirsX[x][y];
    dirsY[newX][newY] = dirsY[x][y];
    points2.add(new Point(newX, newY));
    strokeWeight(1.5/SIZE);
    line(x, y, newX, newY);
  }
  
  void drawLeaf() {
    strokeWeight(1.0/SIZE);
    beginShape();
    vertex(x, y);
    bezierVertex(
      x-dirsX[x][y]*LEAF_SIZE*2/8, y+dirsY[x][y]*LEAF_SIZE*2/8,
      x-dirsX[x][y]*LEAF_SIZE*3/8, y+dirsY[x][y]*LEAF_SIZE*4/8,
      x-dirsX[x][y]*LEAF_SIZE*1/8, y+dirsY[x][y]*LEAF_SIZE*6/8);          
    bezierVertex(
      x+dirsX[x][y]*LEAF_SIZE*1/8, y+dirsY[x][y]*LEAF_SIZE*8/8,
      x+dirsX[x][y]*LEAF_SIZE*6/8, y+dirsY[x][y]*LEAF_SIZE*6/8,
      x+dirsX[x][y]*LEAF_SIZE*8/8, y+dirsY[x][y]*LEAF_SIZE*8/8);  
    bezierVertex(
      x+dirsX[x][y]*LEAF_SIZE*6/8, y+dirsY[x][y]*LEAF_SIZE*6/8,
      x+dirsX[x][y]*LEAF_SIZE*8/8, y+dirsY[x][y]*LEAF_SIZE*1/8,
      x+dirsX[x][y]*LEAF_SIZE*6/8, y-dirsY[x][y]*LEAF_SIZE*1/8);      
    bezierVertex(
      x+dirsX[x][y]*LEAF_SIZE*4/8, y-dirsY[x][y]*LEAF_SIZE*3/8,
      x+dirsX[x][y]*LEAF_SIZE*2/8, y-dirsY[x][y]*LEAF_SIZE*2/8,
      x, y);
    endShape();
  }
}



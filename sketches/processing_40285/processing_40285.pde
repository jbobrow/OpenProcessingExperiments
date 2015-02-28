
static final int NUMBOXES = 50;
static final int BOARD_DIM = 20;
static final int SCREEN_DIM = 400;
Board b;

long lastUp;
int period;

void setup() {
  size(400, 400);
  b = new Board(min(width, height), BOARD_DIM, NUMBOXES);
  period = 500;
  lastUp = millis();
}

void draw() {  
  if ((millis() - lastUp) > period) {
    b.updateBoard();
    lastUp = millis();
  }
    b.drawBoard();

}

void mousePressed() {
  b.mPressed();
}

void mouseReleased() {
  b.mReleased();
}

class Board {
  private int dim;
  private int boxDim;
  private int numBoxes;
  private int[][] theBoard;
  private boolean needsDrawed;
  private boolean isDragging;
  private Box movingBox;

  private ArrayList theBoxes;

  public Board(int bsize, int dim_, int numB_) {
    this.dim = dim_;
    this.boxDim = (bsize)/dim_;
    this.numBoxes = numB_;
    theBoard = new int[dim_][dim_];
    needsDrawed = true;
    theBoxes = new ArrayList();
    isDragging = false;
    movingBox = null;

    for (int i=0; i<dim; i++) {
      for (int j=0; j<dim; j++) {
        theBoard[i][j] = -1;
      }
    }

    for (int c=0; c<numBoxes; c++) {
      int i = (int)random(0, dim);
      int j = (int)random(0, dim);
      while (theBoard[i][j] >= 0) {
        i = (int)random(0, dim);
        j = (int)random(0, dim);
      }

      // have empty i,j
      Box bx = new Box(j, i, boxDim);
      theBoard[i][j] = theBoxes.size();
      theBoxes.add(bx);
    }

    for (int c=0; c<theBoxes.size(); c++) {
      this.addNeighbors((Box)theBoxes.get(c));
    }
  }

  public void drawBoard() {
    if (needsDrawed || isDragging) {
      for (int i=0; i<dim; i++) {
        for (int j=0;j<dim; j++) {
          stroke(0);
          fill(122);
          if (theBoard[i][j] >= 0) {
            fill(0);
          }
          rect(j*boxDim, i*boxDim, boxDim, boxDim);
        }
      }

      for (int c=0; c<theBoxes.size(); c++) {
        Box bx = (Box)theBoxes.get(c);
        bx.drawBox();
      }
      needsDrawed = false;
    }
  }

  public void updateBoard() {
    for (int c=0; c<theBoxes.size(); c++) {
      Box bx = (Box)theBoxes.get(c);
      bx.calcState();
    }
    for (int c=0; c<theBoxes.size(); c++) {
      Box bx = (Box)theBoxes.get(c);
      bx.updateState();
    }
    needsDrawed = true;
  }

  private void addNeighbors(Box bx) {
    int x = bx.getX();
    int y = bx.getY();

    bx.clearNeighbors();

    Box BN, BS, BW, BE;
    BN = BS = BW = BE = null;

    if ((y-1)>=0) {
      int BI = theBoard[y-1][x];
      if (BI >= 0) {
        BN = (Box)theBoxes.get(BI);
        bx.addNeighbor(BN);
      }
    }

    if ((y+1)<dim) {
      int BI = theBoard[y+1][x];
      if (BI >= 0) {
        BS = (Box)theBoxes.get(BI);
        bx.addNeighbor(BS);
      }
    }

    if ((x-1)>=0) {
      int BI = theBoard[y][x-1];
      if (BI >= 0) {
        BW = (Box)theBoxes.get(BI);
        bx.addNeighbor(BW);
      }
    }

    if ((x+1)<dim) {
      int BI = theBoard[y][x+1];
      if (BI >= 0) {
        BE = (Box)theBoxes.get(BI);
        bx.addNeighbor(BE);
      }
    }
  }

  public void mPressed() {
    int i = (int)(mouseY/boxDim);
    int j = (int)(mouseX/boxDim);

    if (theBoard[i][j] > -1) {
      isDragging = true;
      movingBox = (Box)theBoxes.get(theBoard[i][j]);
      movingBox.mPressed();
    }
    needsDrawed = true;
  }

  public void mReleased() {
    if ((isDragging)&&(movingBox != null)) {
      int bInd = theBoard[movingBox.getY()][movingBox.getX()];
      theBoard[movingBox.getY()][movingBox.getX()] = -1;
      movingBox.mReleased(isEmpty((int)(mouseX/boxDim), (int)(mouseY/boxDim)));
      theBoard[movingBox.getY()][movingBox.getX()] = bInd;
      for (int c=0; c<theBoxes.size(); c++) {
        this.addNeighbors((Box)theBoxes.get(c));
      }
      //movingBox.printNeighbors();
      isDragging = false;
      movingBox = null;
    }

    needsDrawed = true;
  }

  private boolean isEmpty(int x, int y) {
    if ((x<dim)&&(x>=0)&&(y<dim)&&(y>=0)) {
      return (theBoard[y][x] == -1);
    }
    else {
      return false;
    }
  }

  private int getBoxInd(int x, int y) {
    if ((x<dim)&&(x>=0)&&(y<dim)&&(y>=0)) {
      return theBoard[y][x];
    }
    else {
      return -1;
    }
  }
}


class Box {
  private boolean isMoving;
  private int x, y;  // this in position, not pixels
  private int dim;  // in pixels
  private int bColor;
  private int state;  // 0 = off, 1=hit, 2=decay
  private int nextState;
  private ArrayList neighbors;

  private long lastUp;
  private int period;


  public Box(int x_, int y_, int dim_) {
    x = x_;
    y = y_;
    dim = dim_;
    isMoving = false;
    bColor = #cc0000;
    state = 0;
    nextState = state;
    neighbors = new ArrayList();
    period = (int)random(300, 1300);
    lastUp = millis();
  }

  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }

  public void addNeighbor(Box n) {
    neighbors.add(n);
  }

  public void printNeighbors() {
    println("///////");
    for (int c = 0; c<neighbors.size(); c++) {
      println(neighbors.get(c));
    }
  }

  public void clearNeighbors() {
    neighbors.clear();
  }


  public void calcState() {
    int numHits = 0;
    int numDecs = 0;

    for (int c=0; c<neighbors.size(); c++) {
      Box b = (Box)neighbors.get(c);
      if (b.getState() == 1) {
        numHits++;
      }
      if (b.getState() == 2) {
        numDecs++;
      }
    }

    if (state == 0) {
      if ((numHits == 1)||(numHits == 2)) {
        nextState = 1;
      }
      else if ((numDecs > 2)) {
        nextState = 2;
      }
    }
    else if (state == 1) {
        nextState = 2;
    }
    else if (state == 2) {
      if (neighbors.size() == 4) {
        nextState = 1;
      }
      else {
        nextState = 0;
      }
    }
  }

  public void updateState() {
    state = nextState;
  }

  private color getColor() {
    return color(bColor);
  }

  private int getState() {
    return state;
  }

  public void drawBox() {
    stroke(0);
    if (state == 0) {
      fill(lerpColor(0, bColor, 0.8));
    }
    else if (state == 1) {
      fill(255);
    }
    else {
      fill(color(bColor));
    }
    if (isMoving) {
      rect(mouseX-dim/2, mouseY-dim/2, dim, dim);
    }
    else {
      rect(x*dim, y*dim, dim, dim);
    }
  }

  public void mPressed() {
    isMoving = true;
  }

  public void mReleased(boolean onTopOfEmpty) {
    // if didn't move, just click
    if (((int)(mouseX/dim) == x) && ((int)(mouseY/dim) == y)) {
      this.wasClicked();
    }
    else if (onTopOfEmpty == true) {
      x = (int)(mouseX/dim);
      y = (int)(mouseY/dim);
    }

    isMoving = false;
  }


  private void wasClicked() {
    //bColor = color(random(0, 255), random(0, 255), random(0, 255));
    state = 1;
  }
}
                                                                                                                                                

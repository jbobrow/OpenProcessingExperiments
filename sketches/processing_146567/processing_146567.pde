
class World {

  int w;
  int h;
  int step;

  int agentX;
  int agentY;
  int agentDir;

  float s;

  int[][] cells;

  World(int w, int h) {
    this.w        = w;
    this.h        = h;
    this.step     = 0;
    this.cells    = new int[w][h];
    this.s        = 1.0*width/w;
    this.agentX   = w/2;
    this.agentY   = h/2;
    this.agentDir = DOWN;
    for (int i=0; i<w; i++) {
      for (int j=0; j<w; j++) {
        cells[i][j] = 1;
      }
    }
  }

  void update() {

    //turn left or right depending on color
    if (cells[agentX][agentY]==0) {
      switch(agentDir) {
      case LEFT:
        agentDir = DOWN;
        break;
      case DOWN:
        agentDir = RIGHT;
        break;
      case RIGHT:
        agentDir = UP;
        break;
      case UP:
        agentDir = LEFT;
        break;
      }
    }

    if (cells[agentX][agentY]==1) {
      switch(agentDir) {
      case LEFT:
        agentDir = UP;
        break;
      case UP:
        agentDir = RIGHT;
        break;
      case RIGHT:
        agentDir = DOWN;
        break;
      case DOWN:
        agentDir = LEFT;
        break;
      }
    }
    
    //switch color
    if (cells[agentX][agentY]==0) { 
      cells[agentX][agentY]=1;
    }
    else if (cells[agentX][agentY]==1) { 
      cells[agentX][agentY]=0;
    }

    //move
    switch(agentDir) {
    case LEFT:
      agentX--;
      break;
    case UP:
      agentY--;
      break;
    case RIGHT:
      agentX++;
      break;
    case DOWN:
      agentY++;
      break;
    }
    step++;
  }

  void draw() {
    strokeWeight(1);
    stroke(100,30);
    noStroke();
    rectMode(CORNER);
    for (int i=0; i<w; i++) {
      for (int j=0; j<w; j++) {
        fill(cells[i][j]*255);
        rect(i*s, (h-j-1)*s, s, s);
      }
    }
    strokeWeight(3);
    stroke(100);
    noFill();
    rect(agentX*s, (h-agentY-1)*s, s, s);
  }
}


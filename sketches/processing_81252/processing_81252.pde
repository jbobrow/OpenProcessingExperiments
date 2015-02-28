
class Cell {  
  //ints to draw cell
  int x;
  int y;
  int w;
  int h;
  //cell state
  boolean visited;

  Cell(int xPos, int yPos, int wide, int high, boolean cellState) {
    //initial state of Cell is visited = false
    x = xPos;
    y = yPos;
    w = wide;
    h = high;
    visited = cellState;
    rectMode(CORNER);
  }

  // a means of setting visited to true
  void trackVisited(int playerX, int playerY) {
    if (playerX > x && playerX < x+w && playerY > y && playerY < y+h) {
      visited = true;
    }
  }

  void reset() {
  }
  void display() {
    if (level%2 != 0) {
      if (visited) {
        stroke(0);
        fill(255);
      }
      if (!visited) {
        stroke(255);
        fill(0);
      }
    }
    else {
      if (visited) {
        stroke(255);
        fill(0);
      }
      if (!visited) {
        stroke(0);
        fill(255);
      }
    }
    strokeWeight(2);
    rect(x, y, w, h);
  }
}



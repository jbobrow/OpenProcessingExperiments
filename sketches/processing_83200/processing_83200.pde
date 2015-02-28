
class Cell {  
  //ints to draw cell
  int x;
  int y;
  int s;
  //cell state
  boolean visited;

  Cell(int xPos, int yPos, int side, boolean cellState) {
    //initial state of Cell is visited = false
    x = xPos;
    y = yPos;
    s = side;
    visited = cellState;
    rectMode(CORNER);
    strokeWeight(2);
  }

  // a means of setting visited to true
  void trackVisited(int playerX, int playerY) {
    if (playerX-10 == x && playerY-10 == y) {
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
    rect(x, y, s, s);
  }
}



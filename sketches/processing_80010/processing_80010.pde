
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

  void reset(){
    
  }
  void display() {
    if (visited) {
      fill(255);
      // println("cell visited");
    }
    if (!visited) {
      fill(0);
    }
    strokeWeight(2);
    stroke(255, 10, 100);
    rect(x, y, w, h);
  }
}



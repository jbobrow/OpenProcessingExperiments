
Cell[][] cells;
Grid grid;
static int score;
void setup() {
  size(600, 600);
  background(255);
  textSize(30);
  fill(255, 0, 0);
  text("Press 'r' to reset game", 150, 560);
  textSize(70);
  text("2048", 40, 70);
  cells = new Cell[4][4];
  grid = new Grid();
  score = 0;
  grid.spawn();
  grid.spawn();
}

void draw() {
  //redraws the grid
  fill(205, 193, 197);
  rect(100, 100, 400, 400);
  for (int i = 100; i<=500; i+=100) {
    smooth();
    strokeWeight(3);
    line(100, i, 500, i);
    line(i, 100, i, 500);
  }
  fill(255);
  strokeWeight(2);
  rect(430, 20, 130, 30);
  fill(0);
  textSize(25);
  text("Score: " + score, 350, 45);

  //draws the cells that have a numeric value
  for (Cell c : grid.getOccupiedCells (true)) {
    c.drawTile();
    //checks if player won
    println("R: " + c.row + " C: " + c.col + " " + c.merge);
    if (c.number == 2048) {
      fill(0, 255, 255);
      textSize(100);
      text("YOU WIN", 80, 300);
    }
  }

  //moves tiles when arrow key is pressed and grid is not full
  if (grid.getOccupiedCells(true).size() <= 16 && (keyCode == UP || keyCode == DOWN|| keyCode == LEFT || keyCode == RIGHT) ) {
    grid.moveTiles();
  }

  //checks if player lost
  if (grid.getOccupiedCells(true).size() >= 16) {
    if (grid.checkLose()) {
      fill(0, 255, 255);
      textSize(100);
      text("YOU LOSE", 60, 300);
    }
  }

}

public class Grid {
  int startCoor = 100;
  int endCoor = 500;
  int loop = 0;
  boolean canSpawn = false;

  public Grid() {
    //draws the boundary and lines of the grid
    rect(startCoor, startCoor, 400, 400);
    for (int i = startCoor; i<=endCoor; i+=100) {
      smooth();
      strokeWeight(3);
      line(startCoor, i, endCoor, i);
      line(i, startCoor, i, endCoor);
    }
    //creates the 4x4 grid of cell objects
    int x = startCoor;
    int y = startCoor;
    for (int r = 0; r<cells.length; r++) {
      for (int c = 0; c<cells[0].length; c++) {
        cells[r][c] = new Cell(x, y, r, c);
        x += 100;
      }
      y += 100;
      x = startCoor;
    }
  }

  
  //gets the cells that have a numeric value either from bottom-up or up-bottom
  public ArrayList<Cell> getOccupiedCells(boolean botToUp) {
    ArrayList<Cell> cList = new ArrayList<Cell>();
    if (botToUp) {
      for (int r = cells.length-1; r>=0; r--) {
        for (int c = cells[0].length-1; c>=0; c--) {
          if (cells[r][c].hasNumber) {
            cList.add(cells[r][c]);
          }
        }
      }
    } else {
      for (int r = 0; r<cells.length; r++) {
        for (int c =0; c<cells[0].length; c++) {
          if (cells[r][c].hasNumber) {
            cList.add(cells[r][c]);
          }
        }
      }
    }
    return cList;
  }
  

  //adds a 2 or 4 tile to the grid
  public void spawn() {
    int i = 0;
    while (i < 1) {
      int r = (int)random(0, 4);
      int c = (int)random(0, 4);
      if (!cells[r][c].hasNumber) {
        cells[r][c].hasNumber = true;
        cells[r][c].number *= (int)random(0, 2) + 1;
        i++;
      }
    }
  }
  
  //moves the tiles based on arrow keys
  public void moveTiles() {
    if ((keyCode == UP || keyCode == LEFT)) {
      if (loop < 10 && keyCode != 0) {
        for (Cell c : getOccupiedCells (false)) {
          if (keyCode == UP  && c.yCoor > 100 && c.row !=0) {//checks if key and new position of tile is valid
            if (!cells[c.row-1][c.col].hasNumber) {//moves tile if cell above it has no numeric value
              c.yCoor -= 100;
              if (c.yCoor%100 == 0) {//position of tile is changed when tile moves to another cell location
                c.changeCell(c.row-1, c.col);
              }
              canSpawn = true;
            } else if (c.yCoor%100 == 0 && cells[c.row-1][c.col].number == c.number && c.merge) {//merges tile if tile above it has the same number
              c.merge = false;
              cells[c.row-1][c.col].merge = false;
              c.yCoor -= 100;
              c.number *= 2;
              score += c.number;
              c.changeCell(c.row-1, c.col);
              canSpawn = true;
            }
          } else if (keyCode == LEFT && c.xCoor > 100 && c.col !=0) {
            if (!cells[c.row][c.col-1].hasNumber) {
              c.xCoor -= 100;
              if (c.xCoor%100 == 0) {
                c.changeCell(c.row, c.col-1);
              }
              canSpawn = true;
            } else if (c.xCoor%100 == 0 && cells[c.row][c.col-1].number == c.number && c.merge) {
              c.merge = false;
              cells[c.row][c.col-1].merge = false;
              c.xCoor -= 100;
              c.number *= 2;
              score += c.number;
              c.changeCell(c.row, c.col-1);
              canSpawn = true;
            }
          }
        }
      } else {//resets loop, keyCode, cell's merge state, and spawns a tile
        loop = -1;
        keyCode = 0;
        for (Cell c : getOccupiedCells (false)) {
          c.merge = true;
        }
        if (getOccupiedCells(false).size() < 16 && canSpawn) {
          grid.spawn();
        }
        canSpawn = false;
      }
      loop++;
    } else if ((keyCode == RIGHT || keyCode == DOWN)) {
      if (loop < 10 && keyCode != 0) {
        for (Cell c : getOccupiedCells (true)) { 
          if (keyCode == RIGHT && c.xCoor < 400 && c.col !=3) {
            if (!cells[c.row][c.col+1].hasNumber) {
              c.xCoor += 100;
              if (c.xCoor%100 == 0) {
                c.changeCell(c.row, c.col+1);
              }
              canSpawn = true;
            } else if (c.xCoor%100 == 0 && cells[c.row][c.col+1].number == c.number && c.merge) {
              c.merge = false;
              cells[c.row][c.col+1].merge = false;
              c.xCoor += 100;
              c.number *= 2;
              score += c.number;
              c.changeCell(c.row, c.col+1);
              canSpawn = true;
            }
          } else if (keyCode == DOWN && c.yCoor < 400 && c.row != 3) {
            if (!cells[c.row+1][c.col].hasNumber) {
              c.yCoor += 100;
              if (c.yCoor%100 == 0) {
                c.changeCell(c.row+1, c.col);
              }
              canSpawn = true;
            } else if (c.yCoor%100 == 0 && cells[c.row+1][c.col].number == c.number && c.merge) {
              c.merge = false;
              cells[c.row+1][c.col].merge = false;
              c.yCoor += 100;
              c.number *= 2;
              score += c.number;
              c.changeCell(c.row+1, c.col);
              canSpawn = true;
            }
          }
        }
      } else {
        loop = -1;
        keyCode = 0;
        for (Cell c : getOccupiedCells (true)) {
          c.merge = true;
        }
        if (getOccupiedCells(true).size() < 16 && canSpawn) {
          grid.spawn();
        }
        canSpawn = false;
      }
      loop++;
    }
  }


  //checks if cell can still merge/move
  public boolean checkLoseHelper(int rp, int cp) {
    if (getOccupiedCells(true).size() >= 16) {
      for (int r = rp- 1; r <= rp + 1; r++) {
        for (int c = cp - 1; c <= cp + 1; c++) {
          if (r>=0 && r<=3 && c>=0 && c<=3  && (rp != r || cp != c) && (rp == r || cp == c)) {
            if (cells[rp][cp].number == cells[r][c].number) {
              return false;
            }
          }
        }
      }
      return true;
    }
    return false;
  }

  //if cell can still move/merge, player hasn't lost yet
  public boolean checkLose() {
    for (int r = 0; r<cells.length; r++) {
      for (int c = 0; c<cells[0].length; c++) {
        if (!grid.checkLoseHelper(r, c)) {
          return false;
        }
      }
    }
    return true;
  }
}

public class Cell {

  boolean hasNumber = false;
  int number;
  int xCoor, yCoor, row, col;
  boolean merge = true;

  public Cell(int x, int y, int r, int c) {
    number = 2;
    xCoor = x;
    yCoor = y;
    row = r;
    col = c;
  }

  //updates the position of a cell when cell is moving
  public void changeCell(int r, int c) {
    cells[r][c].merge = this.merge;
    this.hasNumber = false;
    if (this.row == r) {
      this.xCoor -= 100 * (c-this.col);
    } else if (this.col == c) {
      this.yCoor -= 100 * (r-this.row);
    }
    cells[r][c].number = this.number;
    this.number = 2;
    cells[r][c].hasNumber = true;
  }

  //tile is drawn based on its numeric value
  public void drawTile() {
    if (number < 9) {
      fill(40*number+30, number*5, number*25);
      rect(xCoor, yCoor, 100, 100);
      textSize(45);
      fill(255);
      text("" + number, xCoor+35, yCoor+65);
    } else if (number < 128) {
      fill(number%7*35, 0, number/7*7);
      rect(xCoor, yCoor, 100, 100);
      textSize(45);
      fill(255);
      text("" + number, xCoor+25, yCoor+65);
    } else if (number < 1024) {
      fill((number%6+25)*6, number/30, number%10*35);
      rect(xCoor, yCoor, 100, 100);
      textSize(40);
      fill(255);
      text("" + number, xCoor+15, yCoor+65);
    } else {
      fill(number%10*25, 60, 180);
      rect(xCoor, yCoor, 100, 100);
      textSize(35);
      fill(255);
      text("" + number, xCoor+5, yCoor+65);
    }
  }
}


//resets game is r is pressed
void keyPressed() {
  if (key == 'r') {
    setup();
  }
}


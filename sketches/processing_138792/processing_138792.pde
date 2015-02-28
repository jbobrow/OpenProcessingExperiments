
Life life;
int something = 0;
boolean going = false;
void setup() {

  size(400, 400);
  life = new Life(50);
  //  life.setupGrid();
}

void draw() {
  background(255);
  life.displayGrid();
  life.display();
  life.clickLife();
  if (something == 2 && going) life.nextGen();
  something = (something + 1) % 3;
}

void keyPressed() {
  if (key == 'g') going = true;
  if (key == 'p') going = false; 
  if (key == 'r') life.reset();
  if (key == 's') life.setupGrid();
  if (key == '1') life.pat1();
  if (key == '2') life.pat2();
  if (key == '3') life.pat3();
  if (key == '4') life.pat4();
  if (key == '5') life.pat5();
  if (key == '6') life.pat6();
  if (key == '7') life.pat7();
}

class Life {

  int gridSize;
  boolean[][] grid;
  float gridWid;

  Life(int size) {
    gridSize = size;
    grid = new boolean[gridSize][gridSize];
    gridWid = width/gridSize;
  }

  public void setupGrid() {
    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        int rand = int(random(0, 2));
        if (rand == 0) grid[i][j] = true;
        else grid[i][j] = false;
      }
    }
  }

  public void displayGrid() {
    strokeWeight(0);
    stroke(0);
    for (int i = 0; i < gridSize; i++) {
      float helper = i * gridWid;
      line(helper, 0, helper, height);
      line(0, helper, width, helper);
    }
  }

  public void display() {
    noStroke();
    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        float xVal = i * gridWid;
        float yVal = j * gridWid;
        fill(0);
        if (grid[i][j]) rect(xVal, yVal, gridWid, gridWid);
      }
    }
  }

  public void nextGen() {

    boolean[][] newGrid = new boolean[gridSize][gridSize];
    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        if (!grid[i][j] && countNeighbors(i, j) == 3) newGrid[i][j] = true;
        if (grid[i][j] && (countNeighbors(i, j) < 2 || countNeighbors(i, j) > 3) ) newGrid[i][j] = false;
        if (grid[i][j] && (countNeighbors(i, j) == 2 || countNeighbors(i, j) ==  3)) newGrid[i][j] = true;
      }
    }

    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {

        grid[i][j] = newGrid[i][j];
      }
    }
  }

  public boolean isValidLoc(int r, int c) {

    return (r>= 0) && (c>=0) && (r <=(gridSize-1)) && (c <= (gridSize-1));
  }

  public int countNeighbors(int r, int c) {

    int num = 0;
    for (int i = -1; i < 2; i++) {
      for (int j = -1; j < 2; j++) {

        if (!(i == 0 && j == 0)) {
          if (isValidLoc(i + r, j + c) && grid[i + r][j + c]) num++;
        }
      }
    }
    return num;
  }

  public void clickLife() {
    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        if (mousePressed && mouseButton == LEFT && mouseX >= i*gridWid && mouseX <= (i+1)*gridWid && mouseY >= j*gridWid && mouseY <= (j+1) * gridWid) grid[i][j] = true;
        if (mousePressed && mouseButton == RIGHT && mouseX >= i*gridWid && mouseX <= (i+1)*gridWid && mouseY >= j*gridWid && mouseY <= (j+1) * gridWid) grid[i][j] = false;
      }
    }
  }

  public void reset() {
    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        grid[i][j] = false;
      }
    }
  }

  public void pat1() {
    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        if (i == 0 ||i == gridSize-1 || j == 0 || j == gridSize-1) grid[i][j] = true;
      }
    }
  }

  public void pat2() {
    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        if (i == j|| i == gridSize-j-1) grid[i][j] = true;
      }
    }
  }

  public void pat3() {
    pat2();
    pat1();
  }

  public void pat4() {
    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        if (i%2 == 0) grid[i][j] = true;
      }
    }
  }

  public void pat5() {
    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        if (j%2 == 0) grid[i][j] = true;
      }
    }
  }

  public void pat6() {
    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        if (i%2 == 0 && j%2 == 0) grid[i][j] = true;
        if (i%2 == 1 && j%2 == 1) grid[i][j] = true;
      }
    }
  }
  public void pat7() {
    int x = 0;
    while ( x < gridSize) {
      int y = int(pow(1.1, x));
      if (isValidLoc(x, y)) grid[x][y] = true;
      x++;
    }
  }
}




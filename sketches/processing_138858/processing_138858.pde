
Life life;
int something = 0;
boolean going = false;

void setup() {

  size(400, 400);
  life = new Life(50);
  life.setupLife();
  colorMode(HSB);
}

void draw() {
  background(255);
  life.display();
  life.displayGrid();
  life.clickLife();
  life.colorChanger();
}

void keyPressed() {

  if (key == 'r') life.reset();
}

class Life {

  int gridSize;
  boolean[][] grid;
  color[][] col;
  float gridWid;
  color c = color(255, 0, 0);

  Life(int size) {

    gridSize = size;
    grid = new boolean[gridSize][gridSize];
    col = new color[gridSize][gridSize];
    gridWid = width/(gridSize);
  }


  public void displayGrid() {

    strokeWeight(0);
    stroke(0);
    for (int i = 0; i < gridSize-10; i++) {
      float helper = i * gridWid;
      line(helper, 0, helper, gridWid*(gridSize-11));
      line(0, helper, gridWid*(gridSize-11), helper);
    }
  }

  public void setupLife() {

    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        col[i][j] = color(255, 255, 255);
      }
    }
  }

  public void display() {

    noStroke();
    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        float xVal = i * gridWid;
        float yVal = j * gridWid;
        fill(col[i][j]);
        if (grid[i][j]) rect(xVal, yVal, gridWid, gridWid);
      }
    }
  }

  public void clickLife() {

    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        if (mousePressed && mouseButton == LEFT && mouseX >= i*gridWid && mouseX <= (i+1)*gridWid && mouseX < (gridSize-11)*gridWid && mouseY >= j*gridWid && mouseY <= (j+1) * gridWid && mouseY < (gridSize-11)*gridWid) {
          grid[i][j] = true;
          col[i][j] = c;
        }
        if (mousePressed && mouseButton == RIGHT && mouseX >= i*gridWid && mouseX <= (i+1)*gridWid && mouseY >= j*gridWid && mouseY <= (j+1) * gridWid) grid[i][j] = false;
      }
    }
  }

  public void reset() {

    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        grid[i][j] = false;
        col[i][j] = color(255, 255, 255);
      }
    }
  }

  public void colorChanger() {
    fill(c);
    stroke(0);
    strokeWeight(1);
    rect(360, 10, 30, 255);
    if (mouseX >= 360 && mouseX <= 390 && mouseY >= 10 && mouseY <= 265 && mousePressed) c = color(mouseY-10, 255, 255);
  }
}




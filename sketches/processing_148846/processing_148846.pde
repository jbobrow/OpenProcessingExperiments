
boolean paused = false;
int cellSize = 5;
int maxNumberOfNeighbours = 3,
    minNumberOfNeighbours = 2,
    optimalNumberOfNeighbours = 3,
    range = 1;
Grid grid;

void setup() {
  size(500, 500);
  frameRate(4);
  colorMode(RGB, 1);
  noStroke();
  grid = new Grid(cellSize);
}

void draw() {
  if(!paused) {
    grid.update();
    grid.draw();
  }
}

void keyPressed() {
  switch(key) {
    case ' ':
      paused = !paused;
      break;
    case 'q':
      minNumberOfNeighbours = min(minNumberOfNeighbours + 1, maxNumberOfNeighbours);
      println("minNumberOfNeighbours: " + minNumberOfNeighbours);
      break;
    case 'a':
      minNumberOfNeighbours --;
      println("minNumberOfNeighbours: " + minNumberOfNeighbours);
      break;
    case 'w':
      maxNumberOfNeighbours ++;
      println("maxNumberOfNeighbours: " + maxNumberOfNeighbours);
      break;
    case 's':
      maxNumberOfNeighbours = max(maxNumberOfNeighbours - 1, minNumberOfNeighbours);
      println("maxNumberOfNeighbours: " + maxNumberOfNeighbours);
      break;
    case 'r':
      grid = new Grid(cellSize);
      break;
    case '-':
      range = max(0, range - 1);
      break;
    case '+':
      range ++;
      println("range: " + range);
      break;
    case '0': case '1': case '2': case '3': case '4': case '5': case '6': case '7': case '8': case '9':
      optimalNumberOfNeighbours = int(key - 48);
      println("optimalNumberOfNeighbours: " + optimalNumberOfNeighbours);
  }
}

class Cell {
  public color cellColor;
  int cellSize;
  public Cell(int size) {
    cellColor = color(randomColorComponent(), randomColorComponent(), randomColorComponent());
    cellSize = size;
  }
  public void update(int[] colourNeighbours) {
    int redNeighbours = colourNeighbours[0],
        greenNeighbours = colourNeighbours[1],
        blueNeighbours = colourNeighbours[2];
    float redComponent = red(cellColor),
        greenComponent = green(cellColor),
        blueComponent = blue(cellColor);
    redComponent = applyRules(redComponent, redNeighbours);
    greenComponent = applyRules(greenComponent, greenNeighbours);
    blueComponent = applyRules(blueComponent, blueNeighbours);
    cellColor = color(redComponent, greenComponent, blueComponent);
  }
  public void draw() {
    fill(cellColor);
    rect(0, 0, cellSize, cellSize);
  }
  private float applyRules(float colorComponent, int numberOfNeighbours) {
    if(colorComponent == 0 && numberOfNeighbours == optimalNumberOfNeighbours ||
       colorComponent == 1 && numberOfNeighbours >= minNumberOfNeighbours && numberOfNeighbours <= maxNumberOfNeighbours) {
       return 1;
    }
    else {
      return 0;
    }
  }
  private int randomColorComponent() {
    return int(random(1) < 0.15);
  }
}

class Grid {
  Cell[][] cells;
  int cellSize, columns, rows;
  public Grid(int cellSize) {
    this.cellSize = cellSize;
    columns = width/cellSize;
    rows = height/cellSize;
    cells = new Cell[rows][columns];
    for(int row = 0; row < rows; row++) {
      for(int column = 0; column < columns; column++) {
        cells[row][column] = new Cell(cellSize);
      }
    }
  }
  public void draw() {
    for(int row = 0; row < rows; row++) {
      pushMatrix();
      for(int column = 0; column < columns; column++) {
        cells[row][column].draw();
        translate(cellSize, 0);
      }
      popMatrix();
      translate(0, cellSize);
    }
  }
  public void update() {
    for(int row = 0; row < rows; row++) {
      for(int column = 0; column < columns; column++) {
        int[] colourNeighbours = getColourNeighbours(row, column);
        cells[row][column].update(colourNeighbours);
      }
    }
  }
  private int[] getColourNeighbours(int i, int j) {
    int redNeighbours = 0,
        greenNeighbours = 0,
        blueNeighbours = 0;
    for(int row = max(i - range, 0); row <= min(i + 1, rows - 1); row++) {
      for(int column = max(j - range, 0); column <= min(j + 1, columns - 1); column++) {
        Cell cell = cells[row][column];
        color cellColor = cell.cellColor;
        redNeighbours += red(cellColor);
        greenNeighbours += green(cellColor);
        blueNeighbours += blue(cellColor);
      }
    }
    int[] neighbours = { redNeighbours, greenNeighbours, blueNeighbours };
    return neighbours;
  }
}





int speed = 500;
int speedInc = 25;
color bgc = 255;
int cells = 10;
int[][] grid = new int[cells][cells];
long lastUpdate;

int snakePosX = 2;
int snakePosY = 2;
int snakeMov = RIGHT;
int snakeLastMov = snakeMov;
int snakeLength = 3;

int botBorder = 50;
int gridLength = 450 / cells;
int snakeBorder = 3;
int foodBorder = 6;
int snakeWidth = gridLength - (2 * snakeBorder);
boolean gameOver = false;

void setup() {
  size(450, 500);
  noStroke();
  textSize(32);
  textAlign(LEFT, CENTER);

  grid[snakePosX - 2][snakePosY] = 1;
  grid[snakePosX - 1][snakePosY] = 2;
  grid[snakePosX][snakePosY] = 3;
  placeFood();

  drawGrid();
}

void draw() {
  if (!gameOver) {
    long currentTime = millis();
    if (lastUpdate + speed < currentTime) {
      update();
      drawGrid();
      lastUpdate = currentTime;
    }
  }
}

void keyPressed() {
  if ((keyCode == RIGHT || keyCode == LEFT
    || keyCode == UP || keyCode == DOWN) 
    && !(snakeLastMov == RIGHT && keyCode == LEFT)
    && !(snakeLastMov == LEFT && keyCode == RIGHT)
    && !(snakeLastMov == UP && keyCode == DOWN)
    && !(snakeLastMov == DOWN && keyCode == UP)) {
    snakeMov = keyCode;
  }
}

void update() {
  if (snakeMov == RIGHT) {
    snakePosX++;
    snakePosX %= cells;
  } 
  else if (snakeMov == LEFT) {
    snakePosX--;

    if (snakePosX < 0) {
      snakePosX = cells - 1;
    }
  } 
  else if (snakeMov == UP) {
    snakePosY--;
    if (snakePosY < 0) {
      snakePosY = cells - 1;
    }
  } 
  else if (snakeMov == DOWN) {
    snakePosY++;
    snakePosY %= cells;
  }  

  snakeLastMov = snakeMov;

  if (grid[snakePosX][snakePosY] > 1) {
    gameOver = true;
    bgc = #FF0000;
    return;
  }

  if (grid[snakePosX][snakePosY] < 0) {
    placeFood();
    snakeLength++;
    speed = max(100, speed - speedInc);
  } 
  else {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[0].length; j++) {
        if (grid[i][j] > 0) {
          grid[i][j]--;
        }
      }
    }
  }

  grid[snakePosX][snakePosY] = snakeLength;
}

void placeFood() {
  int randomX = (int)random(cells);
  int randomY = (int)random(cells);

  if (grid[randomX][randomY] == 0) {
    grid[randomX][randomY] = -1;
  } 
  else {
    placeFood();
  }
}

void drawGrid() {
  background(bgc);

  fill(0);
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      int cell = grid[i][j];
      if (cell > 0) {
        rect((i * gridLength) + snakeBorder, (j * gridLength) + snakeBorder, snakeWidth, snakeWidth);

        if (i > 0 && (grid[i - 1][j] == cell + 1 || (cell > 1 && grid[i - 1][j] == cell - 1))) {
          rect(i * gridLength, (j * gridLength) + snakeBorder, snakeBorder, snakeWidth);
        }
        
        if (i < cells - 1 && (grid[i + 1][j] == cell + 1 || (cell > 1 && grid[i + 1][j] == cell - 1))) {
          rect(((i + 1) * gridLength) - snakeBorder, (j * gridLength) + snakeBorder, snakeBorder, snakeWidth);
        }
        
        if (j > 0 && (grid[i][j - 1] == cell + 1 || (cell > 1 && grid[i][j - 1] == cell - 1))) {
          rect((i * gridLength) + snakeBorder, j * gridLength, snakeWidth, snakeBorder);
        }
        
        if (j < cells - 1 && (grid[i][j + 1] == cell + 1 || (cell > 1 && grid[i][j + 1] == cell - 1))) {
          rect((i * gridLength) + snakeBorder, ((j + 1) * gridLength) - snakeBorder, snakeWidth, snakeBorder);
        }
      } 
      else if (cell < 0) {
        ellipse((i * gridLength) + (gridLength / 2), (j * gridLength) + (gridLength / 2), gridLength - foodBorder, gridLength - foodBorder);
      }
    }
  }

  fill(100);
  rect(0, height - botBorder, width, botBorder);
  fill(255);
  text(snakeLength - 2, 5, height - botBorder / 2);

  if (gameOver) {
    textAlign(CENTER, CENTER);
    text("GAME OVER", width / 2, height - botBorder / 2);
  }
}




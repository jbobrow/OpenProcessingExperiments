
int WIDTH = 400;
int HEIGHT = 400;
int WIDTH_DIVISOR = 20;
int HEIGHT_DIVISOR = 20;
int CELL_WIDTH = WIDTH/WIDTH_DIVISOR;
int CELL_HEIGHT = HEIGHT/HEIGHT_DIVISOR;
int N_CELLS = WIDTH_DIVISOR*HEIGHT_DIVISOR;
int INIT_LENGTH = 1;
int DIRECTION = floor(random(4));
int CURRENT_FOOD;
IntList snake = new IntList();
IntList grid = new IntList();
PImage goblin;

void setup() {
  goblin = loadImage("tom1.jpg");
  size(400, 400);
  background(0, 0, 255);
  frameRate(10);
  fill(0);
  stroke(255);
  noLoop();
  makeGrid();
  makeSnake();
  drawSnake();
  food();
}

void draw() {
  background(0, 0, 255);
  checkCollision();
  updateSnake();
  drawSnake();
  drawFood();
}

void makeGrid() {
  for (int i = 0; i < N_CELLS; i++) {
    grid.append(i);
  }
}

void makeSnake() {
  int start = floor(random(N_CELLS));
  snake.append(start);
}

void drawSnake() {
  noStroke();
  for (int i = 0; i < snake.size(); i++) {
    rect((snake.get(i)%CELL_WIDTH)*CELL_WIDTH, (snake.get(i)/CELL_HEIGHT)*CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT);
  }
  image(goblin, (snake.get(snake.size())%CELL_WIDTH)*CELL_WIDTH, (snake.get(snake.size())/CELL_HEIGHT)*CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT);
}

void checkCollision() {
  for (int i = 0; i < snake.size()-2; i++) {
    if (snake.size() > 2 && snake.get(snake.size()-1) == snake.get(i)) {
      background(255, 0, 0);
      noLoop();
      break;
    }
  }
}

void updateSnake() {
  if (DIRECTION == 0) {
    if (snake.get(snake.size()-1) < WIDTH_DIVISOR) {
      snake.append(snake.get(snake.size()-1) + N_CELLS-WIDTH_DIVISOR);
    } 
    else {
      snake.append(snake.get(snake.size()-1) - WIDTH_DIVISOR);
    }
  }
  if (DIRECTION == 2) {
    if (snake.get(snake.size()-1) >= N_CELLS-WIDTH_DIVISOR) {
      snake.append(snake.get(snake.size()-1) - N_CELLS + WIDTH_DIVISOR);
    } 
    else {
      snake.append(snake.get(snake.size()-1)+WIDTH_DIVISOR);
    }
  }
  if (DIRECTION == 1) {
    if (snake.get(snake.size()-1)%WIDTH_DIVISOR == WIDTH_DIVISOR-1) {
      snake.append(snake.get(snake.size()-1)-WIDTH_DIVISOR+1);
    } 
    else {
      snake.append(snake.get(snake.size()-1)+1);
    }
  }
  if (DIRECTION == 3) {
    if (snake.get(snake.size()-1)%WIDTH_DIVISOR == 0) {
      snake.append(snake.get(snake.size()-1)+WIDTH_DIVISOR-1);
    } 
    else {
      snake.append(snake.get(snake.size()-1)-1);
    }
  }
  if (snake.get(snake.size()-1) == CURRENT_FOOD) {
    food();
  } 
  else {
    snake.remove(0);
  }
}

void keyPressed() {
  loop();
  if (key == CODED) {
    if (keyCode == UP) {
      if (DIRECTION != 2) {
        DIRECTION = 0;
      }
    } 
    else if (keyCode == DOWN) {
      if (DIRECTION != 0) {
        DIRECTION = 2;
      }
    } 
    else if (keyCode == LEFT) {
      if (DIRECTION != 1) {
        DIRECTION = 3;
      }
    } 
    else if (keyCode == RIGHT) {
      if (DIRECTION != 3) {
        DIRECTION = 1;
      }
    }
  }
}

void food() {
  int thisCell = floor(random(N_CELLS));
  if (snake.hasValue(thisCell)) {
    food();
  }
  else {
    drawFood();
    CURRENT_FOOD = thisCell;
  }
}

void drawFood() {
  fill(0, 255, 0);
  noStroke();
  rect((CURRENT_FOOD%CELL_WIDTH)*CELL_WIDTH, (CURRENT_FOOD/CELL_HEIGHT)*CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT);
  fill(0);
  stroke(255);
}




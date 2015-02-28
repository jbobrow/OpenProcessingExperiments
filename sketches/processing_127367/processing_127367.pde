
/*
  NOTES:
 Added checkGameOver
 
 */

ArrayList<SnakePart> snake = new ArrayList<SnakePart>();
char direction;
SnakeFood food;
int GRIDSIZE = 20;

void setup() {
  size(400, 400);
  snake.add(new SnakePart(0, 0));
  food = new SnakeFood();
  frameRate(8);
}

void draw() {

  drawGrid();
  food.display();
  drawSnake();

  moveSnakeBody();
  moveSnakeHead();

  checkGameOver();
  checkForFoodCollision();
}

void moveSnakeHead() {
  SnakePart head = snake.get(0);
  switch(direction) {
  case 'n':
    head.y -= GRIDSIZE;
    break;
  case 's':
    head.y += GRIDSIZE;
    break;
  case 'e':
    head.x += GRIDSIZE;
    break;
  case 'w':  
    head.x -= GRIDSIZE;
    break;
  }
}


void checkForFoodCollision() {
  SnakePart head = snake.get(0);
  if (head.x == food.x && head.y == food.y) {
    // add a new segment to the snake
    snake.add(new SnakePart(head.x, head.y));
    // reset the position of the food by creating a new object
    food = new SnakeFood();
  }
}

void checkGameOver() {
  SnakePart head = snake.get(0);
  for (int i = 1; i < snake.size(); i++) {
    SnakePart sp = snake.get(i);
    if (head.x == sp.x && head.y == sp.y) {
      textAlign(CENTER);
      text("GAME OVER!", width/2, height/2);
      noLoop();
      break;
    }
  }
  if (head.x < 0) head.x = width;
  if (head.x > width) head.x = 0;
  if (head.y < 0) head.y = height;
  if (head.y > height) head.y = 0;
}


void drawSnake() {
  for (int i = 0; i < snake.size();i++) {
    SnakePart sp = snake.get(i);
    sp.display();
  }
}

void drawGrid() {
  fill(0);
  rect(-1, -1, width+1, width+1);
  stroke(255);
  //  for (int x =0; x < width; x+=GRIDSIZE) {
  //    line(x, 0, x, height);
  //  }
  //  for (int y =0; y < height; y+=GRIDSIZE) {
  //    line(0, y, width, y);
  //  }
}


void keyPressed() {
  SnakePart head = snake.get(0);
  if (key == 'a' || key == 'A')direction = 'w';
  if (key == 'd' || key == 'D')direction = 'e';
  if (key == 'w' || key == 'W')direction = 'n';
  if (key == 's' || key == 'S')direction = 's';
}

void moveSnakeBody() {
  for (int i = snake.size()-1; i > 0; i--) {
    SnakePart spBack = snake.get(i);
    SnakePart spFront = snake.get(i-1);
    spBack.x = spFront.x;
    spBack.y = spFront.y;
  }
}

class SnakeFood {

  int x, y;

  SnakeFood() {
    x = int(random(width/GRIDSIZE))*GRIDSIZE;
    y = int(random(height/GRIDSIZE))*GRIDSIZE;
  }

  void display() {
    fill(255, 100, 100);
    rect(x, y, GRIDSIZE, GRIDSIZE);
  }
}
class SnakePart {

  int x, y;

  SnakePart(int newX, int newY) {
    x = newX;
    y = newY;
  }

  void display() {
    fill(0, 255, 0);
    ellipseMode(CORNER);
    ellipse(x, y, GRIDSIZE, GRIDSIZE);
  }
}




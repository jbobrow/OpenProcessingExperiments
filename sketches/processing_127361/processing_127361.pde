
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/126899*@* 
 !do not delete the line above, required for linking your tweak if you upload again 
 */

ArrayList<SnakePart> snake = new ArrayList<SnakePart>();
char direction;
SnakeFood food;
int GRIDSIZE = 20;
int tt = 6;
float t = tt;

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

  //walls
  fill(255, 100, 100);
  rect(0, 0, 400, 2);
  rect(398, 0, 400, 400);
  rect(0, 0, 2, 400);
  rect(0, 398, 400, 400);
  
  // time
  fill(#2996FF);
  textSize(25);
  text(nf(t, 2, 1), 285, 20);
  t -= .125;
  fill(#FF2929);
  text((snake.size()-1), 25, 20);
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
    t = tt;
  }
}

void checkGameOver() {
  SnakePart head = snake.get(0);
  for (int i = 1; i < snake.size(); i++) {
    SnakePart sp = snake.get(i);
    if (head.x == sp.x && head.y == sp.y) {
      fill(255);
      textAlign(CENTER);
      textSize(60);
      text("GAME OVER!", width/2, height/2);
      noLoop();
      break;
    }
  }
  if (head.x < 0 || head.x >= width || head.y < 0 || head.y >= height) {
    textAlign(CENTER);
    fill(255);
    textSize(60);
    text("GAME OVER!", width/2, height/2);
    noLoop();
  }
  if (t == 0) {
    textAlign(CENTER);
    fill(255);
    textSize(60);
    text("GAME OVER!", width/2, height/2);
    noLoop();
  }
}

void drawSnake() {
  for (int i = 0; i < snake.size();i++) {
    SnakePart sp = snake.get(i);
    sp.display();
  }
}

void drawGrid() {
  background(50);
  stroke(255);
  for (int x =0; x < width; x+=GRIDSIZE) {
    line(x, 0, x, height);
  }
  for (int y =0; y < height; y+=GRIDSIZE) {
    line(0, y, width, y);
  }
}

void keyPressed() {
  SnakePart head = snake.get(0);
  if (key == 'a' || key == 'A' || keyCode == LEFT)direction = 'w';
  if (key == 'd' || key == 'D' || keyCode == RIGHT )direction = 'e';
  if (key == 'w' || key == 'W' || keyCode == UP)direction = 'n';
  if (key == 's' || key == 'S' || keyCode == DOWN)direction = 's';
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
    fill(random(255), random(255), random(255));
    //    fill(255);
    ellipseMode(CORNER);
    ellipse(x, y, GRIDSIZE, GRIDSIZE);
  }
}




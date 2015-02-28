
/*
  NOTES: 
 created SnakeFood class
 Added SnakeFood to game 
 Added checkForFoodCollision
 */

ArrayList<SnakePart> snake = new ArrayList<SnakePart>();
char direction;
SnakeFood food;
int GRIDSIZE = 20;

void setup() {
  size(400, 400);
  snake.add(new SnakePart(0, 0));
  food = new SnakeFood();
  frameRate(4);
}

void draw() {
  drawGrid();
  food.display();
  drawSnake();

  moveSnakeHead();
  checkForFoodCollision();
  moveSnakeBody();
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


void mousePressed() {
  SnakePart head = snake.get(0);
  snake.add(new SnakePart(head.x, head.y));
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

class SnakeFood{
  
  int x,y;
  
  SnakeFood(){
    x = int(random(width/GRIDSIZE))*GRIDSIZE;
    y = int(random(height/GRIDSIZE))*GRIDSIZE;
  }
  
  void display(){
    fill(255,100,100);
    rect(x,y,GRIDSIZE,GRIDSIZE);   
  }
}
class SnakePart{
  
  int x,y;
  
  SnakePart(int newX, int newY){
    x = newX;
    y = newY;
  }
  
  void display(){
    fill(255);
    ellipseMode(CORNER);
    ellipse(x,y,GRIDSIZE,GRIDSIZE);   
  }
}



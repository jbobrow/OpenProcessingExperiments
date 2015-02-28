
ArrayList<SnakePart> snake = new ArrayList<SnakePart>();
char direction;
SnakeFood food;
int GRIDSIZE = 20;
int x;
void setup() {
  size(400, 400);
  snake.add(new SnakePart(0, 0));
  food = new SnakeFood();
  frameRate(5);

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
     x=x+2;
    frameRate(5+x);
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
  if (head.x < 0 || head.x >= width || head.y < 0 || head.y >= height) {
    textAlign(CENTER);
    fill(0);
    textSize(30);
    fill(random(255),random(0),random(0));
    text("GAME OVER!", width/2, height/2);
//    noLoop();
  }
}
 
 
void drawSnake() {
  for (int i = 0; i < snake.size();i++) {
    SnakePart sp = snake.get(i);
    sp.display();
  }
}
 
void drawGrid() {
    background(#CBB67B);
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
  if (keyCode == LEFT)direction = 'w';
  if (keyCode == RIGHT)direction = 'e';
  if (keyCode == UP)direction = 'n';
  if (keyCode == DOWN)direction = 's';
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
    fill(#20831F);
    ellipse(x+4, y+2, 12, 12);
    ellipse(x+2, y+2, 4, 4); 
    ellipse(x+14, y+2, 4, 4);
   ellipse(x+3,y+13,6,3); 
      ellipse(x+11,y+13,6,3);
    fill(random(100));
    ellipse(x+7, y+6, 2, 2);
    ellipse(x+11, y+6, 2, 2);
  }
}

class SnakePart{
   
  int x,y;
   
  SnakePart(int newX, int newY){
    x = newX;
    y = newY;
  }
   
  void display(){
    fill(#AA3A3A);
    ellipseMode(CORNER);
    ellipse(x,y,GRIDSIZE,GRIDSIZE);  
  }
}





import processing.opengl.*;

char direction;

ArrayList<SnakePart> snake;
SnakePart head;
SnakeFood food;
boolean gameOver;


void setup() {
  size(400, 400, OPENGL);
  frameRate(8);
  //snake.clear();
  snake = new ArrayList<SnakePart>();
  snake.add(new SnakePart(100, 200));
  food = new SnakeFood();
  smooth();
  head = (SnakePart)snake.get(0);
  gameOver = false;
}

void draw() {
  background(100);
  moveBody();
  moveHead();
  checkGameOver();
  //Check if the snake ate the food
  if (dist(head.x, head.y, food.x, food.y) < 5) {
    food = new SnakeFood();
    snake.add(new SnakePart(head.x, head.y));
  }
  // Draw everything to the screen.
  food.display();
  for (int i = 0; i < snake.size(); i++) {
    SnakePart sp = (SnakePart)snake.get(i);
    sp.display();
  }
}

void keyPressed() {
  if (key == 'a' || key == 'A') direction = 'w';
  if (key == 'd' || key == 'D') direction = 'e';
  if (key == 'w' || key == 'W') direction = 'n';
  if (key == 's' || key == 'S') direction = 's';
  if (key == ' ' && gameOver == true) {
    snake.clear();
    snake.add(new SnakePart(100, 200));
    food = new SnakeFood();
    head = (SnakePart)snake.get(0);
    direction = null;
    loop();
  }
}

void moveHead() {
  switch(direction) {
  case 'n':
    head.y -= 20;
    break;
  case 's':
    head.y += 20;
    break;
  case 'e':
    head.x += 20;
    break;
  case 'w':   
    head.x -= 20;
    break;
  }
}

void moveBody() {
  for (int i = snake.size()-1; i > 0; i--) {
    SnakePart front = (SnakePart)snake.get(i-1);
    SnakePart back = (SnakePart)snake.get(i);
    back.x = front.x;
    back.y = front.y;
  }
}

void checkGameOver() {
  for (int i = 1; i < snake.size(); i++) {
    SnakePart sp = (SnakePart)snake.get(i);
    if (dist(head.x, head.y, sp.x, sp.y) < 5) {
      text("GAME OVER!", width/2-20, height/2);
      gameOver = true;
      noLoop();
    }
  }
  if (head.x < 0 || head.x > width || head.y < 0 || head.y > height) {
    text("GAME OVER!", width/2-20, height/2);
    gameOver = true;
    noLoop();
  }
}




class SnakeFood {

  int x, y;

  SnakeFood() {
    x = int(random(width/20))*20;
    y = int(random(height/20))*20;
  }

  void display() {
    fill(255, 100, 100);
    pushMatrix();
    translate(x, y, 0);
    box(20);
    popMatrix();
  }
}

class SnakePart {

  int x, y;

  SnakePart(int newX, int newY) {
    x = newX;
    y = newY;
  }

  void display() {
    fill(255);
    pushMatrix();
    translate(x, y, 0);
    box(20);
    popMatrix();
  }
}




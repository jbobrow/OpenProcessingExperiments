

ArrayList snake;
SnakePart head;
SnakeFood food;
char direction;
boolean gameOver;

void setup() {
  size(400, 400);
  smooth();
  textAlign(CENTER);
  loop();
  frameRate(8);
  snake  = new ArrayList();
  snake.add(new SnakePart(0, 0));
  head = (SnakePart)snake.get(0);
  food = new SnakeFood();


  gameOver = false;
  direction = ' ';
}

void draw() {
  drawGameElements();
  moveBody();
  moveHead();
  if (!gameOver)checkGameOver();
  //Check if the snake ate the food
  if (dist(head.x, head.y, food.x, food.y) < 5) {
    food = new SnakeFood();
    snake.add(new SnakePart(head.x, head.y));
  }
}

void mousePressed() {
  if (gameOver) {
    setup();
  }
}

void drawGameElements() {
  // Draw everything to the screen.
  background(100);
  for(int x = 0; x <= width; x += 20){
    line(x,0,x,height);
  }
  for(int y = 0; y <= height; y += 20){
    line(0,y,width,y);
  }
  
  
  food.display();
  for (int i = 0; i < snake.size(); i++) {
    SnakePart sp = (SnakePart)snake.get(i);
    sp.display();
  }
  // Tell people what to do if at the beginning of the game:
  if (direction == ' ') text("Use A,W,S,D to Move!", width/2, height/2);
}

void keyPressed() {
  if (key == 'a' || key == 'A') direction = 'w';
  if (key == 'd' || key == 'D') direction = 'e';
  if (key == 'w' || key == 'W') direction = 'n';
  if (key == 's' || key == 'S') direction = 's';
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
      text("GAME OVER!", width/2, height/2);
      gameOver = true;
      noLoop();
    }
  }
  if (head.x < 0 || head.x > width || head.y < 0 || head.y > height) {
    text("GAME OVER!", width/2, height/2);
    gameOver = true;
    noLoop();
  }
}





class SnakeFood{
  
  int x,y;
  
  SnakeFood(){
    x = int(random(width/20))*20;
    y = int(random(height/20))*20;
  }
  
  void display(){
    fill(255,100,100);
    rect(x,y,20,20);   
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
    ellipse(x,y,20,20);   
  }
}



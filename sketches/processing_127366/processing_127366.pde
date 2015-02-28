
ArrayList<SnakePart> snake = new ArrayList<SnakePart>();
char direction;
SnakeFood food;
SnakeImmunity immunity;
SnakePoison[] poison = new SnakePoison[10];
int GRIDSIZE = 20;
int t = 50;
boolean immune = false;

void setup() {
  size(400, 400);
  snake.add(new SnakePart(0, 0));
  food = new SnakeFood();
  immunity = new SnakeImmunity();
  for (int i = 0; i < poison.length; i++) {
    poison[i] = new SnakePoison();
  }
  frameRate(8);
}

void draw() {

  drawGrid();
  food.display();
  immunity.display();
  for (int i = 0; i < poison.length; i++) {
    poison[i].display();
  }
  drawSnake();

  moveSnakeBody();
  moveSnakeHead();

  immunityTimer();

  checkGameOver();
  checkForFoodCollision();
  checkForPoisonCollision();
  checkForImmunityCollision();
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

void checkForPoisonCollision() {
  for (int i = 0; i < poison.length; i++) {
    SnakePart head = snake.get(0);
    if (head.x == poison[i].x && head.y == poison[i].y && snake.size() > 1 && immune == false) {
      poison[i] = new SnakePoison();
      snake.remove(snake.size()-1);
      break;
    }
    else if (head.x == poison[i].x && head.y == poison[i].y && immune == false) {
      textAlign(CENTER);
      text("GAME OVER!", width/2, height/2);
      noLoop();
      break;
    }
  }
}

void checkForImmunityCollision() {
  SnakePart head = snake.get(0);
  if (head.x == immunity.x && head.y == immunity.y) {
    immune = true;
    immunity = new SnakeImmunity();
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
 if (head.x < 0) head.x += width;
  else if (head.x > width) head.x -= width;
  else if (head.y > height) head.y -= height;
  else if (head.y < 0)head.y += height;
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

void immunityTimer() {
  if (immune == true) {
    for (int i = 0; i < snake.size(); i++) {
      SnakePart all = snake.get(i);
      all.c = color(255, 255, 100);
    }
    if (t < 1)immune = false;
    else {
      t--;
    }
  } 
  else if (immune == false) {
    t = 50;
    for (int i = 0; i < snake.size(); i++) {
      SnakePart all = snake.get(i);
      all.c = color(255);
    }
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

class SnakeImmunity{
   
  int x,y;
   
  SnakeImmunity(){
    x = int(random(width/GRIDSIZE))*GRIDSIZE;
    y = int(random(height/GRIDSIZE))*GRIDSIZE;
  }
   
  void display(){
    fill(255,255,100);
    rect(x,y,GRIDSIZE,GRIDSIZE);  
  }
}

class SnakePart{
   
  int x,y;
  color c;
   
  SnakePart(int newX, int newY){
    x = newX;
    y = newY;
    c = color(255);
  }
   
  void display(){
    fill(c);
    ellipseMode(CORNER);
    ellipse(x,y,GRIDSIZE,GRIDSIZE);  
  }
}

class SnakePoison{
   
  int x,y;
   
  SnakePoison(){
    x = int(random(width/GRIDSIZE))*GRIDSIZE;
    y = int(random(height/GRIDSIZE))*GRIDSIZE;
  }
   
  void display(){
    fill(100,255,100);
    rect(x,y,GRIDSIZE,GRIDSIZE);  
  }
}



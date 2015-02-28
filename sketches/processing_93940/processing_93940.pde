
//Ana Vlajnic

float speed;
int cx;
int cy;
int moveX = 0;
int moveY = 0;
int snakeX = 0;
int snakeY = 0;
int foodX;
int foodY;
boolean eaten;
int poisons;
ArrayList<Point> poisonLocations;

boolean check = true;
int []snakesX;
int []snakesY;
int snakeSize = 1;
int windowSize = 600;
boolean gameOver = false;
PFont Font = createFont("Arial",36, true);


void setup(){
  size(int(windowSize), int(windowSize),P2D);
  background(0);
  speed= 600/frameRate;
  snakesX = new int[300];
  snakesY = new int[300];
  
  cx = width/2;
  cy = height/2;
   
  snakeX = cx-5;
  snakeY = cy-5;
  foodX = (int)random(0, windowSize/10);
  foodY = (int)random(0, windowSize/10);
  gameOver = false;
  check = true;
  snakeSize = 1;
  poisonLocations = new ArrayList<Point>();
}
  
void draw(){
  if(speed%10 == 0){
    background(0);
    runGame();
  }
  speed++;
}

void restart(){
  snakeX = cx-5;
  snakeY = cy-5;
  gameOver = false;
  check = true;
  snakeSize = 1;
  moveY = 0;
  moveX = 0;
}

void runGame(){
  if(gameOver== false){ 
    drawFood();
    drawPoison();
    drawSnake();
    snakeMove();
    atePoison();
    ateFood();
    checkHitSelf();   
  }
  else{
      String modelString = "Press R to Restart";
      String score = "Score: " + snakeSize;
      
      textAlign (CENTER);
      textFont(Font);
      fill(255);
      text(modelString, 250, 250);
      fill(255);
      text(score, 250, 300);
      poisonLocations = new ArrayList<Point>();
      poisons = 0;
  }
}

void checkHitSelf(){
   for(int i = 1; i < snakeSize; i++){
       if(snakeX == snakesX[i] && snakeY== snakesY[i]){
          gameOver = true;
      }
   } 
}

void ateFood(){
  if(foodX == snakeX && foodY == snakeY){
     check = true;
     snakeSize++;
     poisons++;
     drawPoison();
     eaten = true;
     drawFood();
  }
}

void drawFood(){
  fill(15, 15, 200);
  stroke(15, 15, 200);
  if(eaten){
    foodX = 5 + 10*(int)random(1,windowSize/10);
    foodY = 5 + 10* (int)random(1,windowSize/10);
    eaten = false;
  }
  while(check){
    int x = (int)random(1,windowSize/10);
    int y = (int)random(1,windowSize/10);
    foodX = 5 + x*10;
    foodY = 5 + y*10;

    for(int i = 0; i < snakeSize; i++){
      if(x == snakesX[i] && y == snakesY[i]){
        check = true;
        i = snakeSize;
      }
      else{
        check = false;
    }
  } 
 }
  rect(foodX-5, foodY-5, 10, 10); 
}
  

void atePoison(){
  for(int i = 0; i < poisonLocations.size(); i++){
    Point poison = poisonLocations.get(i);
    if(poison.x == snakeX && poison.y == snakeY){
       gameOver = true;
    }
  }
}

void drawPoison(){
  fill(200, 15, 15);
  stroke(200, 15, 15);
    float poisonX = 0;
    float poisonY = 0;
  if(poisons > poisonLocations.size())
  {

    while(check){
      int x_1 = (int)random(1,windowSize/10);
      int y_1 = (int)random(1,windowSize/10);
      poisonX = 5 + (x_1)*10;
      poisonY = 5 + (y_1)*10;
       
      for(int i = 0; i < snakeSize; i++){
         if(x_1 == snakesX[i] && y_1 == snakesY[i]){
           check = true;
           i = snakeSize;
         }else{
           check = false;
         }
      } 
    }
    poisonLocations.add(new Point(poisonX, poisonY));
  }
  for(int i = 0; i < poisonLocations.size(); i++){
    
    rect(poisonLocations.get(i).x-5, poisonLocations.get(i).y-5, 10, 10);
  }

}

void drawSnake(){
  fill(100);
  stroke(100);
 
  for(int i = 0; i < snakeSize; i++) {
    int X = snakesX[i];
    int Y = snakesY[i];
    rect(X-5,Y-5,10,10);
  }
   
  for(int i = snakeSize; i > 0; i--){
    snakesX[i] = snakesX[i-1];
    snakesY[i] = snakesY[i-1];
  }
}
 
void snakeMove(){
  snakeX += moveX;
  snakeY += moveY;
  if(snakeX > windowSize-5 || snakeX < 5||snakeY > windowSize-5||snakeY < 5){
     gameOver = true;
  }
  snakesX[0] = snakeX;
  snakesY[0] = snakeY;
   
}
  
void keyPressed() {
  if(keyCode == UP) {  
    if(snakesY[1] != snakesY[0]-10){
      moveY = -10; moveX = 0;
    }
   }
   
  if(keyCode == DOWN) { 
    if(snakesY[1] != snakesY[0]+10){
       moveY = 10; moveX = 0;
    }
  }
  
  if(keyCode == LEFT) { 
    if(snakesX[1] != snakesX[0]-10){
      moveX = -10; moveY = 0;
    }
  }
  
  if(keyCode == RIGHT) { 
    if(snakesX[1] != snakesX[0]+10){
      moveX = 10; moveY = 0;
    }
  }
  
  if(keyCode == 'R') {
    restart();
  }
}

class Point{
  
  float x;
  float y;
  
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }
  
}



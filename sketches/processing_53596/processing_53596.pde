

Snake snake;
Apple apple;
boolean gameover = false;
int timestamp;

void setup() {
  size(400, 400);
  frameRate(8);
  ellipseMode(CORNER);
  noStroke();
  smooth();
  textAlign(CENTER);
  textSize(100);
  
  snake = new Snake(100);
  apple = new Apple(20, 80);
}

void draw() {
  
  if (!gameover) {
    background(240);
    
    // show score
    fill(200);
    text(snake.getLength(), width/2, height/2);
    
    snake.advance();
    snake.displayHead();
    snake.displayBody();
  
    // relocate apple, add segment to snake
    if (snake.locateX() == apple.locateX() && snake.locateY() == apple.locateY()) {
      int rndX, rndY;
      snake.addSegment();
      do {
        rndX = int(random(width/20))*20;
        rndY = int(random(height/20))*20;
      }
      while(snake.searchArray(rndX, rndY));
      apple.position(rndX, rndY);
    }
    
    apple.display(); 
    if (snake.checkCollision()) endGame();
  }
  
}

void keyPressed() {
  if (gameover) restartGame();
  else if (key == CODED) {
    snake.newDirection(keyCode);
  }
  // change speed
  else if (key > 48 && key < 58) {
    frameRate((key - 47) * 2);
    snake.reset();
  }
}

void mouseClicked() {
  if (gameover) restartGame();
}

void endGame() {
  gameover = true;
  timestamp = millis();
  background(20);
  snake.displayBody();
  snake.displayHead();
  fill(255);
  text(snake.getLength(), width/2, height/2);
}

void restartGame() {
  if (millis() - timestamp >= 1000) {
    gameover = false;
    snake.reset();
  }
}
class Apple {
  
  int posX;
  int posY;
  
  Apple(int x, int y) {
    posX = x;
    posY = y;
  }
  
  int locateX() {
    return posX;
  }
  
  int locateY() {
    return posY;
  }
  
  void position(int x, int y) {
    posX = x;
    posY = y;
  }
  
  void display() {
    fill(200, 150, 150);
    ellipse(posX+2, posY+2, 16, 16);
  }
  
}
final int NORTH = 0;
final int SOUTH = 1;
final int EAST = 2;
final int WEST = 3;

class Snake {
 
 int[] snakeArrayX = new int[2];
 int[] snakeArrayY = new int[2];
 int[] pSnakeArrayX = new int[2]; // stores value of last frame
 int[] pSnakeArrayY = new int[2]; // store value of last frame
 int direction;
 int tailX, tailY;
 int c;
 
 Snake(int cc) {
   snakeArrayX[0] = 20;
   snakeArrayY[0] = 0;
   snakeArrayX[1] = 0;
   snakeArrayY[1] = 0;
   direction = EAST;
   c = cc;
 }
 
 // return x position of head
 int locateX() {
   return snakeArrayX[0];
 }
 
 // return y position of head
 int locateY() {
   return snakeArrayY[0];
 }
 
 // return length of snake
 int getLength() {
   return snakeArrayX.length;
 }
 
 // change direction of head
 void newDirection(int newDirect) {
   switch(newDirect) {
     case UP:
       if (direction != SOUTH) direction = NORTH;
       break;
     case DOWN:
       if (direction != NORTH) direction = SOUTH;
       break;
     case RIGHT:
       if (direction != WEST) direction = EAST;
       break;
     case LEFT:
       if (direction != EAST) direction = WEST;
       break;
    }
  }
 
 // move snake forward
 void advance() {
   
   // store position of last segment in case a new one is added
   tailX = snakeArrayX[snakeArrayX.length-1];
   tailY = snakeArrayY[snakeArrayY.length-1];
   
   // store curent configuration and then move snakeArray along this
   for (int i = 0; i < snakeArrayX.length; i++) {
     pSnakeArrayX[i] = snakeArrayX[i];
     pSnakeArrayY[i] = snakeArrayY[i];
   }
   for (int i = 1; i < snakeArrayX.length; i++) {
     snakeArrayX[i] = pSnakeArrayX[i-1];
     snakeArrayY[i] = pSnakeArrayY[i-1];
   }
   
   // choose direction of head
   switch(direction) {
     case NORTH:
       snakeArrayY[0] -= 20;
       break;
     case SOUTH:
       snakeArrayY[0] += 20;
       break;
     case EAST:
       snakeArrayX[0] += 20;
       break;
     case WEST:
       snakeArrayX[0] -= 20;
       break;
   }
   
   // constrain to window
   if (snakeArrayY[0] < 0) snakeArrayY[0] = height;
   else if (snakeArrayY[0] > height - 20) snakeArrayY[0] = 0;
   if (snakeArrayX[0] < 0) snakeArrayX[0] = width;
   else if (snakeArrayX[0] > width - 20) snakeArrayX[0] = 0;
   
 }
 
 // draw front of snake
 void displayHead() {
   fill(c);
   ellipse(snakeArrayX[0], snakeArrayY[0], 20, 20);
   fill(255 - c);
   ellipse(snakeArrayX[0] + 6, snakeArrayY[0] + 6, 8, 8);
 }

 // draw each segment of snake
 void displayBody() {
   fill(c);
   for (int i = 1; i < snakeArrayX.length; i++) {
     ellipse(snakeArrayX[i], snakeArrayY[i], 20, 20);
   }
 }
 
 // add a segment to snake
 void addSegment() {
   snakeArrayX = append(snakeArrayX, tailX);
   snakeArrayY = append(snakeArrayY, tailY);
   pSnakeArrayX = append(pSnakeArrayX, 0);
   pSnakeArrayY = append(pSnakeArrayY, 0);
 }
 
 // reset snake
 void reset() {
   snakeArrayX = new int[2];
   snakeArrayY = new int[2];
   snakeArrayX[0] = 20;
   snakeArrayY[0] = 0;
   snakeArrayX[1] = 0;
   snakeArrayY[1] = 0;
   direction = EAST;
   pSnakeArrayX = new int[2];
   pSnakeArrayY = new int[2];
 }
 
 // returns true is value is in snakeArrays, false otherwise
 boolean searchArray(int x, int y) {
   for (int i = 1; i < snakeArrayX.length; i++) {
     if (x == snakeArrayX[i] && y == snakeArrayY[i]) {
       return true;
     }
   }
   return false;
 }
 
 // return true if snake runs into itself, otherwise return false
 boolean checkCollision() {
   return searchArray(snakeArrayX[0], snakeArrayY[0]);
 }
 
}



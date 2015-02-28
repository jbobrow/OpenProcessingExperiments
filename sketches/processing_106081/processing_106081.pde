
// Austin Pohlman
// A Recreation of Snake
// 08/08/13

float ball_radius;
float x;
float y;
Snake snake = new Snake();


void setup() {

  size(600, 600);
  frameRate(60);
  smooth();

  x = random(width);
  y = random(height);

  ball_radius = 10;
}

void draw() {
  background(255);
  controls();
  snake.draw();

  // food
  fill(0);
  ellipse(x, y, ball_radius, ball_radius);
}

void controls() {
    if (keyPressed==true && keyCode == DOWN) {
      println("Down");
      snake.dy = 2;
      snake.dx = 0;
    }
    if (keyPressed==true && keyCode == UP) {
      println("Up");
      snake.dy = -2;
      snake.dx = 0;
    }
    if (keyPressed==true && keyCode == LEFT) {
      println("Left");
      snake.dy = 0;
      snake.dx = -2;
    }
    if (keyPressed==true && keyCode == RIGHT) {
      println("Right");
      snake.dy = 0;
      snake.dx = 2;
    }
  }


class Snake {

  int dx = 2;
  int dy = 0;


  
  int[] snakebodyX = new int[30];
  int[] snakebodyY = new int[30];
  
  int snakeSize = 5;
  
  
  Snake() {
  
      for (int i = 0; i<snakeSize; i++) {
          snakebodyX[i] = 50;
          snakebodyY[i] = 50 + i * 15;
      }
  
  }
  

  void draw() {

      for (int i = snakeSize; i>0; i--) {
          
          ellipse(snakebodyX[i] , snakebodyY[i], 15, 15);
      }
    
    x2 = x2+dx;
    y2 = y2+dy;
    //snakeheadx = snakeheadx + dx;
    //snakeheady = snakeheady + dy;
  }
}

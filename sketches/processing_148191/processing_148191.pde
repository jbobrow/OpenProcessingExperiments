
ArrayList<Snake> segment = new ArrayList<Snake>();
int row = 30;
int col = 30;
int w, x, y = 30, z = 30;
Snake snake;
int a = 30;
int dir = 5; 

void setup() {
  size(600, 600);
  smooth();
  frameRate(10);
  //snake = new Snake(-30, 30);
}

void draw() {
  drawGrid();
  //snake a = new snake();
  drawRat();
  drawSnake();
  smooth();
  //snake.move();
  if (keyCode == UP) {
    rect(w, x -= a, y, z);
    dir = 8;
    if (w >= 600 || x < 0) {
        gameOver();
    }
    //println(dir);
  } 
  else if (keyCode == DOWN) {
    rect(w, x += a, y, z);
    dir = 2;
    if (w >= 600 || x >= 600) {
        gameOver();
    }
    //println(dir);
  } 
  else if (keyCode == LEFT) { 
    rect(w -= a, x, y, z);
    dir = 4;
    if (w < 0 || x >=600) {
        gameOver();
    }
    //println(dir);
  } 
  else if ( keyCode == RIGHT) {
    rect(w += a, x, y, z);
    dir = 6;
    if (w >= 600 || x >= 600) {
        gameOver();
    }
    //println(dir);
  }
  erase();
  
}

void erase() {
  if(dir == 6) {
    fill(255);
    rect(w -= a, x, y, z);
    fill(0, 200, 0);
    rect(w += a, x, y, z);
  } else if(dir == 4) {
    fill(255);
    rect(w += a, x, y, z);
    fill(0,200,0);
    rect(w-=a, x, y, z);
  } else if(dir == 8) {
    fill(255);
    rect(w, x+=a , y, z);
    fill(0,200,0);
    rect(w, x-=a , y, z);
  } else if(dir == 2) {
    fill(255);
    rect(w, x-= a , y, z);
    fill(0,200,0);
    rect(w, x+=a, y, z);
  }
}

void drawGrid() {
  background(255);
  for (int i = 0 ; i < row; i++) {
    line(0, i * row, width, i * row);
  }
  for (int i  = 0; i < col; i++) {
    line(i * col, 0, i * col, height);
  }
}

void drawSnake() {
  fill(0, 200, 0);
  rect(w, x, y, z);
}

void drawRat() {
  fill(200,0,0);
  int a = 300;
  int b = 300;
  rect( 300, 300, y, z);
  if(a == 300 && b == 300 && dir == 2) {
    fill(255);
    rect(300,300,y,z);
  }
   
}

/*void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) { 
      rect(w, x -= 30, y, z);
      /*if (w >= 600 || x < 0) {
        gameOver();
      }
    } 
    else if (keyCode == DOWN ) {
      rect(w, x += 30, y, z);
      /*if (w >= 600 || x >= 600) {
        gameOver();
      }
    }
    else if (keyCode == LEFT) {
      rect(w -= 30, x, y, z);
      /*if (w < 0 || x >=600) {
        gameOver();
      }
    } 
    else if (keyCode == RIGHT) {
      rect(w += 30, x, y, z);
      /*if (w >= 600 || x >= 600) {
        gameOver();
      }
    }
  }
}*/

void gameOver() {
  frameRate(0.4);
  textSize(100);
  fill(0);
  textAlign(CENTER);
  text("GAME OVER", 300, 300);
}

class Snake {
  int w; 
  int x; 
  public Snake(int a , int b) {
    w = a;
    x = b;
  }

  void Loc() {
    rect(w, x, y, z);
  }
}

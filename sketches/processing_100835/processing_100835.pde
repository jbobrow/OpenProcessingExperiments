
Ball[] ball = new Ball[10000];

int ballCount = 0;
int timer;

void setup() {
  size(400, 400);
  for (int i = 0; i < ball.length; i++) {
    if (ball[i] != null) {
      ball[i].init();
    }
  }
  mouseX = width/2;
}

float playerPos;
float playerSpeed;

void draw() {
  background(100);
  makeEnemy();  
  moveEnemy();
  player();
}

float moveSpeed;

void moveEnemy() {
  fill(255);
  noStroke();
  playerSpeed = sqrt((sq(mouseX - width/2)))/15;
  moveSpeed+=playerSpeed/5;
  if (mouseX >= width/2) {
    for (int i = 0; i < ball.length; i++) {
      if (ball[i] != null) {
        ball[i].setXPos(ball[i].getXPos() - playerSpeed);
      }
    }
  } 
  else {
    for (int i = 0; i < ball.length; i++) {
      if (ball[i] != null) {
        ball[i].setXPos(ball[i].getXPos() + playerSpeed);
      }
    }
  }
}

void makeEnemy() {
  noStroke();
  timer++;
  if (timer % 2.5 == 0) {
    ball[ballCount] = new Ball();
    ball[ballCount].init();
    ballCount++;
  }
  for (int i = 0; i < ball.length; i++) {
    if (ball[i] != null) {
      ball[i].make();
      ball[i].move();
      ball[i].check();
    }
  }
}

void player() {
  fill(255);
  ellipse(width/2, height*7/8, 10, 10);
}
class Ball {
  float xpos;
  float ypos = 0;
  float siz = 40;
  float opacity = 0;

  void init() {
    xpos = random(-width*2, width*3);
    siz = 30;
  }

  void make() {
    fill(0, opacity);
    ellipse(xpos, ypos, siz, siz);
  }

  void move() {
    if (opacity <= 255) {
      opacity+=5;
    }
    if (ypos <= height*3/2) {
      ypos+=5;
      siz+=.5;
    }
  }
  
  int lives = 100;
  
  void check() {    
    if (sqrt((sq(xpos - width/2)) + (sq(ypos - height*7/8))) < 5 + siz/2) {
      filter(INVERT);
    }
  }
  
  float getXPos() {
   return xpos; 
  }
  
  void setXPos(float x) {
   xpos = x; 
  }
}




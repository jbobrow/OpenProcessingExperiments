
Ball[] ball = new Ball[10000];
int ballCount;
int timer;

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  xpos = width/2;
  ypos = height/2;
  mouseX = width/2;
  mouseY = height/2;
}

float angle;
float speed = 1;
float xpos;
float ypos;
int makeEnemySpeed = 100;
int score;
boolean go = true;

void draw() {
  backGround();
  showScore();
  if (go) {
    player();
    enemy();
  } 
  else {
    deathScreen();
  }
}

void backGround() {
  background(45);
  for (int i = 0; i < 50; i++) {
    stroke(0, 255-i*255/50);
    line(i, 0, i, height);
    line(width-i, 0, width-i, height);
    line(0, i, width, i);
    line(0, height-i, width, height-i);
    noStroke();
  }
}

void showScore() {
  textSize(50);
  textAlign(CENTER);
  fill(200);
  text("SCORE : " + score, width/2, height/4);
}

void player() {
  fill(200);
  ellipse(xpos, ypos, 30, 30);
  fill(25);
  ellipse(xpos, ypos, 15, 15);
  angle = atan2((mouseY-ypos), (mouseX-xpos));
  speed = sqrt(sq(mouseX-xpos)+sq(mouseY-ypos))/15;
  if (xpos != mouseX && ypos != mouseY) {
    xpos+=cos(angle)*speed;
    ypos+=sin(angle)*speed;
  }
}

void enemy() {
  timer++;
  if (timer % 60 == 0) {
    if (makeEnemySpeed >= 10) {
      makeEnemySpeed--;
    }
  }
  if (timer % makeEnemySpeed == 0) {
    ball[ballCount] = new Ball(random(width), random(height), (int)random(4));
    ball[ballCount].setAngle(atan2((ball[ballCount].ypos-ypos), (ball[ballCount].xpos-xpos)));
    ballCount++;
    score++;
  }
  for (int i = 0; i < ballCount; i++) {
    if (ball[i] != null) {
      ball[i].make();
      ball[i].move();
      if (sqrt(sq(ball[i].xpos-xpos)+sq(ball[i].ypos-ypos)) <= 9+15) {
        go = false;
      }
    }
  }
}

void deathScreen() {

  textSize(20);
  text("- PRESS SPACE TO RESTART -", width/2, height*6/7);
  textSize(90);
  text("GAME", width/2, height/2);
  text("OVER", width/2, height*2/3+30);
}

void keyReleased() {
  if (key == ' ') {
    if (go == false) {
      restart();
    }
  }
}

void restart() {
  for (int i = 0; i < ballCount; i++) {
    ball[i].remove();
  }
  xpos = width/2;
  ypos = height/2;
  mouseX = width/2;
  mouseY = height/2;
  score = 0;
  makeEnemySpeed = 100;
  go = true;
}

class Ball {
  float xpos;
  float ypos;
  float dir;
  float angle;
  Ball (float _x, float _y, int _d) {
    dir = _d;
    if (dir == 0) {
      xpos = _x;
      ypos = 0;
    } 
    else if (dir == 1) {
      xpos = width;
      ypos = _y;
    } 
    else if (dir == 2) {
      xpos = _x;
      ypos = height;
    } 
    else if (dir == 3) {
      xpos = 0;
      ypos = _y;
    }
  }

  void setAngle(float _a) {
    angle = _a;
  }

  void make() {
    fill(200);
    ellipse(xpos, ypos, 18, 18);
    fill(25);
    ellipse(xpos, ypos, 15, 15);
  }

  void move() {
    xpos-=cos(angle)*5;
    ypos-=sin(angle)*5;
  }
  
  void remove() {
    xpos=-cos(angle)*1000;
    ypos=-sin(angle)*1000;
  }
}




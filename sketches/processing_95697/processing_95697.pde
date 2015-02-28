
/** push balls each other
 *  Copyright 2011 Yutaka Kachi
 *  Licensed by New BSD License
 *
 *  複数のボールがウィンドウ内を移動する
 *  ボール同士もぶつかる。
 **/

float SPEED = 5; // 移動量
float R = 10; //半径
int NUMBER = 17;  // ボールの個数
Ball[] balls = new Ball[NUMBER];

void setup() {
  size(250, 250);
  frameRate(20);
  background(0);
  
  float angle = TWO_PI / NUMBER;
  for (int i = 0; i < NUMBER; i++) {
    float addx = cos(angle * i);
    float addy = sin(angle * i);
    balls[i] = new Ball(
    width / 2 + addx * 50, height / 2 + addy * 50, 
    SPEED * addx + 1, SPEED * addy  + 1, i, balls);
  }
}

void draw() {
  //background(0);
  fadeToBlack();
  
  for (int i = 0; i < NUMBER; i++) {
    balls[i].clearVector();
  }
  for (int i = 0; i < NUMBER; i++) {
    Ball ball = (Ball) balls[i];
    ball.collide();
    ball.move();
    ball.draw();
  }
}

class Ball
{
  float x, y; //ボールの現在位置（中心）
  float vx, vy; //ボールの移動量
  PVector target = new PVector(); //衝突時に排除される距離
  PVector impulse = new PVector(1, 1); //反作用
  int id; //ボールの識別番号
  Ball[] others;

  //コンストラクタ
  Ball(
  float _x, float _y, float _vx, float _vy, int _id, Ball[] _others) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    id = _id;
    others = _others;
  }

  void move() {
    vx *= impulse.x;   
    x = x + vx + target.x;
 
    if (x - R <= 0) {
      x = R;
      vx *= -1;
    }
    if (x + R >= width) {
      x = width - R;
      vx *= -1;
    }

    vy *= impulse.y;
    y = y + vy + target.y;

    if (y - R <= 0) {
      y = R;
      vy *= -1;
    }
    if (y + R >= height) {
      y = height - R;
      vy *= -1;
    }
  }
  
  void draw() {
    noFill();
    stroke(255);
    ellipse(x, y, R * 2, R * 2);
  }
  
  void clearVector() {
    target.x = 0;
    target.y = 0;
    impulse.x = 1;
    impulse.y = 1;
  }
  
  //衝突判定
  void collide() {
    for (int i = id + 1; i < NUMBER; i++) {
      Ball otherBall = (Ball) others[i];

      //ボール間の距離を求める
      float dx = otherBall.x - x;
      float dy = otherBall.y - y;
      float distance =sqrt(dx * dx + dy * dy);
      
      if (distance <= R * 2) {
        
        //跳ね返る距離を求める
        float angle = atan2(dy, dx);
        float push_distance = R * 2 - distance; // / 2;
        float push_x = push_distance * cos(angle);
        float push_y = push_distance * sin(angle);

        target.x -= push_x;
        target.y -= push_y;        
        otherBall.target.x += push_x;
        otherBall.target.y += push_y;

        //反発後の移動方向を設定
        if ((vx >= 0 && vx - otherBall.vx >= 0) || (vx < 0 && vx - otherBall.vx < 0)) {
          impulse.x = -1;
        }
        
        if (vx * otherBall.vx <= 0) {
          otherBall.impulse.x = -1;
        }
        
        if ((vy >= 0 && vy - otherBall.vy >= 0) || (vy < 0 && vy - otherBall.vy < 0)) {
          impulse.y = -1;
        }

        if (vy *  otherBall.vy <= 0) {
          otherBall.impulse.y = -1;
        }
      }
    }
  }
}

//フェードアウト
void fadeToBlack() {
  noStroke();
  fill(0, 60);
  rectMode(CORNER);
  rect(0, 0, width, height);
}




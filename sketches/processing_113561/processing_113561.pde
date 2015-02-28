
/** boid
 *  Copyright 2011 Yutaka Kachi
 *  Licensed by New BSD License
 *
 *  Boid：生き物の群れのように動き回るボール
 *
 **/

float SPEED = 4; // 移動量
float R = 10; //半径
int NUMBER = 10;  // ボールの個数
Ball[] balls = new Ball[NUMBER];

float r1 = 1; // パラメータ：群れの中心に向かう度合
float r2 = 0.8; // パラメータ：仲間を避ける度合
float r3 = 0.1; // パラメータ：群れの平均速度に合わせる度合

int CENTER_PULL_FACTOR = 300;
int  DIST_THRESHOLD = 30;

void setup() {
  size(250, 250);
  frameRate(20);
  noFill();
  stroke(255, 255, 255);
  
  float angle = TWO_PI / NUMBER;
  for (int i = 1; i <= NUMBER; i++) {
    float addx = cos(angle * i);
    float addy = sin(angle * i);
    balls[i-1] = new Ball(
    width / 2 + addx * 50, height / 2 + addy * 50, 
    random(- SPEED, SPEED) * addx, random(- SPEED, SPEED) * addy, i - 1, balls);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < NUMBER; i++) {
    balls[i].clearVector();
  }
  for (int i = 0; i < NUMBER; i++) {
    Ball ball = (Ball) balls[i];
    ball.check();
    ball.move();
    ball.draw();
  }
}

class Ball
{
  float x, y;   //ボールの現在位置（中心）
  float vx, vy; //ボールの移動量
  PVector v1 = new PVector();  //移動量：群れの中心に向かう
  PVector v2 = new PVector();  //移動量：仲間を避ける
  PVector v3 = new PVector();  //移動量：群れの平均速度に合わせる

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
    vx += r1 * v1.x + r2 * v2.x + r3 * v3.x;
    vy += r1 * v1.y + r2 * v2.y + r3 * v3.y;

    //追加する：移動量が限度を超えてないか
    float vVector = sqrt(vx * vx + vy * vy);
    if (vVector > SPEED) {
       vx = (vx / vVector) * SPEED;
       vy = (vy / vVector) * SPEED;
    }

    x += vx;
    y += vy;

    if (x - R <= 0) {
      x = R;
      vx *= -1;
    }
    if (x + R >= width) {
      x = width - R;
      vx *= -1;
    }

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
    ellipse(x, y, R * 2, R * 2);
    line(x, y, x + vx * 3 , y + vy * 3);
  }

  //移動距離オブジェクトを初期化
  void clearVector() {
    v1.x = 0;
    v1.y = 0;
    v2.x = 0;
    v2.y = 0;
    v3.x = 0;
    v3.y = 0;
  }

  //衝突判定
  void check() {
    rule1();
    rule2();
    rule3();
  }//end


  // 計算：群れの中心に向かう量
  void rule1() {
     for (int i = 0; i < NUMBER; i++) {
        Ball otherBall = (Ball) others[i];
    if (this != otherBall)  {
      v1.x += otherBall.x;
      v1.y += otherBall.y;
    } // end if
    } // end for
 
    v1.x /= (NUMBER - 1);
    v1.y /= (NUMBER - 1);
   
    v1.x = (v1.x - x) / CENTER_PULL_FACTOR;
    v1.y = (v1.y - y) / CENTER_PULL_FACTOR;

  }//end rule1


  // 計算：仲間を避ける量
  void rule2() {
    for (int i = 0; i < NUMBER; i++) {
      Ball otherBall = (Ball) others[i];
      if (this != otherBall) {
        if (dist(x, y, otherBall.x, otherBall.y) < DIST_THRESHOLD) {
          v2.x -= otherBall.x - x;
          v2.y -= otherBall.y - y;
    } // end if
      } // end if
    }
  }// end rule2

  // 計算：群れの平均速度に合わせる量
  void rule3() {
     for (int i = 0; i < NUMBER; i++) {
       Ball otherBall = (Ball) others[i];
    if (this != otherBall) {
      v3.x += otherBall.vx;
      v3.y += otherBall.vy;
    } // end if
    } // end for
     
    v3.x /= (NUMBER - 1);
    v3.y /= (NUMBER - 1);
     
    v3.x = (v3.x - vx)/2;
    v3.y = (v3.y - vy)/2;
  }// end rule3
}

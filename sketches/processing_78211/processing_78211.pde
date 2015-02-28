
/** push balls each other
 *  Copyright 2011 Yutaka Kachi
 *  Licensed by New BSD License
 *
 *  複数のボールがウィンドウ内を移動する
 *  ボール同士もぶつかる。
 **/

float SPEED = 3; // 移動量5
float R;  //半径5
Ball a_ball;

void setup() {
  size(250, 250);
  frameRate(20);
  background(0);
  noFill();
  stroke(255, 255, 255);
  a_ball = new Ball(width / 2, height / 2, SPEED, SPEED * 2);
}

void draw() {
  fadeToBlack();
  a_ball.move();
  a_ball.draw(second());
}

class Ball
{
  float x, y; //ボールの現在位置（中心）
  float vx, vy; //ボールの移動量

  //コンストラクタ
  Ball(
  float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
  }

  void move() {

    x = x + vx; 
    if (x - R <= 0) {
      x = R;
      vx *= -1;
    }
    if (x + R >= width) {
      x = width - R;
      vx *= -1;
    }

    y = y + vy;
    if (y - R <= 0) {
      y = R;
      vy *= -1;
    }
    if (y + R >= height) {
      y = height - R;
      vy *= -1;    }
  }
  
  void draw(int R) {
    stroke(255);
    ellipse(x, y, R * 2, R * 2);
  }
}

//フェードアウト
void fadeToBlack() {
  noStroke();
  fill(0, 30);
  rectMode(CORNER);
  rect(0, 0, width, height);
}

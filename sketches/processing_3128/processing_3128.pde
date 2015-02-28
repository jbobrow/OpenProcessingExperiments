

void setup() {
  size(400, 400);
  stroke(0);
  strokeWeight(10);
  strokeCap(PROJECT);
  ellipseMode(CENTER);
}

float power = 0;
float power_step = 2.0;
boolean powerup = true;
float powerMax = 200;
/* 打ち出しパワー */
float powerFactor = 1.5;

/* 開始点 */
float originX = 300;
float originY = 300;

/* ボールの移動量 */
float ballPowerX = 0;
float ballPowerY = 0;

/* 角度スライダーの左上の点 */
float sliderX = 0;
float sliderY = 0;

/* ボールのX座標 */
float ballX = 0;
float ballY = 0;

/* ボールが飛んでるかどうか */
boolean startBall = false;

/* 重力 */
float gravity = 0.7;

/* 空気抵抗 */
float resistance = 0.01;

void draw(){
  /* 背景 */
  background(255);
  fill(0);
  
  /* パワーゲージ */
  drawPowerGage();

  /* 方向表示 */
  drawDirection();
  
  /* ボール表示 */
  drawBall();
}

/* パワーゲージ */
void drawPowerGage(){
  fill(255, 0, 0);
  stroke(255, 0, 0);
  rect(350 ,300 - powerMax , 25, powerMax);

  fill(0);
  stroke(0);
  rect(350 ,300 - power , 25, power);
  
  if(powerup) {
    power += power_step ;
    if(power >= powerMax) {
      powerup = false;
    }
  } else {
    power -= power_step ;
    if(power <= 0) {
      powerup = true;
    }
  }
}

/* 方向表示 */
void drawDirection(){
  fill(0);
  stroke(0);
  sliderX = directionX( originX, originY, 50);
  sliderY = directionY( originX, originY, 50);
  line(originX - sliderX, originY - sliderY, originX, originY);
}

/* ボールを塗る */
void  drawBall(){
  
  if(startBall) {
    ellipse(ballX, ballY, 10, 10);
    /* 重力と空気抵抗を加味 */
    ballPowerY -= gravity;
    ballPowerX *= (1 - resistance);
    ballX -= ballPowerX * 0.1;
    ballY -= ballPowerY * 0.1;
  }
}

/* 方向バーのX座標 */
float directionX(float x, float y, float r) {
  float xDistance = abs(x - min(mouseX, x));
  float yDistance = abs(y - min(mouseY, y));
  float distance = sqrt(pow(xDistance, 2) + pow(yDistance, 2));
  return xDistance * r / distance;
}

/* 方向バーのY座標 */
float directionY(float x, float y, float r) {
  float xDistance = abs(x - min(mouseX, x));
  float yDistance = abs(y - min(mouseY, y));
  float distance = sqrt(pow(xDistance, 2) + pow(yDistance, 2));
  return yDistance * r / distance;
}

/* マウス押された */
void mousePressed() {
  ballX = originX;
  ballY = originY;
  float p = power / powerMax;
  println("power = " + p);
  ballPowerX = (sliderX * p + 2) * powerFactor;
  ballPowerY = (sliderY * p + 2) * powerFactor;
  startBall = true;
}



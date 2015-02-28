
//@shinrobo
//Report NO.14 Processing-6
//課題14

int MaxColor;               //色の最大値
int Length = 21;            //配列の要素数
float[] X = new float[Length];      //物体X座標配列
float[] Y = new float[Length];      //物体Y座標配列
float[] Spx = new float[Length];    //物体X方向の増加分配列
float[] Spy = new float[Length];    //物体Y方向の増加分配列
float Radius;               //物体の半径
boolean flag;               //クリック時のフラグ

void setup() {
  size(400, 400);
  MaxColor = width;
  colorMode(HSB, MaxColor);
  background(MaxColor - 1);
  noStroke();
  frameRate(50);
  smooth();

  Radius = 15;
  flag = false;
  
  //配列の初期化
  for (int i = 0; i < Length; i++) {
    X[i] = random(Radius, width - Radius);
    Y[i] = random(Radius, height - Radius);
    Spx[i] = random(3);
    Spy[i] = random(3);
  }
}

void draw() {
  fadeOut();
  
  //すべてのボールを動かす
  moveballs();

  //マウスのX座標で色を変化させる
  fill(mouseX, MaxColor * 0.5, MaxColor);
  //ellipseを描く
  for (int i = 0; i < Length; i++) {
    ellipse(X[i], Y[i], Radius * 2, Radius * 2);
  }
}

//すべてのボールを動かす
//マウスのY座標でスピードを変える
void moveballs() {
  float accel = max((height - mouseY) / 100, 1);
  for (int i = 0; i < Length; i++) {
    if (flag == true) {
      X[i] = X[i] + Spx[i] * -accel ;
      Y[i] = Y[i] + Spy[i] * -accel;
    }
    if (flag == false) {
      X[i] = X[i] - Spx[i] * -accel;
      Y[i] = Y[i] - Spy[i] * -accel;
    }
    bounce(i);          //すべての配列座標について跳ね返り判定を行う
  }
}
//跳ね返り判定
void bounce(int i) {
  float bMinX = Radius;
  float bMaxX = width - Radius;
  float bMinY = Radius;
  float bMaxY = height - Radius;

  if (X[i] < bMinX || X[i] > bMaxX) Spx[i] = -Spx[i];
  if (Y[i] < bMinY || Y[i] > bMaxY) Spy[i] = -Spy[i];
}
//フェードアウト
void fadeOut() {
  noStroke();
  fill(99, 30);
  rectMode(CORNER);
  rect(0, 0, width, height);
}
//クリック時の挙動
void mousePressed() {
  if (mouseButton == LEFT) flag = true;
  if (mouseButton == RIGHT) flag = false;
}
                                


//
// 3層パーセプトロン型の神経回路網モデル
// 学習アルゴリズム：誤差逆伝播法（バックプロバゲーション）
// 2次元座標と出力の関係を学習する
//
// 学習誤差と推定誤差を表示する
// 学習例をマウスで指定する
//
//                                         2004年11月28日（日）松野哲也
// updated 2004-11-30
// updated 2014-09-09 （約10年後！）
//

void setup() {
  size(600, 200);
  colorMode(HSB, 1.0); //色の指定方法の指定（マンセルの方法）
}

boolean flag_once = false;
boolean flag_exset = false;
boolean flag_pause = false;
int nu = 500; //学習サンプル数上限
int n = 0;    //学習サンプル数
float[] rpx = new float[nu]; //学習サンプル（ｘ座標）
float[] rpy = new float[nu]; //学習サンプル（ｙ座標）

int M = 20; //中間層のニューロンの数
float[] wx = new float[M+1]; //結合係数：入力から中間層（ｘ座標）
float[] wy = new float[M+1]; //結合係数：入力から中間層（ｙ座標）
float[] wf = new float[M+1]; //結合係数：中間層から出力層
//結合係数 wf[0] は中間層のダミーニューロンから出力層へのもの
float[] w0 = new float[M+1]; //結合係数：入力層のダミーニューロンから中間層へ

float[] wx_tmp = new float[M+1];
float[] wy_tmp = new float[M+1];
float[] wf_tmp = new float[M+1];
float[] w0_tmp = new float[M+1];
float beta_o = 20.0;  //非線形度（出力層ニューロン）
float beta_m = 200.0; //非線形度（中間層ニューロン）
float rr  = 0.1;  //結合係数の初期値のばらつき幅
float eps = 0.002; //結合係数の更新ステップ幅

int   t = 0;       //学習ステップ
float err_learn;   //学習誤差
float err_predict; //推定誤差

///////////////////////////////////////////////////////////////
//メインルーチン
void draw() {
  if (flag_once == false) { //一度だけ実行
    initialize_connections(); //結合係数の初期化
    flag_once = true;
  }
  drawOutput();   //出力ニューロンの出力の表示
  drawExamples(); //学習例の表示
  if (flag_exset == true) {
    if (flag_pause == false) { 
      learning();
    }  //学習の実行 
    drawErrors(); //誤差の表示
  } else {
    //setExamples(); //学習例のセット
  }
  drawPointer();
}
///////////////////////////////////////////////////////////////

void learning() { //学習ルーチン：バックプロバゲーション
  float delta, deltaj;
  float nabla_wf, nabla_wx, nabla_wy, nabla_w0;
  for (int l = 1; l<= 1000; l++) { //学習メソッド1回の呼び出しで 1000 回更新する
    int k = (int)floor(random(0, n)); //学習サンプルをランダムに１つ選ぶ
    //println(k);
    //中間層から出力層への結合係数の更新
    delta = (g(rpx[k], rpy[k]) - judge(rpx[k], rpy[k])) * g(rpx[k], rpy[k]) * (1.0 - g(rpx[k], rpy[k])); 
    for (int j = 0; j <= M; j++) {
      nabla_wf = delta * f(j, rpx[k], rpy[k]);
      wf_tmp[j] = wf[j] -eps * nabla_wf;
    }
    //入力層から中間層への結合係数の更新
    for (int j = 1; j <= M; j++) {
      deltaj = delta * wf[j] * f(j, rpx[k], rpy[k]) * (1.0 - f(j, rpx[k], rpy[k]));
      nabla_wx = deltaj * rpx[k];
      nabla_wy = deltaj * rpy[k];
      nabla_w0 = deltaj;
      wx_tmp[j] = wx[j] -eps * nabla_wx;
      wy_tmp[j] = wy[j] -eps * nabla_wy;
      w0_tmp[j] = w0[j] -eps * nabla_w0;
    }
    //更新
    for (int j = 0; j<=M; j++) {
      wf[j] = wf_tmp[j];
    }
    for (int j=1; j <= M; j++) {
      wx[j] = wx_tmp[j];
      wy[j] = wy_tmp[j];
      w0[j] = w0_tmp[j];
    }
  }
  calcErrors();
  t++;
}

float f(int i, float x, float y) { //中間層ニューロン
  if (i == 0) { 
    return 1.0;
  }
  float u = wx[i] * x + wy[i] * y + w0[i];
  return 1.0 / (1.0 + (float)Math.exp(- beta_m * u));
}

float g(float x, float y) { //出力層ニューロン
  float u = 0;
  for (int i = 0; i <= M; i++) {
    u += wf[i] * f(i, x, y);
  }
  return 1.0 / (1.0 + (float)Math.exp(- beta_o * u));
}
void drawOutput() { //出力層ニューロンの出力の描画
  for (float y = -1; y <= 1; y += 0.02) {
    for (float x = -1; x <= 1; x += 0.02) {
      float c = g(x, y);
      fill(0.7*c, 1, 1);
      rectMode(CENTER); 
      noStroke();
      rect(X(x), Y(y), 5, 5);
    }
  }
}

void drawExamples() { //学習サンプル描画
  for (int i = 0; i < n; i++) {
    ellipseMode(CENTER);
    if (judge(rpx[i], rpy[i]) == 1) { //教師の判定による色分け
      fill(0.7, 1, 1); //青色
    } else {
      fill(0, 1, 1);   //赤色
    }
    stroke(0); 
    ellipse(X(rpx[i]), Y(rpy[i]), 10, 10);
  }
  for (float yy = -1; yy <= 1; yy += 0.005) {
    //point(X(- 0.7 * cos(2*PI * yy)), Y(yy));
    fill(0, 0, 0);
    stroke(0); 
    ellipse(X(concept(yy)), Y(yy), 4, 4);
  }
}

void drawPointer() {  // マウス位置の描画
  fill(1);
  float mx = mouseX;
  float my = mouseY;
  if (mx < height - 10) {
    ellipse(mx, my, 10, 10);
  }
}

int judge(float x, float y) { //教師による判定
  if (x > concept(y)) {
    return 1;
  } else {
    return 0;
  }
}

float concept(float x) { //学習目標
  return -0.5 * cos(2 * PI * x);
}

void calcErrors() { //誤差の計算
  //学習誤差の計算
  float error_learning = 0; //学習誤差
  for (int k = 0; k < n; k++) {
    //error_learning += (judge(rpx[k],rpy[k])-step(g(rpx[k],rpy[k])))*(judge(rpx[k],rpy[k])-step(g(rpx[k],rpy[k])));
    error_learning += (judge(rpx[k], rpy[k])-g(rpx[k], rpy[k]))*(judge(rpx[k], rpy[k])-g(rpx[k], rpy[k]));
  }
  error_learning = error_learning / n;
  //推定誤差の計算
  float counter = 0;
  float error_predicting = 0; //推定誤差
  for (float y = -1; y <= 1; y += 0.1) {
    for (float x = -1; x <= 1; x += 0.1) {
      error_predicting += (judge(x, y) - g(x, y))*(judge(x, y) - g(x, y));
      counter++;
    }
  }
  error_predicting = error_predicting / counter;
  //テストプリント
  //println(error_learning + " " + error_predicting);
  err_learn = error_learning;
  err_predict = error_predicting;
}

void drawErrors() { //学習誤差の表示
  float xerr = X(t)/40 % (2*height-20) +height+10;
  fill(0.8);
  noStroke();
  rectMode(CORNER);
  rect(xerr, 0, 6, height);

  fill(1); //白色
  stroke(0); 
  ellipse(xerr, Y(err_learn*10 / 2)+height/2, 4, 4);   //学習誤差表示
  fill(0); //黒色
  stroke(0); 
  ellipse(xerr, Y(err_predict*10 / 2)+height/2, 4, 4); //推定誤差表示
}

float step(float x) {
  if ( x >= 0.5) { 
    return 1;
  } else { 
    return 0;
  }
}

void initialize_connections() { //結合係数の初期化ルーチン
  //結合係数初期化
  for (int i = 0; i <= M; i++) {
    wx[i] = random(-rr, rr);
    wy[i] = random(-rr, rr);
    wf[i] = random(-rr, rr);
    w0[i] = random(-rr, rr);
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R' ) {
    initialize_connections();
    println("connections initialized.");
    t=0;
    fill(160);
    noStroke();
    rectMode(CORNER);
    rect(height+8, 0, 2*height, height);
  }
}

void mousePressed() {
  float mX = mouseX;
  float mY = mouseY;
  if (n < nu && mX < width/3) {
    rpx[n] =   mX/(height/2.0) - 1.0;
    rpy[n] = - mY/(height/2.0) + 1.0;
    //println("The " + (n+1) + " th example: " + "( " + X(rpx[n]) + ", " + Y(rpy[n]) + " )");
    n++;
    flag_exset = true; // JS版では，１つ例題をセットしたらすぐに走り出すようにした．
  }
  if (n >= nu) {
    println("examples array full !!");
  }
}

float X(float x) { //座標変換（ｘ座標）
  return x*height/2 + height/2;
}
float Y(float y) { //座標変換（ｙ座標）
  return -y*height/2 + height/2;
}


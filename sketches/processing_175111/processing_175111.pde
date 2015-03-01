
//////////////////////////////////////////////////////////////
// example 1.2 バウンドするボール (Shiffman, p.30)（改変）
// ボールオブジェクトの導入
//////////////////////////////////////////////////////////////
/////大域変数宣言エリア
int N =100;
Ball[] ball = new Ball[N];  //「ボールオブジェクト」ballの宣言
/////セットアップ
void setup() {
  size(640, 360);
  colorMode(HSB,360,100,100);
  for (int i = 0; i<N; i++) {
    ball[i] = new Ball(100, 100, random(1,100), random(1,100), random(1,100)
    ); //ballオブジェクト生成
  }
}

/////メインループ
void draw() {
  background(359);         //背景は白色
  for (int i = 0; i<N; i++) {
    ball[i].update();           //状態の更新
    ball[i].checkBound();    //端でバウンドさせる
    //ball[i].checkBoundBall();
    ball[i].display();          //表示させる
  }
}

//////////////////////////////////
/////クラス定義エリア/////////////
class Ball {  //「ボールクラス」の定義
  PVector location;  //位置オブジェクト宣言
  PVector velocity;  //速度オブジェクト宣言
  color col;
  Ball(float x0, float y0, float vx0, float vy0, float m) {  //コンストラクタ
    location = new PVector(x0, y0);   //位置オブジェクト生成
    velocity = new PVector((vx0 + m)/50, (vy0 + m)/50); //速度オブジェクト生成
    col = color(169+(356-169)*m/101,99,99);
  }
  
  void update() {  //状態の更新
    location.add(velocity);  //位置に速度を加算
  }
  
  void checkBound() {  //端でバウンドさせる
    if ((location.x > width)||(location.x < 0)) {
      velocity.x *= -1;  //速度のx成分の符号を変える
    }
    if ((location.y > height)||(location.y < 0)) {
      velocity.y *= -1;  //速度のy成分の符号を変える
    }
  }
 
  void display() {  //ボールの描画
    stroke(0);               //ボールの縁の色は黒色
    fill(col);               //ボールの色は灰色
    ellipse(location.x, location.y, 16, 16);  //ボールの描画
    }
  
  void set(float x0, float y0, float vx0, float vy0, float m){  //位置と速度をセット
  location.set(x0, y0,0);    //位置のセット
  velocity.set((vx0 + m)/50, (vy0 + m)/50,0);  //速度のセット
  }
}

void mousePressed(){
  for(int i=0; i<N; i++){
    ball[i].set(mouseX,mouseY,random(-100,100),random(-100,100), random(1,100));
  }
}


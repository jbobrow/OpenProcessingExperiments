
//////////////////////////////////////////////////////////////
// example 1.2 バウンドするボール (Shiffman, p.30)（改変）
// ボールオブジェクトの導入
//////////////////////////////////////////////////////////////
/////大域変数宣言エリア
int N = 10;  //個体数
Ball[] ball = new Ball[N];  //「ボールオブジェクト」ballの宣言
/////セットアップ
void setup(){
  size(640,360);
  for(int i = 0; i < N; i++){
    //colorMode(HSB);
    color color1 = color(random(255),random(255),random(255));
    ball[i] = new Ball(random(500), random(500), random(10), random(10), color1); //ballオブジェクト生成
  }
}
/////メインループ
void draw(){
  background(255);         //背景は白色
  for(int i = 0; i < N; i++){
    ball[i].update();           //状態の更新
    ball[i].checkBound();       //端でバウンドさせる
    ball[i].display();          //表示させる
  }
}
//////////////////////////////////
/////クラス定義エリア/////
class Ball{  //「ボールクラス」の定義
  PVector location;  //位置オブジェクト宣言
  PVector velocity;  //速度オブジェクト宣言
  color color0;
  Ball(float x0, float y0, float vx0, float vy0, color color1){  //コンストラクタ
    location = new PVector(x0,y0);   //位置オブジェクト生成
    velocity = new PVector(vx0,vy0); //速度オブジェクト生成
    color0 = color1;
  }
  void update(){  //状態の更新
    location.add(velocity);  //位置に速度を加算
  }
  void checkBound(){  //端でバウンドさせる
    if((location.x > width)||(location.x < 0)){
      velocity.x *= -1;  //速度のx成分の符号を変える
    }
    if((location.y > height)||(location.y < 0)){
      velocity.y *= -1;  //速度のy成分の符号を変える
    } 
  }
  void display(){  //ボールの描画
    stroke(0);               //ボールの縁の色は黒色
    fill(color0);               //ボールの色は灰色
    ellipse(location.x, location.y, 16, 16);  //ボールの描画
  }
  void set(float x0, float y0, float vx0, float vy0){  //位置と速度をセット
    //location.set(x0,y0);    //位置のセット
    location.x = x0;
    location.y = y0;
    //velocity.set(vx0,vy0);  //速度のセット
    velocity.x = vx0;
    velocity.y = vy0;
  }
}
/////関数定義エリア/////
void mousePressed(){    //マウスボタンが押されたら呼び出される関数
  for(int i = 0; i < N; i++){
    ball[i].set(mouseX,mouseY,random(-10,10),random(-10,10));
  }
}
///// EOF

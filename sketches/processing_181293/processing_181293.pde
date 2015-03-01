
//////////////////////////////////////////////////////////////
// example 1.2 バウンドするボール (Shiffman, p.30)（改変）
// ボールオブジェクトの導入
//////////////////////////////////////////////////////////////
/////大域変数宣言エリア
int N = 20;
Ball[] ball = new Ball[N];  //「ボールオブジェクト」ballの宣言
/////セットアップ
void setup(){
  colorMode(HSB);
  size(640,360);
  for(int i = 0; i < N; i++) { 
    ball[i] = new Ball(100, 100, 2.5, 5,20); //ballオブジェクト生成
  }
}
/////メインループ
void draw(){
  background(255);         //背景は白色
  for (int i = 0; i < N; i++){
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
  int Col;           //ボールの色
  Ball(float x0, float y0, float vx0, float vy0, int col){  //コンストラクタ
    location = new PVector(x0,y0);   //位置オブジェクト生成
    velocity = new PVector(vx0,vy0); //速度オブジェクト生成
   
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
    fill(Col,255,255);               //ボールの色は灰色
    ellipse(location.x, location.y, 16, 16);  //ボールの描画
  }
  void set(float x0, float y0, float vx0, float vy0,int col){  //位置と速度をセット
    location.set(x0,y0,0);    //位置のセット
    velocity.set(vx0,vy0,0);  //速度のセット
    Col = col; //色
  }
}
/////関数定義エリア/////
void mousePressed(){    //マウスボタンが押されたら呼び出される関数
 for(int i = 0; i < N; i++) { 
     ball[i].set(mouseX,mouseY,random(-10,10),random(-10,10),int(random(20,200)));
     }
}
///// EOF

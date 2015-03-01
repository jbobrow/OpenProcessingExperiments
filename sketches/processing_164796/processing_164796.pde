
//////////////////////////////////////////////////////////////
// example 1.2 バウンドするボール (Shiffman, p.30)（改変）
// ボールオブジェクトの導入
// ボールを複数に（オブジェクトの配列）
// 3D version
//////////////////////////////////////////////////////////////
/////大域変数宣言エリア
float Lx, Ly, Lz;
int N = 20;                   //ボールの個数
Ball[] balls = new Ball[N];   //「ボールオブジェクト」ballの宣言
int count;  //カウンタ
/////セットアップ
void setup(){
  size(640,480,P3D);
  colorMode(HSB); //カラーモードはHSBモード
  for(int i = 0; i < N; i++){  //ballオブジェクト生成
    balls[i] = new Ball(100,100,height/2,random(-10,10),random(-10,10),random(-10,10),(float)i/N*256); 
  }
  Lx = 500; Ly = 300; Lz = 500;
  count = 0;
}
/////メインループ
void draw(){
  background(100);
  lights();  //ライト
  camera(2*mouseX-40, 2*mouseY-80 ,850,Lx/2,Ly/2,Lz/2,0,1,0); //カメラ
  drawBoundary();  //境界の描画
  for(int i = 0; i < N; i++){
    balls[i].update();           //状態の更新
    balls[i].checkBound();       //端でバウンドさせる
    balls[i].display();          //表示させる
  }
  textSize(70);
  fill(100,255,255);
  text("Ariake NCT "+ count,0,-10,0);
  count++;
}
//////////////////////////////////
/////クラス定義エリア/////
class Ball{  //「ボールクラス」の定義
  PVector location;  //位置オブジェクト宣言
  PVector velocity;  //速度オブジェクト宣言
  float clr;         //色
  Ball(float x0, float y0, float z0, float vx0, float vy0, float vz0, float clr0){  //コンストラクタ
    location = new PVector(x0,y0,z0);   //位置オブジェクト生成
    velocity = new PVector(vx0,vy0,vz0); //速度オブジェクト生成
    clr = clr0;                      //色指定
  }
  void update(){  //状態の更新
    location.add(velocity);  //位置に速度を加算
  }
  void checkBound(){  //端でバウンドさせる
    if((location.x > Lx)||(location.x < 0)){
      velocity.x *= -1;  //速度のx成分の符号を変える
    }
    if((location.y > Ly)||(location.y < 0)){
      velocity.y *= -1;  //速度のy成分の符号を変える
    }
    if((location.z > Lz)||(location.z < 0)){
      velocity.z *= -1;  //速度のy成分の符号を変える
    } 
  }
  void display(){
    pushMatrix();
    translate(location.x, location.y, location.z);
    fill(clr,255,255);
    if(mousePressed == true){
      noStroke();
      sphere(20);
    }else{
      box(20);
    }
    popMatrix();
  }
  void set(float x0, float y0, float z0, float vx0, float vy0, float vz0){  //位置と速度をセット
    location.set(x0,y0,z0);     //位置のセット
    velocity.set(vx0,vy0,vz0);  //速度のセット
  }
}
/////関数定義エリア/////
void drawBoundary(){ //境界の描画
  noFill();
  stroke(0);
  pushMatrix();
  translate(Lx/2, Ly/2, Lz/2);
  box(Lx,Ly,Lz);
  popMatrix();
}
///// EOF

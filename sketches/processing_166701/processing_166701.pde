
/////////////////////////////////////////////////////////////////////////////
// Example 1.8: Motion 101 速度と加速度(Shiffman, p.44)
// 発展（ゲーム的に）(inspired by Exercise 1.5, Shiffman)
/////////////////////////////////////////////////////////////////////////////
////////// 大域変数宣言エリア
Mover mover;  //大域変数の宣言（Mover型の「変数」 mover）
int time = 0; //時刻
////////// セットアップエリア
void setup(){
  size(640,360);       //表示窓サイズの指定
  mover = new Mover(); //オブジェクト（インスタンス）moverの生成
}

////////// メインルーチン（無限ループ）
void draw(){
  background(130);    //背景色
  displayStartGoal(); //スタート地点とゴール地点の表示
  
  mover.update();     //オブジェクトmoverの状態の更新
  mover.checkEdges(); //窓の端かどうかをチェック
  mover.display();    //表示
  time++;
}

///////////////////// 関数やクラスの定義エリア
class Mover{ //// クラスMoverの定義
  PVector location;     //位置（PVector型）
  PVector velocity;     //速度（PVector型）
  PVector acceleration; //加速度（PVector型）
  float   topspeed;     //速度の大きさ制限（float型）
  PVector delta_a_x;    //加速度変化（x成分）
  PVector delta_a_y;    //加速度変化（y成分）
  float delta_a = 0.01;
  
  Mover(){ //コンストラクタ（初期状態の設定に用いられる）
    location = new PVector(width/2, height/2); //初期位置の設定
    velocity = new PVector(0,0);               //初期速度の設定
    acceleration = new PVector(0, 0);  //初期か速度の設定
    topspeed = 10;                     //速さ制限
    delta_a_x = new PVector(delta_a, 0);  //加速度の変化（x成分）
    delta_a_y = new PVector(0, delta_a);  //加速度の変化（y成分）
  }
  
  void update(){ //状態更新メソッド
    velocity.add(acceleration); //速度は加速度によって変化する
    velocity.limit(topspeed);   //速さは topspeed によって制限される
    location.add(velocity);     //位置は速度によって変化する
  }
  
  void accPx(){
    acceleration.add(delta_a_x);
  }  
  void accMx(){
    acceleration.sub(delta_a_x);
  }
  void accPy(){
    acceleration.sub(delta_a_y);
  }  
  void accMy(){
    acceleration.add(delta_a_y);
  }
  
  void reset(){
    location.x = width/2;
    location.y = height/2;
    velocity.x = 0;
    velocity.y = 0;
    acceleration.x = 0;
    acceleration.y = 0;
  }
  
  void display(){ //表示用メソッド
    stroke(0);
    fill(0,0,255);
    ellipse(location.x, location.y, 30, 30);
    fill(0);
    textSize(24);
    text("a_x = " +  acceleration.x, location.x - 20, location.y - 50);
    text("a_y = " + -acceleration.y, location.x - 20, location.y - 30);
  }
  
  void checkEdges(){ //窓の端かどうかをチェックするためのメソッド
    if(location.x > width){     //もしも右にはみ出したら
      location.x = 0;
    } else if(location.x < 0){  //もしも左にはみ出したら
      location.x = width;
    }
    
    if(location.y > height){    //もしも下にはみ出したら
      location.y = 0;
    } else if(location.y < 0){  //もしも上にはみ出したら
      location.y = height;
    }
  }
}
//////////
void displayStartGoal(){ //スタート地点とゴール地点の表示
  stroke(255,0,0);
  noFill();
  ellipse(width/2, height/2, 50, 50); //スタート地点
  fill(255,0,0);
  text("start", width/2 - 20, height/2 + 50);
  stroke(0,255,0);
  noFill();
  ellipse(width/2 + 150, height/2 - 100, 50, 50);
  fill(0,255,0);
  text("goal", width/2 +150 - 20, height/2 -100 + 50);
  
  fill(0,255,0);
  text("time = " + time, width - 200, height - 20); 
  fill(0);
  text("Press R key to restart", 10, height - 20);
}
////////// ユーザインタフェース
void keyPressed(){
  if(keyCode == RIGHT){
    mover.accPx();
  }
  if(keyCode == LEFT){
    mover.accMx();
  }
  if(keyCode == UP){
    mover.accPy();
  }
  if(keyCode == DOWN){
    mover.accMy();
  }
  if(key == 'r' || key == 'R'){
    mover.reset();
    time = 0;
  }
}


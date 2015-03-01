
/////////////////////////////////////////////////////////////////////////////
// Example 1.11: Motion 101 加速度の対話的処理(シフマン, p.50)
// 複数物体（多体）
/////////////////////////////////////////////////////////////////////////////
////////// 大域変数宣言エリア
////Mover mover;  //大域変数の宣言（Mover型の「変数」 mover）
Mover[] movers = new Mover[10];

////////// セットアップエリア
void setup(){
  size(1040,660);       //表示窓サイズの指定
  colorMode(HSB);
  ////mover = new Mover(); //オブジェクト（インスタンス）moverの生成
  for(int i = 0; i < movers.length; i++){
    movers[i] = new Mover();
  }
}

////////// メインルーチン（無限ループ）
void draw(){
  background(255);    //背景色を白色に
  
  for(int i = 0; i < movers.length; i++){
    movers[i].update();     //オブジェクトmoverの状態の更新
    movers[i].checkEdges(); //窓の端かどうかをチェック
    movers[i].display();    //表示
  }
}

///////////////////// 関数やクラスの定義エリア
class Mover{ //// クラスMoverの定義
  PVector location;     //位置（PVector型）
  PVector velocity;     //速度（PVector型）
  PVector acceleration; //加速度（PVector型）
  float   topspeed;     //速度の大きさ制限（float型）
  float   weight;       //重さ
  float     hue;          //色
  
  Mover(){ //コンストラクタ（初期状態の設定に用いられる）
    location = new PVector(random(width), random(height)); //初期位置の設定
    velocity = new PVector(0,0);               //初期速度の設定
    topspeed = 20;  //速度制限
    weight = random(1,200);
    hue = random(255);
  }
  
  void update(){ //状態更新メソッド
    PVector mouse = new PVector(mouseX, mouseY); //マウスポインタの位置ベクトル
    PVector dir = PVector.sub(mouse,location);   ////「static」
    dir.normalize();     //正規化
    dir.mult(weight*0.01);       //スケーリング
    acceleration = dir;  //加速
    
    velocity.add(acceleration); //速度は加速度によって変化する
    velocity.limit(topspeed);   //速度は topspeed によって制限される
    location.add(velocity);     //位置は速度によって変化する
  }
  
  void display(){ //表示用メソッド
    stroke(0);
    fill(hue,255,255);
    ellipse(location.x, location.y, 210-weight, 210-weight);
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

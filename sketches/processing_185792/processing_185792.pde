
///////////////////////////////////////////////////////////////
// Inspired by Example 2.8 (シフマン, p.84) 
// repulsive particles 反発しあう粒子たち
// modified version
///////////////////////////////////////////////////////////////
int N = 60; //Moverオブジェクトの数
Mover[] movers = new Mover[N]; //Moverクラスのオブジェクトの配列
Attractor a;                   //Attractorクラスのオブジェクト
float  G = 30.0;               //重力定数
float  Mass_p = 1.0;           //粒子たちの質量
float  velo_MAX = 1;           //速さ制限（これを超えたらリセット）
float  coef = 0.01;            //抗力係数
/////////////////////////////////////
void setup(){ ////////セットアップ
  size(500, 500); //窓のサイズを指定
  colorMode(HSB); //カラーモードはHSBモードで
  
  for(int i = 0; i < N; i++){
    if(i%2 == 1){
      movers[i] = new Mover(Mass_p, random(width), random(height), true); //オブジェクト生成
    }else{
      movers[i] = new Mover(Mass_p, random(width), random(height), false); //オブジェクト生成
    }
  }
  
  a = new Attractor(); //オブジェクト生成
}
/////////////////////////////////////
void draw(){ ////////メインループ
  background(0);
  fill(200,20);            //透明度指定
  rect(0,0,width,height);  //箱を描く
  
  a.display(); //attractorの表示
    
    
  for(int i = 0; i < N; i++){
     
    PVector force = a.attract(movers[i]); //attractor a がmover[i]へ及ぼす力を計算
    movers[i].applyForce(force);   //力を印加
    
    if(mousePressed){ ////もしもマウスボタンが押されたら
      if(movers[i].plus == true){
        movers[i].plus = false;
      }else{
        movers[i].plus = true;
      }
    }
    
    for(int j = 0; j < N; j++){  //相互作用処理
      if(i != j){
        PVector force_m = movers[j].attract(movers[i]); //物体 j が物体 i に及ぼす力を計算
        movers[i].applyForce(force_m);                  //物体 i への力の適用
      }
    }
    
    movers[i].update();                //物体の状態を更新
    movers[i].checkVelocityForReset(); //制限速さを超えたらリセットする
    movers[i].display();               //物体の表示
    movers[i].periodicBoundary();      //周期的境界条件の実現
  }
}
/////////////////////////////////////
//// クラスや関数の定義
/////////////////////////////////////
class Mover{ //////// Moverクラスの定義
  PVector location;     //位置
  PVector velocity;     //速度
  PVector acceleration; //加速度
  float   mass;         //質量
  float   s_max = 1.0;  //速度設定範囲
  boolean plus;
  
  Mover(float m, float x, float y, boolean p){  //コンストラクタ
    plus = p;
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(random(-s_max, s_max),random(-s_max, s_max));
    acceleration = new PVector(0,0);
  }
  
  void applyForce(PVector force){  ////ニュートンの第２法則
    PVector f = PVector.div(force, mass); //力を受け取って質量で除算
    acceleration.add(f);                  //加速度に加算
  }
  
  ////////
  PVector attract(Mover m){ ////引力（ここでは斥力：静電反発力）
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag(); //物体とattractorの距離を取得
    force.normalize();            //規格化（長さを１に）
    float strength = -(G * mass * m.mass) / (distance * distance); //斥力
    force.mult(strength);         //単位ベクトルに万有引力の大きさを書ける
    if(plus != m.plus){
      force.mult(-1);
    }
    return force;
  }
  ////////
  
  void update(){   ////状態更新
    velocity.add(acceleration); //加速度を「積分」して速度に
    velocity.limit(velo_MAX);
    location.add(velocity);     //速度を「積分」して位置に
    acceleration.mult(0);       //加速度のクリア（ゼロをかけ算）（毎回クリア）
  }
  
  void display(){ ////表示
    stroke(180,255,255); //ふちの色を指定
    fill(100, 255, 255); //中身の色を指定
    if(plus == true){
      fill(255, 255, 255);
    }
    ellipse(location.x, location.y, 10, 10);
  }
  
  void periodicBoundary(){ ////周期的境界条件の実現
    if(location.x > width){
      location.x = 0;
    } else if(location.x < 0){
      location.x = width;
    }
    
    if(location.y > height){
      location.y = 0;
    } else if(location.y < 0){
      location.y = height;
    }
  }
  
  void checkVelocityForReset(){
    if(velocity.mag() > velo_MAX){
      velocity.mult(0);
    }
  }
}
////////
class Attractor{ ////////Attractorクラスの定義
  float mass;       //質量
  PVector location; //位置
  
  Attractor(){ //コンストラクタ
    location = new PVector(width/2, height/2); //位置は窓の中央
    mass = 1;
  }
  
  PVector attract(Mover m){ ////引力
    PVector force = PVector.sub(location, m.location);
    ///float distance = force.mag(); //物体とattractorの距離を取得
    float distance = 20;             //固定値すなわち，コーン（円錐）ポテンシャル
    force.normalize();               //規格化（長さを１に）
    float strength = (G * mass * m.mass) / (distance * distance); //引力
    force.mult(strength);           //単位ベクトルに引力の大きさを書ける
    return force;
  }
  
  void display(){ ////表示
    noStroke();
    fill(20, 5);
    ellipse(location.x, location.y, width, height);
  }
}
////////
void mouseReleased(){ ///マウスボタンを離したら各粒子の速度をランダムにセット
  for(int i = 0; i < N; i++){
    movers[i].velocity.set(random(-1,1),random(-1,1),0); 
    // "the 3rd argument ",0" is necessary in Processing 1.5.1
    // while, it is not necessary for Processing 2
  }
}
////////

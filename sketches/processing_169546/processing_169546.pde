
///////////////////////////////////////////////////////////////
// Example 2.8 (シフマン, p.84) 引力，多体
// 惑星同士も相互作用
// modified version
///////////////////////////////////////////////////////////////
int N = 20; //Moverオブジェクトの数
Mover[] movers = new Mover[N]; //Moverクラスのオブジェクトの配列
Attractor a;                   //Attractorクラスのオブジェクト（ここではリペラ）
float  G = 3.0;                //重力定数
float  mass_MIN = 2.0;   //質量設定最小値
float  mass_MAX = 10.0;  //質量設定最大値
float  velo_MAX = 20;    //速さ制限（これを超えたらリセット）
/////////////////////////////////////
void setup(){ ////////セットアップ
  size(640, 640); //窓のサイズを指定
  colorMode(HSB); //カラーモードはHSBモードで
  
  for(int i = 0; i < N; i++){
    movers[i] = new Mover(random(mass_MIN, mass_MAX), random(width), random(height)); //オブジェクト生成
  }
  
  a = new Attractor(); //オブジェクト生成
}
/////////////////////////////////////
void draw(){ ////////メインループ
  //background(255);
  fill(255,10);            //透明度指定
  rect(0,0,width,height);  //箱を描く
    
  for(int i = 0; i < N; i++){
    
    if(mousePressed){ ////もしもマウスボタンが押されたらリペラ処理
      a.location.set(mouseX, mouseY);
      a.display(); //attractorの表示
      PVector force = a.attract(movers[i]); //attractor a がmover[i]へ及ぼす力を計算
      movers[i].applyForce(force);   //力を印加
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
  fill(120);
  textSize(20);
  text("push the mouse button for a repeller", 20, height - 20);
  fill(30,255,255);
  text("Planets in Torus", 20, 40);
}
/////////////////////////////////////
//// クラスや関数の定義
class Mover{ //////// Moverクラスの定義
  PVector location;     //位置
  PVector velocity;     //速度
  PVector acceleration; //加速度
  float   mass;         //質量
  float   s_max = 1.0;  //速度設定範囲
  
  Mover(float m, float x, float y){  //コンストラクタ
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
  PVector attract(Mover m){ ////万有引力ベクトル
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag(); //物体とattractorの距離を取得
    distance = constrain(distance, 5.0, 25.0); //相互作用距離の制限
    force.normalize();            //規格化（長さを１に）
    float strength = (G * mass * m.mass) / (distance * distance); //万有引力
    force.mult(strength);         //単位ベクトルに万有引力の大きさを書ける
    return force;
  }
  ////////
  
  void update(){   ////状態更新
    velocity.add(acceleration); //加速度を「積分」して速度に
    location.add(velocity);     //速度を「積分」して位置に
    acceleration.mult(0);       //加速度のクリア（ゼロをかけ算）（毎回クリア）
  }
  
  void display(){ ////表示
    stroke(0); //ふちの色を指定
    fill(mass/mass_MAX * 200 + 10, 255, 255); //中身の色を指定
    ellipse(location.x, location.y, mass*2, mass*2); //質量に応じた大きさに
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
////////
class Attractor{ ////////Attractorクラスの定義
  float mass;       //質量
  PVector location; //位置
  
  Attractor(){ //コンストラクタ
    location = new PVector(width/2, height/2); //位置は窓の中央
    mass = 10000;
  }
  
  PVector attract(Mover m){ ////万有引力ベクトル
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag(); //物体とattractorの距離を取得
    force.normalize();            //規格化（長さを１に）
    float strength = -(G * mass * m.mass) / (distance * distance); //万有引力（ここでは斥力にした）
    force.mult(strength);         //単位ベクトルに万有引力の大きさを書ける
    return force;
  }
  
  void display(){ ////表示
    noStroke();
    fill(170);
    ellipse(location.x, location.y, 150, 150);
    fill(0);
    text("Repeller", location.x - 40, location.y - 10);
  }
}

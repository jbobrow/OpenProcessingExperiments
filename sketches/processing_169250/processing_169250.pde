
///////////////////////////////////////////////////////////////
// Example 2.7 (シフマン, p.81) 引力，多体
// slightly modified
///////////////////////////////////////////////////////////////
int N = 20; //Moverオブジェクトの数
Mover[] movers = new Mover[N]; //Moverクラスのオブジェクトの配列の宣言
Attractor a;                   //Attractorクラスのオブジェクトの宣言
float  mass_MIN = 0.1;
float  mass_MAX = 5.0;
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
  fill(255,1);            //透明度指定
  rect(0,0,width,height); //ある程度透明な箱を描く
  a.display(); //アトラクタの表示
    
  for(int i = 0; i < N; i++){
    PVector force = a.attract(movers[i]); //引力を計算
    movers[i].applyForce(force);   //力を印加
    
    movers[i].update();            //物体の状態を更新
    movers[i].display();           //物体の表示
    //movers[i].checkEdges();        //窓の端に関するチェック
  }
}
/////////////////////////////////////
//// クラスや関数の定義
class Mover{ //////// Moverクラスの定義
  PVector location;     //位置
  PVector velocity;     //速度
  PVector acceleration; //加速度
  float   mass;         //質量
  float   s_max = 2.0;  //速度設定範囲
  
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
  
  void update(){   ////状態更新
    velocity.add(acceleration); //加速度を「積分」して速度に
    location.add(velocity);     //速度を「積分」して位置に
    acceleration.mult(0);       //加速度のクリア（ゼロをかけ算）（毎回クリア）
  }
  
  void display(){ ////表示
    stroke(0); //ふちの色を指定
    fill(mass/mass_MAX*50 + 100, 255, 255); //中身の色を指定
    ellipse(location.x, location.y, mass*4, mass*4); //質量に応じた大きさに
  }
  
  void checkEdges(){ ////ウインドウの端にぶつかった物体のバウンドの処理
    if(location.x > width){
      location.x = width;
      velocity.x *= -1; //速度のx成分を反転
    } else if(location.x < 0){
      location.x = 0;
      velocity.x *= -1; //速度のx成分を反転
    }
    
    if(location.y > height){
      location.y = height;
      velocity.y *= -1; //速度のy成分を反転
    } else if(location.y < 0){
      location.y = 0;
      velocity.y *= -1; //速度のy成分を反転
    }
  }
}
////////
class Attractor{ ////////Attractorクラスの定義
  float mass;       //質量
  PVector location; //位置
  float G;          //重力定数
  
  Attractor(){ //コンストラクタ
    location = new PVector(width/2, height/2); //位置は窓の中央
    mass = 20;
    G = 100.0;
  }
  
  PVector attract(Mover m){ ////万有引力ベクトル
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag(); //物体とattractorの距離を取得
    force.normalize();            //規格化（長さを１に）
    float strength = (G * mass * m.mass) / (distance * distance); //万有引力
    force.mult(strength);         //単位ベクトルに万有引力の大きさを書ける
    return force;
  }
  
  void display(){ ////表示
    noStroke();
    fill(20,255,255);
    ellipse(location.x, location.y, mass*2, mass*2);
  }
}

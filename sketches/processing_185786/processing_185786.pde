
///////////////////////////////////////////////////////////////
// Inspired by Example 2.8 (シフマン, p.84)
// repulsive particles 反発しあう粒子たち
// modified version
///////////////////////////////////////////////////////////////
int N = 60; //Moverオブジェクトの数
Mover[] movers = new Mover[N]; //Moverクラスのオブジェクトの配列
Mover2[] movers2 = new Mover2[N]; //Moverクラスのオブジェクトの配列
Attractor a;                   //Attractorクラスのオブジェクト
float  G = 9.8;               //重力定数
float  Mass_p = 1;           //粒子たちの質量
float  velo_MAX = 1;           //速さ制限（これを超えたらリセット）
float  coef = 0.01;            //抗力係数
/////////////////////////////////////
void setup(){ ////////セットアップ
  size(800, 800); //窓のサイズを指定
  colorMode(HSB); //カラーモードはHSBモードで
  
  for(int i = 0; i < N; i++){
     movers[i] = new Mover(Mass_p, random(width), random(height)); //オブジェクト生成
     movers2[i] = new Mover2(Mass_p, random(width), random(height)); //オブジェクト生成
  }
  
  a = new Attractor(); //オブジェクト生成
}
/////////////////////////////////////
void draw(){ ////////メインループ
  //background(255);
  fill(200,20);            //透明度指定
  rect(0,0,width,height);  //箱を描く
  
  //a.display(); //attractorの表示
    
  for(int i = 0; i < N; i++){
    
    PVector force = a.attract(movers[i]); //attractor a がmover[i]へ及ぼす力を計算
    movers[i].applyForce(force);   //力を印加
     force = a.attract2(movers2[i]); //attractor a がmover[i]へ及ぼす力を計算
    movers2[i].applyForce(force);   //力を印加
    if(false){//mousePressed){ ////もしもマウスボタンが押されたら
      float speed = movers[i].velocity.mag();
       float speed2 = movers2[i].velocity.mag();
      float dragMag = coef * speed * speed;
      float dragMag2 = coef * speed2 * speed2;
      PVector dragForce = movers[i].velocity.get();
       PVector dragForce2 = movers2[i].velocity.get();
      dragForce.mult(-1);
       dragForce2.mult(-1);
      dragForce.normalize();
      dragForce2.normalize();
      dragForce.mult(dragMag);
      dragForce2.mult(dragMag2);
      movers[i].applyForce(dragForce);
       movers2[i].applyForce(dragForce2);
      textSize(24);
      fill(60,10);
      text("Viscosity", width/2-60, height-50);
    }
 
    for(int j = 0; j < N; j++){  //相互作用処理
      if(i != j){
        PVector force_m = movers[j].attract(movers[i]); //物体 j が物体 i に及ぼす力を計算
        movers[i].applyForce(force_m);                  //物体 i への力の適用
        PVector force_m2 = movers[j].attract2(movers2[i]); //物体 j が物体 i に及ぼす力を計算
        movers2[i].applyForce(force_m2);                  //物体 i への力の適用
        PVector force_m3 = movers2[j].attract(movers2[i]); //物体 j が物体 i に及ぼす力を計算
        movers2[i].applyForce(force_m3);                  //物体 i への力の適用
        PVector force_m4 = movers2[j].attract2(movers[i]); //物体 j が物体 i に及ぼす力を計算
        movers2[i].applyForce(force_m4);                  //物体 i への力の適用
       
      }
    }
    
    movers[i].update();             
    movers[i].checkVelocityForReset(); 
    movers[i].display();              
    movers[i].periodicBoundary();    
  }
  
  for(int i = 0; i < N; i++ ){
    movers2[i].update();               
    movers2[i].checkVelocityForReset(); 
    movers2[i].display();              
    movers2[i].periodicBoundary();      
  } 
  //textSize(15);
  //fill(80);
  //text("Viscosity emerges by pressing the mouse button", 20, height - 20);
  //fill(150,255,255);
  //text("Repulsive particles in cone potential", 20, 20);
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
  PVector attract(Mover m){ 
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag(); 
    force.normalize();          
    float strength = -(G * mass * m.mass) / (distance * distance); 
    force.mult(strength);       
    return force;
  }
  PVector attract2(Mover2 m){ 
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag(); 
    force.normalize();            
    float strength = 0;
    if( distance >= 5)
    {
      strength = (G * mass * m.mass) / (distance * distance); 
    }
    force.mult(strength);         
    return force;
  }
  ////////
  
  void update(){   ////状態更新
    velocity.add(acceleration); //加速度を「積分」して速度に
    location.add(velocity);     //速度を「積分」して位置に
    acceleration.mult(0);       //加速度のクリア（ゼロをかけ算）（毎回クリア）
  }
  
  void display(){ ////表示
    stroke(180,255,255); //ふちの色を指定
    fill(100, 255, 255); //中身の色を指定
    ellipse(location.x, location.y, 19, 19);
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
      velocity.mult(0.5);
    }
  }
}
class Mover2{ //////// Moverクラスの定義
  PVector location;     //位置
  PVector velocity;     //速度
  PVector acceleration; //加速度
  float   mass;         //質量
  float   s_max = 1.0;  //速度設定範囲
  
  Mover2(float m, float x, float y){  //コンストラクタ
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(random(-s_max, s_max),random(-s_max, s_max));
    acceleration = new PVector(0,0);
  }
  
  void applyForce(PVector force2){  ////ニュートンの第２法則
    PVector f = PVector.div(force2, mass); //力を受け取って質量で除算
    acceleration.add(f);                  //加速度に加算
  }
  
  ////////
  PVector attract(Mover2 m){ ////引力（ここでは斥力：静電反発力）
    PVector force2 = PVector.sub(location, m.location);
    float distance2 = force2.mag(); //物体とattractorの距離を取得
    force2.normalize();            //規格化（長さを１に）
    float strength2 = -(G * mass * m.mass) / (distance2 * distance2); //斥力
    force2.mult(strength2);         //単位ベクトルに万有引力の大きさを書ける
    return force2;
  }
  ////////
   PVector attract2(Mover m){ ////引力（ここでは斥力：静電反発力）
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag(); //物体とattractorの距離を取得
    force.normalize();            //規格化（長さを１に） 
    float strength = 0;
    if(distance >= 5){
      strength = (G * mass * m.mass) / (distance * distance); //斥力
    }
    force.mult(strength);         //単位ベクトルに万有引力の大きさを書ける
    return force;
  }
  void update(){   ////状態更新
    velocity.add(acceleration); //加速度を「積分」して速度に
    location.add(velocity);     //速度を「積分」して位置に
    acceleration.mult(0);       //加速度のクリア（ゼロをかけ算）（毎回クリア）
  }
  
  void display(){ ////表示
    stroke(180,255,255); //ふちの色を指定
    fill(255, 255, 255); //中身の色を指定
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
      velocity.mult(0.5);
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
    //float distance = force.mag(); //物体とattractorの距離を取得
    float distance = 20;             //固定値すなわち，コーン（円錐）ポテンシャル
    force.normalize();               //規格化（長さを１に）
    float strength = (G * mass * m.mass) / (distance * distance); //引力
    force.mult(strength);           //単位ベクトルに引力の大きさを書ける
    return force;
  }
    
     PVector attract2(Mover2 m2){ ////引力
    PVector force2 = PVector.sub(location, m2.location);
   /// float distance2 = force2.mag(); //物体とattractorの距離を取得
    float distance2 = 20;             //固定値すなわち，コーン（円錐）ポテンシャル
    force2.normalize();               //規格化（長さを１に）
    float strength2 = (G * mass * m2.mass) / (distance2 * distance2); //引力
    force2.mult(strength2);           //単位ベクトルに引力の大きさを書ける
    return force2;
    
  }
  
  void display(){ ////表示
    noStroke();
    fill(0, 5);
    ellipse(location.x, location.y, width/2, height/2);
  }
}
////////
void mouseDragged(){
  a.location.x = mouseX;
  a.location.y = mouseY;
}
void mouseReleased(){ ///マウスボタンを離したら各粒子の速度をランダムにセット
  for(int i = 0; i < N; i++){
  ///  movers[i].velocity.set(random(-2,2),random(-2,2),0);
    //movers[i].velocity.set(0,0,0);
    //movers2[i].velocity.set(0,0,0);
///    movers2[i].velocity.set(random(-2,2),random(-2,2),0);
//    movers2[i].location.x = random(100);
///    movers2[i].location.y = random(100);
    // "the 3rd argument ",0" is necessary in Processing 1.5.1
    // while, it is not necessary for Processing 2
  }
}
////////

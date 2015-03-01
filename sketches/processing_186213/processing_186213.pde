
///////////////////////////////////////////////////////////////
// Inspired by Example 2.8 (シフマン, p.84)を変えました
// repulsive particles 反発しあう粒子たちと引き合うやつ
// modified version
///////////////////////////////////////////////////////////////
int N = 60; //Moverオブジェクトの数
int M = 10; //Attractorオブジェクトの数
Mover[] movers = new Mover[N]; //Moverクラスのオブジェクトの配列
Mover2[] movers2 = new Mover2[N]; //Mover2クラスのオブジェクトの配列
Attractor[] a = new Attractor[M]; //Attractorクラスのオブジェクト
float  G = 9.8;               //重力定数
float  Mass_p = 1;           //粒子たちの質量
float  velo_MAX = 1;           //速さ制限（これを超えたらリセット）
float  coef = 0.01;            //抗力係数
/////////////////////////////////////
void setup(){ ////////セットアップ
  size(800, 640); //窓のサイズを指定
  colorMode(HSB); //カラーモードはHSBモードで
  
  for(int i = 0; i < N; i++){
     movers[i] = new Mover(Mass_p, random(width), random(height)); //オブジェクト生成
     movers2[i] = new Mover2(Mass_p, random(width), random(height)); //オブジェクト生成
  }
  for(int i = 0; i < M; i++){
    a[i] = new Attractor(); //オブジェクト生成
  }
}
/////////////////////////////////////
void draw(){ ////////メインループ
  background(0);
  fill(120, 255, 255);            //透明度指定
  rect(0,0,width,height);  //箱を描く
  
  for(int i = 0; i < M; i++){
    if(a[i].exist == true){
      a[i].display(); //attractorの表示
    }
  }
    
  for(int i = 0; i < N; i++){
    for(int j = 0; j < M; j++){
      if(a[j].exist == true){
        PVector force = a[j].attract(movers[i]); //attractor a がmover[i]へ及ぼす力を計算
        movers[i].applyForce(force);   //力を印加
        force = a[j].attract2(movers2[i]); //attractor a がmover[i]へ及ぼす力を計算
        movers2[i].applyForce(force);   //力を印加
      }
    }
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
        force_m.mult(0.8);
        movers[i].applyForce(force_m);                  //物体 i への力の適用
        
        PVector force_m2 = movers[j].attract2(movers2[i]); //物体 j が物体 i に及ぼす力を計算
        force_m2.mult(0.3);
        movers2[i].applyForce(force_m2);                  //物体 i への力の適用
        
        PVector force_m3 = movers2[j].attract(movers2[i]); //物体 j が物体 i に及ぼす力を計算
        force_m3.mult(1.5);
        movers2[i].applyForce(force_m3);                  //物体 i への力の適用
        
        PVector force_m4 = movers2[j].attract2(movers[i]); //物体 j が物体 i に及ぼす力を計算
        //force_m4.mult(10);
        //movers[i].applyForce(force_m4);                  //物体 i への力の適用
       
      }
    }
    
    movers[i].update();                //物体の状態を更新
    movers[i].checkVelocityForReset(); //制限速さを超えたらリセットする
    movers[i].display();               //物体の表示
    movers[i].periodicBoundary();      //周期的境界条件の実現
   
  }
  
  for(int i = 0; i < N; i++ ){
    movers2[i].update();                //物体の状態を更新
    movers2[i].checkVelocityForReset(); //制限速さを超えたらリセットする
    movers2[i].display();               //物体の表示
    movers2[i].periodicBoundary();      //周期的境界条件の実現
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
  PVector attract(Mover m){ ////引力（ここでは斥力：静電反発力）
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag(); //物体とattractorの距離を取得
    force.normalize();            //規格化（長さを１に）
    float strength = -(G * mass * m.mass) / (distance * distance); //斥力
    force.mult(strength);         //単位ベクトルに万有引力の大きさを書ける
    return force;
  }
  PVector attract2(Mover2 m){ ////引力（ここでは斥力：静電反発力）
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag(); //物体とattractorの距離を取得
    force.normalize();            //規格化（長さを１に）
    float strength = 0;
    if( distance >= 5){
      strength = (G * mass * m.mass) / (distance * distance); //斥力
    }
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
    stroke(255); //ふちの色を指定
    fill(0); //中身の色を指定
    ellipse(location.x, location.y, 22, 22);
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
    stroke(255); //ふちの色を指定
    fill(255); //中身の色を指定
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
  boolean exist = false;
  
  Attractor(){ //コンストラクタ
    //location = new PVector(width/2, height/2); //位置は窓の中央
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
    //float distance2 = force2.mag(); //物体とattractorの距離を取得
    float distance2 = 20;             //固定値すなわち，コーン（円錐）ポテンシャル
    force2.normalize();               //規格化（長さを１に）
    float strength2 = (G * mass * m2.mass) / (distance2 * distance2); //引力
    force2.mult(strength2);           //単位ベクトルに引力の大きさを書ける
    return force2;
  }
  
  void display(){ ////表示
    noStroke();
    fill(0,100);
    ellipse(location.x, location.y, width/20, height/20);
  }
}
////////
void mouseReleased(){ //存在してないAttractorを探したら、それを存在させ、場所をマウスの位置にする
  for(int i = 0; i < M; i++){
    if(a[i].exist == false){
      a[i].exist = true;
      a[i].location = new PVector(mouseX, mouseY);
      return;
    }
  }
}/*
void mouseReleased(){ ///マウスボタンを離したら各粒子の速度をランダムにセット
  for(int i = 0; i < N; i++){
    //movers[i].velocity.set(random(-2,2),random(-2,2),0);
    //movers[i].velocity.set(0,0,0);
    //movers2[i].velocity.set(0,0,0);
    //movers2[i].velocity.set(random(-2,2),random(-2,2),0);
    //movers2[i].location.x = random(100);
    //movers2[i].location.y = random(100);
    // "the 3rd argument ",0" is necessary in Processing 1.5.1
    // while, it is not necessary for Processing 2
  }
}*/
////////

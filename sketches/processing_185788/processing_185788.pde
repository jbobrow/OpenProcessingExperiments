
int Nb = 20;                          //Ball_bオブジェクトの数
int Nb_killed = 0;                    //場外のBall_bオブジェクトの数
Ball_b[] ball_bs = new Ball_b[Nb];    //Ball_bクラスのオブジェクトの配列
Ball_b player_ball;
Attractor_b B;                        //Attractorクラスのオブジェクト
Attractor_mouse A;                    //マウスの位置にAttractorクラスのオブジェクト
//dead_area D;
//////////////////
float G = 30.0;                       //重力定数
float impact_const = 35;
float BM_MAX = 30;                    //Bballの最大質量
float Bspeed_MAX = 6;                 //吹っ飛びすぎ防止のためBの速度制限
float player_ballMass = 30;           //プレイヤーballの重さ
float player_topspeed = 1.5;          //プレイヤーballの最高速度
float D;                              //Bball場外判定用
float Energy;                         //Bombオブジェクト使用のためのエネルギ(player専用)
float supply = 0.05;                  //エネルギー補給ペース（player）
/////////////////////////////
void setup(){
  size(700, 700);            //ウィンドウサイズ
  colorMode(HSB);            //カラーモードはHSB
  frameRate(60);

  for(int i = 0; i < Nb; i++){
    ball_bs[i] = new Ball_b(random(BM_MAX - 9, BM_MAX),random(0 + width/4, width - width/4), random(0 + height/4, height - height/4));  //オブジェクト生成
  }
  B = new Attractor_b();                    //オブジェクト生成
  A = new Attractor_mouse();                //オブジェクト生成
  player_ball = new Ball_b(player_ballMass, width/2, height);  //プレイヤーball生成
}
////////////////////////////////
void draw(){
  int time = millis();           //時間測定開始
  fill(200,20);                  //透明度指定
  rect(0,0,width,height);        //箱を描写  
  
  Energy += supply;              //エネルギーを補給(player)
  //print("ENERGY = ",Energy);      //デバック
  if(Energy >= 100){
    Energy = 100 ;       //エネルギー最大値
  }
  //////////////////////////テキスト表示
  fill(255, 2.5*Energy,255);
  textSize(25);
  text("ENERGY:",10,height-25);
  text(Energy,115,height-25);
  //////////////////////////
  
  A = new Attractor_mouse();     //オブジェクト生成(マウスの位置) 
  B.display();                   //Bのattractor表示
  A.display();                   //Aのattractor表示  
  
  for(int i = 0; i < Nb; i ++){
    PVector force = B.attract_b(ball_bs[i]);  //attractor_bがball_bs[i]へ及ぼす力
    ball_bs[i].applyForce_b(force);           //力を印加    
    
    PVector attack = player_ball.impact_Energy(ball_bs[i]);  //playerballが物体iに及ぼす力
    ball_bs[i].applyForce_b(attack);                    //物体iに力を印加
    attack.mult(-1.3);                                  //力の向きを反転，調整の為スケーリング
    player_ball.applyForce_b(attack);                   //playerballに力を印加
    ////////////////////////////////////////////////////bomb
    PVector explosion = A.bomb(ball_bs[i]);            //mouseから斥力ベクトル生成       
    ball_bs[i].applyForce_b(explosion);               //力を印加
    
    PVector b_explosion = A.mob_bomb(player_ball, ball_bs[i]);
    player_ball.applyForce_b(b_explosion);
    ////////////////////////////////////////////////////////
    
    for(int j = 0; j < Nb; j++){
      if(i != j){
        PVector force_m = ball_bs[j].impact_b(ball_bs[i]);  //物体jが物体iに及ぼす力を計算
        ball_bs[i].applyForce_b(force_m);
      }
    }
    ball_bs[i].update_b();                                //物体の状態を更新
    ball_bs[i].check_gameover(width/2,height/2,width/2);  //円の中にballがあるか判定．処理
    ball_bs[i].BS_top();                                  //最高速度処理
    ball_bs[i].display_b();                               //描写
    ball_bs[i].Count();                                   //場外ballカウント（クリアーの判断に使う）
    ///////////////////////////////クリア判定
    if(D == Nb){
      print("clear!");
      ball_bs[i].mass = 0;
      textSize(50);
      fill(50, 255,255);
      text("COMPLETE!",width/2,height/2);
      textSize(25);
      text("Destroy: ",width/2,height/2.4);
      text(Nb,width/2+width/4.8,height/2.4);
      text("Time(s): ",width/2, height/1.6);
      time =time /1000;
      text(time,width/2+width/4.8, height/1.6);
      noLoop();
      }
    }  
    
  ///////////player_ballオブジェクト
  PVector mouseforce = A.attract_mouse(player_ball);     //mouse方向の引力ベクトル生成       
  player_ball.applyForce_b(mouseforce);                  //力を印加
  //player_ball.to_mouse();                              //playerballをマウス方向へ動かすオブジェクト
  player_ball.update_b();                                //物体の状態を更新
  player_ball.check_gameover(width/2,height/2,width/2);  //ゲームオーバ処理
  player_ball.display_free();                            //ball_bとは違う色で描写
  if(player_ball.killed == 1){
    //print(" GameOver")                                   //デバック
    textSize(50);
    fill(255,255,255);
    text("GAMEOVER...",width/2,height/2);
    textSize(25);
    text("killed by          Mobs:",width/2,height/2.4);
    text(Nb,width/2+width/5.5,height/2.4);
  }
    //print("Dead_BF = ", D);                              //デバック
}
/////////////////////////////

class Ball_b{
  PVector location;        //位置
  PVector velocity;        //速度
  PVector acceleration;    //加速度
  float mass;              //質量
  float killed;            //場外判定
  float confirm = 0;       //場外判定（ストッパー）
  float b_Energy = random(0,50);    //敵用bombエネルギー
  float b_supply = 0.06;           //敵用補給割合
  
  Ball_b(float m, float x, float y){  //コンストラクタ
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0,0);
  }
  
  void applyForce_b(PVector force){  ////ニュートンの第２法則
    PVector f = PVector.div(force, mass); //力を受け取って質量で除算
    acceleration.add(f);                  //加速度に加算
  }
  
  PVector impact_b(Ball_b m){  //斥力，衝突判定
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();                //物体とattractorの距離を取得
    float distance_balls = mass/2 + m.mass/2;    //Bballの大きさ＝mass．衝突判定材料
    if(distance < distance_balls){  //ball同士が接触してれば
      force.normalize();                         //規格化（長さを１に）
      float strength = -(impact_const * mass * m.mass) / (distance * distance); //斥力
      force.mult(strength);                      //単位ベクトルに万有引力の大きさを書ける
    }
    if(distance > distance_balls){    
      force.mult(0);                  //距離が離れていれば斥力なし
    }
    return force;
     
  }
  
   PVector impact_Energy(Ball_b m){  //斥力，衝突判定,Player専用
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();                //物体とattractorの距離を取得
    float distance_balls = mass/2 + m.mass/2;    //Bballの大きさ＝mass．衝突判定材料
    if(distance < distance_balls){  //ball同士が接触してれば
      force.normalize();                         //規格化（長さを１に）
      float strength = -(impact_const * mass * m.mass) / (distance * distance); //斥力
      force.mult(strength);                      //単位ベクトルに万有引力の大きさを書ける
      m.b_Energy -= 15;                          //衝突の際，エネルギーを奪う
      Energy += 0.5;
    }
    if(distance > distance_balls){    
      force.mult(0);                  //距離が離れていれば斥力なし
    }
    return force;
     
  }
      
  
  void update_b(){  //状態更新
    velocity.add(acceleration);  //加速度を積分して速度に
    location.add(velocity);      //速度を積分して位置に
    acceleration.mult(0);        //加速度のクリア
    ///////////////////////////////bombのためのenergy更新
    b_Energy += b_supply;        //エネルギ補給
    if(b_Energy >= 100){
      b_Energy = 100;
    }
    //print("b_ENERGY = ",b_Energy);
  }
  
  void display_b(){  //ball_bのための画面表示
    stroke(150, 255, 255);
    fill(9*mass, 255, 20*b_Energy);
    ellipse(location.x, location.y, mass, mass);
    if(b_Energy >= 80){
      noFill();
      stroke(b_Energy * 20,255,255);
      ellipse(location.x,location.y,mass*1.5, mass*1.5);
    }
   // fill(100);
   // ellipse(location.x, location.y, mass/1.5, mass/1.5);
  }
  
  void display_free() {  //playerballのための画面表示
    stroke(150,255,255);
    fill(50, 255, 255);
    ellipse(location.x, location.y, mass, mass);
    fill(70, 200,200);
    ellipse(location.x, location.y, mass/1.5, mass/1.5);
    fill(80, 150, 255);
    ellipse(location.x, location.y, mass/2, mass/2);
    fill(255,255,255);
    ellipse(location.x, location.y, mass/3, mass/3);
  }
  
  void BS_top(){  //Bの速度制限
    if(velocity.mag() > Bspeed_MAX){
      velocity.mult(0);
    }
  }
  
  void to_mouse(){  //単純なballがマウスへ向かう処理（使ってない）
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse,location);
    dir.normalize();
    dir.mult(0.6);
    acceleration = dir;
    velocity.add(acceleration);
    velocity.limit(player_topspeed);
    location.add(velocity);
  }
  
  
  void check_gameover(float R_x, float R_y, float R){ //gameover判定
    float RLocx = R_x;          //ゲームオーバー判定の中心座標(判定は円形)
    float RLocy = R_y;
    float Range = R;            //ゲームオーバー判定円の半径
    if((RLocx - location.x)*(RLocx - location.x) + (RLocy - location.y) * (RLocy -location.y) >= Range * Range){ 
      //ゲームオーバー判定円の外にballがあれば
      velocity.mult(-20);       //速度ゼロ
      killed = 1;      
    }
  }
  void Count(){  //場外に行ったらDカウンターを+1
    if(killed == 1 && confirm == 0 ){
      D += 1;
      confirm += 1;
    }
  }
}

class Attractor_b{  /////Attractorクラスの定義
  float mass;              //質量
  PVector location;        //位置
  //float Renge;           //半径
  
  Attractor_b(){  //コンストラクタ
  location = new PVector(width/2, height/2);    //位置は窓の中心
  mass = 1;
  }
  
  PVector attract_b(Ball_b m){  //引力
    PVector force = PVector.sub(location, m.location);  //物体とatractorの距離を取得
    float distance = 20;                                //固定値（円錐ポテンシャル）
    force.normalize();                                  //正規化
    float strength = (G * mass * m.mass ) / (distance * distance);  //斥力
    force.mult(strength);                               //単位ベクトルに万有引力の大きさをかける
    return force;
  }
  
  void display(){  ////表示
    noStroke();
    fill(20, 5);
    ellipse(location.x, location.y, width, height);
  }
}

class Attractor_mouse{  /////Attractorクラスの定義
  float mass;              //質量
  PVector location;        //位置
 // PVector loc_player;      //位置(prayer対象)
  //float Renge;           //半径
  
  Attractor_mouse(){  //コンストラクタ
  location = new PVector(mouseX, mouseY);    //位置は窓の中心
  mass = 1;
  }
    
  PVector attract_mouse(Ball_b m){  //引力
    PVector force = PVector.sub(location, m.location);  //物体とatractorの距離を取得
    //float distance = force.mag();                                //固定値（円錐ポテンシャル）
    float distance = 13;
    force.normalize();                                  //正規化
    float strength = (G * mass * m.mass) / (distance * distance);  //引力
    //float strength = 0.05;
    force.mult(strength);                               //単位ベクトルに万有引力の大きさをかける
    return force;
  }
  
  PVector bomb(Ball_b m){ //マウスを押したとき爆発(斥力)
    location = new PVector(mouseX, mouseY);
    mass = 1;
    PVector Explosion = PVector.sub(location, m.location);
    float BOMB = 500;                                        //爆発力
    float Range = width / 2;                                 //効果範囲
    float distance = 5;                                      //円錐ポテンシャル
    Explosion.normalize();
    float power = -(BOMB * mass * m.mass) / (distance * distance); //斥力
    Explosion.mult(power);
    if(mousePressed){
      if(Energy >= 0)                      //エネルギーがないと発動不可
       if(( location.x - m.location.x)*(location.x - m.location.x) + (location.y - m.location.y) * (location.y - m.location.y) <= Range * Range){ 
         noFill();
         stroke(255,255,255);
         ellipse(location.x, location.y, Range , Range);
         ellipse(location.x, location.y, Range*0.8 , Range*0.8);
         ellipse(location.x, location.y, Range*0.6 , Range*0.6);
         ellipse(location.x, location.y, Range*0.4 , Range*0.4);
         ellipse(location.x, location.y, Range*0.2 , Range*0.2);
         Energy += -1;                     //エネルギー消費
         return Explosion;                 //爆発を与える
       }
    }
    Explosion.mult(0);                     //クリックが無ければ斥力０
    return Explosion;
  }
  
  PVector mob_bomb(Ball_b player,Ball_b m){ //敵mobが斥力発生
    mass = 1;                               //おもさ(意味ないね)
    PVector b_Explosion = PVector.sub(player.location, m.location);  //playerにむけてのベクトル
    float b_BOMB = 10;                     //爆発力
    float b_Range = width / 4;              //爆発範囲
    float b_distance = 5;                   //円錐ポテンシャル
    b_Explosion.normalize();                //正規化
    float b_power = (b_BOMB * player.mass * m.mass)/(b_distance * b_distance);  //斥力，爆発力
    b_Explosion.mult(b_power);
    if(m.b_Energy >= 100){
        noFill();
        stroke(70,255,255);
        ellipse(m.location.x, m.location.y, b_Range , b_Range);
        ellipse(m.location.x, m.location.y, b_Range*0.8 , b_Range*0.8);
        ellipse(m.location.x, m.location.y, b_Range*0.6 , b_Range*0.6);
        ellipse(m.location.x, m.location.y, b_Range*0.4 , b_Range*0.4);
        ellipse(m.location.x, m.location.y, b_Range*0.2 , b_Range*0.2);
        m.b_Energy += -100;
        if(( m.location.x - player.location.x)*(m.location.x - player.location.x) + (m.location.y - player.location.y) * (m.location.y - player.location.y) <= b_Range * b_Range){ 
          return b_Explosion;
        }
        b_Explosion.mult(0);
        return b_Explosion;
    }
    b_Explosion.mult(0);
    return b_Explosion;
  }
  
  void display(){  ////表示
    noStroke();
    fill(20, 5);
    ellipse(location.x, location.y, 10, 10);
  }
}

    
  



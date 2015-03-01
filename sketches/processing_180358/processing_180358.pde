
//　大域変数

float Cx=0, Cy=0;   // マウスの位置格納用

float P_R_SCALE = 2;   // プレイヤーの半径調節パラメータ


float P_HP_MAX = 20;   // プレイヤーのHPの上限


int BLOCK_NUM = 40;   // ブロックの数


int BALL_NUM = 30;   // ボールの数

float  G = 30;            //重力定数
float  velo_MAX = 5;     //速さ制限（これを超えたらリセット）


Player player;   // プレイヤー
Block[] block = new Block[BLOCK_NUM];  // ブロック
Item  item1, item2;           // アイテム
Mover[] ball = new Mover[BALL_NUM];    // Moverボール

Attractor a;         // 引力
 
boolean game_clear_flag = false;    // gameをクリアしたか

boolean game_start_flag = false;    // gameをスタートするか

boolean repulsive = false;

int game_clear_count = 0;          // クリア回数 

int time1=0;   // item1が作用する時間カウント用
int time2=0;   // item2が作用する時間カウント用

int second =0;
int minute =0;
int minute_=0;

int clear_minute=0;
int clear_second=0;

boolean minute_flag=false;
float time_=0.0;  // プログラムが動き出してからの時間
float time=0.0;  // ゲーム経過時間格納用
 
//初期化
void setup(){
   size(1000,600);
   colorMode(HSB,100);
   background(99);
   frameRate(60);  //再生速度を1秒フレームに設定（初期値は1秒60フレーム）
   int i;
   int clr_parameter=0;       // ブロックの色を決める
    
   // ブロックの生成
   for(i=0; i<BLOCK_NUM; i++){
     clr_parameter = int(random(0 , 6.9));                   // 0～6までの整数値をランダムで生成
     block[i] = new Block(color(clr_parameter*14,99,99));    // 色相を7等分
   }
   
   // アイテムブロック生成をする　 
   //アイテム1:プレイヤーに引力が働く
   clr_parameter = int(random(0 , 6.9)); 
   item1 = new Item(color(clr_parameter*14,99,99), true);
   
   // アイテム2：プレイヤーに反発力が働く
   clr_parameter = int(random(0 , 6.9));
   item2 = new Item(color(clr_parameter*14,99,99), false);
    
   // Moverボールを生成
   for(i=0; i< BALL_NUM ; i++){
     clr_parameter = int(random(0 , 6.9));
     ball[i] = new Mover(color(clr_parameter*14, 99,99));
   }
   // Attractorを生成
   a = new Attractor();
   
   //その他初期化
   time=0.0;  // ゲームの時間
   time1=0;  // item1が作用する時間カウント用
   time2=0;  // item2が作用する時間カウント用
   minute =0;
   minute_=0;
   
   clear_minute = 0;
   clear_second =0;
   minute_flag=false;
   game_clear_flag = false;    // gameをクリアしたか

   game_start_flag = false;    // gameをスタートするか

   repulsive = false;
   
}


void draw(){
   
   fade();
   
   // マウスの位置
   Cx=mouseX;   
   Cy=mouseY;
   
   int i = 0;
   int j= 0;
   
   int finish_count =0;    // 壊したブロックの数
   
   boolean collision_player_block = false;    // プレイヤーとブロックが衝突しているかどうか
   
   boolean collision_player_ball = false;     // プレイヤーとボールが衝突しているかどうか
   
   if(game_start_flag == false){
     
     if(mousePressed){
        // マウスをおしたらplayerを生成しゲームスタート
        //PFont font = loadFont("Algerian-48.vlw");
        //textFont(font, 24);
        textSize(24);
        textAlign(CENTER);
        fill(50,100,60);
        text(" GAME START !!", width/2, height/2);  
        //delay(100);
        game_start_flag = true;
        player = new Player(0, 0, 5);
        time_ = millis();
     } 
   }else{
     
     // ゲーム中
     
     if(mousePressed){       
         player.Hp+=0.005;  // マウスを押していたらプレイヤーのHpが少し増える
        
     }   
     // プレイヤーのHpの上限
     if(player.Hp>= P_HP_MAX){
           player.Hp=P_HP_MAX;   
     }
     // ゲームをクリアしていれば、「CLEAR」と表示
     if(game_clear_flag == true){
         //PFont font = loadFont("Algerian-48.vlw");
         //textFont(font, 24);
         textSize(24);
         textAlign(CENTER);
         fill(30,100,100);
         text(" CLEAR !!! \n  Retry!! \n Push Enter \n" + nf(clear_minute,2) + ":" + nf(clear_second,2) , width/2, height/2);  
         
     } 
     // プレイヤーのHpが0になったら、「GAME OVER」と表示
     if(player.Hp < 0){
         player.exist=false;
         //PFont font = loadFont("Algerian-48.vlw");
         //textFont(font, 24);
         textSize(24);
         textAlign(CENTER);
         fill(0,100,60);
         text(" G A M E O V E R \n  Retry!! \n Push Enter \n" , width/2, height/2);  
         
         game_start_flag = false;
         game_clear_count = 0;
         noLoop();           
    }   
     
    // Blockの更新 
    for(i=0; i<BLOCK_NUM; i++){
      // 存在していれば処理を行う 
      if(block[i].exist == true){     
        collision_player_block = Collision_c_r(player, block[i]);  // プレイヤーと衝突しているか
             if(collision_player_block == true){
                          
               if(player.center_clr == block[i].clr){              // プレイヤーのコアと同じ色ならば
                  block[i].exist = false;                          // ブロックが一発で消える, プレイヤーのHpが1回復する
                  player.Hp += 1;
               }else{
                  player.Hp -= 1.5;                               // プレイヤーのコアと違う色なら
                  block[i].Hp -= 0.5;                             // ブロックとプレイヤーのHpが減る
                  if(block[i].Hp <= 0){
                     block[i].exist = false;
                  }
               }
                  
             }
         block[i].display(collision_player_block); 
         collision_player_block = false;
       
       }else{
         finish_count ++;                                         // 壊れたブロックの数をカウント
       } 
     }  
     
     // プレイヤーに対してボールが引力を働く
     if(item1.exist == true){
        collision_player_block = Collision_c_r(player, item1);
        if(collision_player_block == true){               
             if(player.center_clr == item1.clr){
                item1.exist = false;
                player.Hp += 1;
             }else{
                player.Hp -= 1.5;
                item1.Hp -= 0.5; 
                if(item1.Hp <= 0){
                   item1.exist = false;
                }
             }         
        }
        item1.display(collision_player_block); 
        collision_player_block = false;  
     }else{
       
       if(time1<600){
         a.location.x=Cx;
         a.location.y=Cy;
         a.mass=3.5;    
       }else{
         a.location.x=width/2;
         a.location.y=height/2;
         a.mass=1;
       }
       time1++;
       finish_count ++;
      
     }
     
     // プレイヤーに対してボールが反発力がはたらく
     if(item2.exist == true){
      collision_player_block = Collision_c_r(player, item2);
        if(collision_player_block == true){               
             if(player.center_clr == item2.clr){
                item2.exist = false;
                player.Hp += 1;
             }else{
                player.Hp -= 1.5;
                item2.Hp -= 0.5; 
                if(item2.Hp <= 0){
                   item2.exist = false;
                }
             }         
        }
        item2.display(collision_player_block); 
        collision_player_block = false;  
     }else{
      
       if(time2<600){
         a.location.x=Cx;
         a.location.y=Cy;
         a.mass=1;
         repulsive = true; 
       }else{
         a.location.x=width/2;
         a.location.y=height/2;
         a.mass=1;
         repulsive = false;
       }
       finish_count ++;
       time2++;
     }
    
     
     // ボールの更新
     for(i=0; i<BALL_NUM ;i++){
       if(ball[i].exist == true){
         PVector force = a.attract(ball[i], repulsive); 
          ball[i].applyForce(force);
          
          for(j = 0; j< BALL_NUM; j++){  //相互作用処理
              if(ball[j].exist == true){
                if(i != j){
                   PVector force_m = ball[j].attract(ball[i]); //物体 j が物体 i に及ぼす力を計算
                   ball[i].applyForce(force_m);                //物体 i への力の適用
                }
              }
          }
          
          ball[i].update();                //物体の状態を更新
          
          ball[i].checkVelocityForReset(); //制限速さを超えたらリセットする
          
          collision_player_ball = Collision_c_c(player, ball[i]); // ボールとコアが衝突しているか
          
          if(collision_player_ball == true){
             ball[i].exist = false;
             collision_player_ball = false;
             
             if(player.center_clr == ball[i].clr){               // コアと同じ色ならばプレイヤーのHpが3回復       
                    player.Hp += 3;
             }else{
                  player.Hp -= 1;                                // コアと違う色ならばプレイヤーのHpが減る
                  
             }
             
             player.center_clr = ball[i].clr;                    // ボールの色にコアの色が変化する
          }
          
          ball[i].display();               //物体の表示
          ball[i].periodicBoundary();      //周期的境界条件の実現  
       }
     }
     // Playerのアップデート
     player.update(Cx, Cy, player.Hp);
     if(player.exist != false)
        player.display();
     time = millis();
     time = (time-time_)*0.001;
    
   
     second = int(time%60);
     if((second ==0)&&( minute_flag == false)){
        minute_flag=true;
        minute++;
        minute_=minute-1;
        
     }
     if(second != 0){
        minute_flag=false;
     }
  
     fill(0,100,0);
     textSize(24);
     text(nf(minute_,2) + ":" + nf(second,2) , 900, 30); 
     
  }
   
   // ブロックを全部破壊したならば、
   if(finish_count == BLOCK_NUM+2 && game_clear_flag == false)
   {  
         game_clear_flag = true; 
         game_clear_count++; 
         println(game_clear_count);
         velo_MAX = velo_MAX+(game_clear_count*1.5);   // クリア回数に応じてボールのスピード上限を増す               
         clear_minute = minute_;
         clear_second =second; 
   }

   

}
    

// 画面リセット用の関数
void fade(){
   noStroke();
   fill(99,30);
   rectMode(CORNER);
   rect(0, 0, width, height);
}


// エンターキーを押したらゲームをリスタート
void keyPressed() {
  if (key == ENTER) {      // コード化されているキーが押された
       setup();
       //PFont font = loadFont("Algerian-48.vlw");
       //textFont(font, 24);
       textSize(24);
       textAlign(CENTER);
       fill(50,100,60);
       text(" GAME START !", width/2, height/2);  
       //delay(100);
       loop();
      
  }
}


// 円と矩形の衝突判定用
boolean Collision_c_r(Player p, Block b)
{
   PVector[] b_corner_point = new PVector[4];        // blockの矩形の頂点格納用
   
   b_corner_point[0]=new PVector(b.location.x, b.location.y);
   b_corner_point[1]=new PVector(b.location.x+b.size.x, b.location.y);
   b_corner_point[2]=new PVector(b.location.x+b.size.x, b.location.y+b.size.y);
   b_corner_point[3]=new PVector(b.location.x, b.location.y+b.size.y);
   
   float r_min_x = b_corner_point[0].x-p.R*sqrt(2);
   float r_max_x = b_corner_point[2].x+p.R*sqrt(2);
   float r_min_y = b_corner_point[0].y-p.R*sqrt(2);
   float r_max_y = b_corner_point[2].y+p.R*sqrt(2);
   
   // 当たり判定
   if((p.location.x >= r_min_x)&&(p.location.x <= r_max_x))
   {
      if((p.location.y >= b_corner_point[0].y) && (p.location.y <= b_corner_point[2].y)){
        return true; 
      }else if((p.location.x >= b_corner_point[0].x)&&(p.location.x <= b_corner_point[2].x)){
        if((p.location.y >= r_min_y) && (p.location.y <= r_max_y))
        return true;  
      }else{
        for(int i=0; i<4; i++){  
         float d =pow((b_corner_point[i].x - p.location.x),2)+pow((b_corner_point[i].y - p.location.y),2);
          if(d <= pow(p.R*sqrt(2),2)){
     
            return true; 
          }
        }        
      }
   }
   return false;
}

// 円と円との衝突判定
boolean Collision_c_c(Player p, Mover b)
{
     float d = pow((b.location.x-p.location.x),2)+pow((b.location.y - p.location.y),2);
     if( d<= pow(p.R/2+b.mass/2,2)){
       return true;
     }else{
       return false; 
     }
}


 class Attractor{ ////////Attractorクラスの定義
  float mass;       //質量
  PVector location; //位置
  float strength;
  float distance;
  Attractor(){ //コンストラクタ
    location = new PVector(width/2, height/2); //位置は窓の中央
    mass = 1;
  }
  
  PVector attract(Mover m, boolean a){  ////引力
    PVector force = PVector.sub(location, m.location);
    force.normalize();               //規格化（長さを１に）
    distance = 20;       //固定値すなわち，コーン（円錐）ポテンシャル
    if(a==true){               // 反発フラグがtrue
      distance = force.mag(); //物体とattractorの距離
    }
    strength = (G * mass * m.mass) / (distance * distance); //引力  
     if(a==true){               
      strength *= -0.005;      // 斥力
    }
    force.mult(strength);           //単位ベクトルに引力の大きさを書ける
    return force;
 } 
}

class Block{
  
  PVector location;   // 位置
  PVector size;       // 大きさ
  float   mass;      //質量
  boolean exist;     // 存在
  color clr;         // 色
  float Hp;          // Hp
  
  color damage_clr=color(100,0,100);  // 衝突しているときの色
  
  Block(color c){
    location = new PVector(random(0,width), random(0,height));   
    size = new PVector(random(30,70), random(10,30));             
    mass = size.x + size.y;          // 質量はサイズの大きさに比例
    clr = c;                         // 色は7色 色相 0,14,28,42,56,70,84　のいずれか 
    exist = true;
    Hp = mass/20;                   // Hpもサイズに比例 MAXで5：10回攻撃すれば破壊 
  }
    
  void display(boolean effect){
    
    if(effect == false){
      fill(clr);
      noStroke();
    }else{
      fill(damage_clr);
    }  
   
    rect(location.x, location.y, size.x, size.y);
    
  }

}


class Item extends Block{
  
  boolean  attraction;
  
  Item(color c, boolean a){
    super(c);
    attraction = a;
  }
}



class Mover{ //////// Moverクラスの定義
  PVector location;     //位置
  PVector velocity;     //速度
  PVector acceleration; //加速度
  PVector size;
  PVector Ac;
  float   mass;         //質量
  
  float   s_max = 1.0;  //速度設定範囲
  
  color clr;
  boolean exist;
  
  Mover(color c){  //コンストラクタ
    mass = random(20,40);
    size = new PVector(mass, mass);
    location = new PVector(random(0,width),random(0,height));
    velocity = new PVector(random(-s_max, s_max),random(-s_max, s_max));
    acceleration = new PVector(0,0);
    clr =c;
    exist = true;
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
    force.mult(strength);         //単位ベクトルに万有引力の大きさをかける
    return force;
  }
  ////////
  
  
  void update(){   ////状態更新
    
      velocity.add(acceleration); //加速度を「積分」して速度に
      location.add(velocity);     //速度を「積分」して位置に
      acceleration.mult(0);       //加速度のクリア（ゼロをかけ算）（毎回クリア）
    
  }
  
   void display(){
     
     noStroke();
     fill(clr); 
     rectMode(CENTER);
     
   
     ellipse(location.x, location.y, size.x, size.y);
     
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



class Player{
  PVector location;   // 位置
  float R;            // 半径
  float Ang;          // 角度
 
  int h=0;            //色相
  float Hp;           //Hp
  
  color center_clr=color(0,0,100);  // 初期のコアの色は無色
  
  boolean exist;   // 存在
  
  Player(float x, float y, float p){
    location = new PVector(x,y);
    Hp = p;
    R = p*P_R_SCALE;           // 半径はHpに比例する
    Ang =p;
    exist = true;
  }
  
  void update(float x, float y, float p){       // 位置とHpをアップデート
      
      Hp =p;
      location.x= x;
      location.y= y;
      
      R = p*P_R_SCALE;
          
      Ang += p;  //　矩形の回転ぐあい
      
      if(Ang >= 360){
        Ang = 1; 
      }      
      
      h += 3;           // 色はレインボーに変化
      if(h >= 99){      
         h = 0;
      }
         
  }
  
  void display(){
   //1周ごとに色変化
   noFill();
   stroke(h,99,99);

   //図形を描く
   strokeWeight(2);
   rectMode(RADIUS);
   translate(location.x, location.y);
   rotate(radians(Ang));
   rect(0, 0, R, R);   
   resetMatrix ( ) ; 
   strokeWeight(2);
   ellipse(location.x,location.y,R*2, R*2);
   fill(center_clr);
   ellipse(location.x,location.y,R, R);
 }

}




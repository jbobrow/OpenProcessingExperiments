
int num_part = 60;                    // 粒子(Partオブジェクト)の数
int deadnum_part = 0;                 // 死亡粒子の数
int existnum_part = num_part;         // 生存粒子の数
int num_face = 0;                     // 現在の顔の数
int maxnum_face = 7;                  // 顔の最大数
int maxnum_revive = 10;               // 復活玉の最大同時出現数
int maxnum_mgcc = 2 * maxnum_revive;  // 魔法陣の最大同時出現数
Part[] parts = new Part[num_part];    // Partクラスのオブジェクトの配列
Face[] faces = new Face[maxnum_face]; // Faceクラスのオブジェクトの配列
Revive[] rvvs = new Revive[maxnum_revive];// Reviveクラスのオブジェクトの配列
MagicCircle[] mgccs = new MagicCircle[2*maxnum_mgcc];//Magic_Circleクラスのオブジェクト配列
CenterAttractor ca;                   // CenterAttractorクラスのオブジェクト
BackEffect be;                        // BackEffectクラスのオブジェクト
float  G = 30.0;                      // 重力定数
float  Mass = 1.0;                    // 粒子と顔の質量
float  velo_MAX;                      // 生存粒子と顔の速度制限（これを超えたらリセット）
float  velo_MAX_DEAD = 2;             // 死亡粒子の速度制限
float  coef = 3.0;                    // 抗力係数
float  elapsed_time = 0.0;            // 経過時間(秒)
float  entry_face_interval = 7;       // 顔が出現するインターバル
float  gameover_time = 0;             // ゲームオーバーとなった時間
boolean gameover = false;             // ゲームオーバーになっているか
boolean slow_used = false;            // スローを使ったか
boolean slowing = false;              // スロー状態であるか
float slow_duration_time = 4;         // スロー継続時間
float slow_begin_time;                // スロー開始時間
float slow_elapsed_time;              // スロー経過時間
boolean end_effect = false;           // 終了時の赤く染めるエフェクトを表示するか

/////////////////////////////////////
void setup(){ ////////セットアップ

  //窓のサイズを指定
  if(online == false){
    size(800, 800); 
  }else{            //Web上ならばP2Dモードに
    size(800, 800, P2D);
  }
  colorMode(HSB); //カラーモードはHSBモードで
  background(0);  //背景を黒に
  
  //粒子オブジェクトの生成
  for(int i = 0; i < num_part; i++){
    parts[i] = new Part(Mass, random(width), random(height)); 
  }
  
  //復活玉オブジェクトの生成(まだ存在はしない)
  for(int i = 0; i < maxnum_revive; i++){
    rvvs[i] = new Revive(Mass, parts[0], parts[0], false);
  }
  
  //魔法陣オブジェクトの生成(まだエフェクトは表示しない）
  for(int i = 0; i < maxnum_mgcc; i++){
    mgccs[i] = new MagicCircle(parts[0].location, 0.0 ,false);
  }

  ca = new CenterAttractor(); //中心への引力のオブジェクト生成
  
  be = new BackEffect();      //背景エフェクトのオブジェクト生成
  
}
/////////////////////////////////////
void draw(){ ////////メインループ

  //現在の経過時間を秒で取得
  elapsed_time = 0.001*millis();
  
  //全滅したらその時間を記録
  if(gameover == true && gameover_time <= 0){
    gameover_time = elapsed_time;
  }
  
  //全滅するまで、顔と粒子の速さの制限は時間が経過するほど緩くなる
  if(gameover == false){
    velo_MAX = 1 + 0.06 * elapsed_time;
  }else{      //全滅したら、速さの制限は固定、スローは解除
    velo_MAX = 10;
    slowing = false;
  }
  
  //スロー状態の際
  if(slowing == true){
    slow_elapsed_time = elapsed_time - slow_begin_time;  // スロー状態の経過時間を更新
    if(slow_elapsed_time > slow_duration_time){  //スロー継続時間が経過したら
      slowing = false; //スローを解除
      be.slow(false);  //エフェクトを解除
    }
  }
 
  //entry_face_interval秒毎に顔を1つ追加、最大数はmaxnum_face
  if(elapsed_time >= num_face*(entry_face_interval) && num_face < maxnum_face ){
    faces[num_face] = new Face(Mass, random(width), random(height), num_face);
    num_face++;  //顔の数+1
  }
  
  be.display(); //attractorの表示（背景の表示）
  
  //全ての復活玉について
  for(int i = 0; i < maxnum_revive; i++){
    if(rvvs[i].exist == true){             //存在している復活玉のみ
      //rvvs[i]の復活対象の粒子 が rvvs[i] へ及ぼす力を計算
      PVector force = rvvs[i].target_part.attract(rvvs[i]); 
      force.mult(-1000);           //追尾精度は高く
      rvvs[i].applyForce(force);   //力を印加
      rvvs[i].update();
      rvvs[i].display();
      rvvs[i].periodicBoundary();
      rvvs[i].collisionDetection();
    }
  }
  
  
  //全ての顔について
  for(int i = num_face-1; i >= 0; i--){
    
    //相互反発処理
    for(int j = 0; j < num_face; j++){
      if(i != j){
        PVector force = faces[j].attract(faces[i]);        //粒子 j が粒子 i に及ぼす力を計算
        force.mult(1 + 2 * (float)deadnum_part/num_part);  //死亡粒子が多いほど強めに
        faces[i].applyForce(force);
      }
    }
    
    /* 顔の中心への引力について（全滅時）*/
    if(faces[i].bigging == true){
      PVector force2 = ca.attract(faces[i]); //中心の引力 ca がpart[i]へ及ぼす力を計算
      force2.mult(0.001);                    //弱めに
      faces[i].applyForce(force2);           //力を印加
    }
    faces[i].update();
    faces[i].display();
    //全滅時以外は、境界で反対側へ
    if(gameover == false){
      faces[i].periodicBoundary();
    }

  }
  
  
  // すべての粒子について
  for(int i = 0; i < num_part; i++){
    
    /* 粒子の中心へ引き寄せられる処理 */
    PVector force = ca.attract(parts[i]); //中心の引力 ca がparts[i]へ及ぼす力を計算
    if(parts[i].dead == false){    //生存粒子の場合
      force.mult(0.00000001 + 0.00000000009*pow(deadnum_part,5.05)); //死亡粒子が多いほど、力を強く 
    }else{
      force.mult(0.000001);  // 死亡粒子の場合、弱めに
    }
    parts[i].applyForce(force);  //力を印加
    
    
    /* 生存粒子に対しての処理 */
    if(parts[i].dead == false){
      
      /* 全ての顔に対して */
      for(int j = 0; j < num_face; j++){
        
        /* 顔から生存粒子が逃げる処理 */
        PVector force2 = faces[j].attract(parts[i]);   //face[j]がpart[i]へ及ぼす力(反発力)を計算
        force2.mult(0.000035*pow(deadnum_part, 5.75)); //死亡粒子が多いほど強く
        parts[i].applyForce(force2);                   //力を印加
        
        // 顔が生存粒子を追う処理 
        // 無敵状態の粒子は追わない
        if(parts[i].invincible == false){
        
          PVector force3 = parts[i].attract(faces[j]);     //part[i]がface[j]へ及ぼす力(反発力)を計算
          force3.mult(-1.0);                               //反発力を引力へ変換
          force3.mult(0.1+ 0.00068*pow(elapsed_time,2.7)); //時間が経過するほど強く
          faces[j].applyForce(force3);                     //力を印加
        }
        
        faces[j].collisionDetection(parts[i]); //顔と粒子の衝突判定
        
      }
      
    }
    
    
    /* 全ての粒子に対しての相互反発処理 */
    for(int j = 0; j < num_part; j++){  
      if(parts[i].dead == parts[j].dead){  //自分と相手の生存状況が同じ場合のみ
        if(i != j){  // 自分の粒子以外 
          PVector force4 = parts[j].attract(parts[i]); //粒子 j が粒子 i に及ぼす力を計算
          if(parts[i].dead == false){  //生存粒子の場合、死亡粒子が多いほど力を強く
            force4.mult(0.05 + 0.000027*pow(deadnum_part,5.3));     
          }else{
            force4.mult(1);  // 死亡粒子の場合
          }
          parts[i].applyForce(force4);  //粒子 への力の適用
        }
      } 
    }
   
    parts[i].update();                //粒子の状態を更新
    parts[i].display();               //粒子の表示
    parts[i].periodicBoundary();      //周期的境界条件の実現    
  }
  
  
  //全ての魔法陣について
  for(int i = 0; i < maxnum_mgcc; i++){
    if(mgccs[i].show == true){  //魔法陣の表示がオンなら表示
      mgccs[i].display();
    }
  }
  
  //終了時の赤く染めるエフェクトについて
  if(end_effect == true){
    be.end_effect_func();
  }
  
  /* 現在のステータス表示 */
  textSize(30);    //テキストサイズ指定
  if(existnum_part < 10){  //生存粒子数が一桁になったらサイズを大きく
    textSize(50);
  }
  fill(255);      //色は白
  int show_time;  //表示用時間
  if(gameover == true){  //全滅時は、全滅した時間を表示
    show_time = (int)gameover_time;
  }else{                 //通常時は、経過時間を表示
    show_time = (int)elapsed_time;
  }
  int sec_time = show_time % 60;              //秒を計算
  int min_time = show_time / 60;              //分を計算
  textAlign(RIGHT, TOP);                      //右端上揃え
  text(existnum_part,width-10,10);            //残りの生存粒子の数を右上に表示
  textSize(30);                               //サイズ指定
  textAlign(LEFT, TOP);                       //左端上揃え
  text((int)min_time + ":" + sec_time,10,10); //時間を左上に表示
  
}



//マウスのボタンを話した時に発生するイベント
void mousePressed(){ 
  
  //右クリックで顔の動作をスローに（一回だけ）
  if(mouseButton == RIGHT && slow_used == false){
    slow_used = true;               //スローを使用したことを記録
    slowing = true;                 //スローをオンに
    slow_begin_time = elapsed_time; //スロー開始時間を記録
    be.slow(true);                  //スローのエフェクト表示
    return;
  }
  
  //左クリックで操作のオンオフ
  if(mouseButton == LEFT){
    //粒子操作のオフについて
    for(int i = num_part-1; i >= 0; i--){ //操作中の粒子を探す
      if(parts[i].player == true){ 
        parts[i].play(false); //操作をオフに
        return;
      }
    }
    
    //操作粒子がなかった場合は、
    //粒子操作のオンについて
    for(int i = num_part-1; i >= 0; i--){ //生存粒子を探す
      if(parts[i].dead == false){
        parts[i].play(true);  //操作をオンに
        return;
      }
    }
  }
  
}




/////////////////////////////////////
//// クラスや関数の定義
/////////////////////////////////////
class Mover{ //////// 物体Moverクラスの定義
  PVector location;     //位置
  PVector velocity;     //速度
  PVector acceleration; //加速度
  float   mass;         //質量
  float   s_max = 1.0;  //初期速度設定範囲
  float   size;         //moverのサイズ
  float   velo_max;     //最大速度
  
  Mover(float m, float x, float y){  //コンストラクタ
    mass = m;       //質量を引数のmに設定
    location = new PVector(x,y);
    velocity = new PVector(random(-s_max, s_max),random(-s_max, s_max));
    acceleration = new PVector(0,0);
  }
  
  
  void applyForce(PVector force){  ////ニュートンの第２法則
    PVector f = PVector.div(force, mass); //力を受け取って質量で除算
    acceleration.add(f);                  //加速度に加算
  }
   
  
  PVector attract(Mover m){ ////引力（ここでは斥力：静電反発力）
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();  //物体とattractorの距離を取得
    float strength = - (G * mass * m.mass) / (distance * distance); //斥力
    force.normalize();
    force.mult(strength);         //単位ベクトルに万有引力の大きさを書ける
    return force;
  }
  
  
  void update(){   ////状態更新
    velocity.add(acceleration); //加速度を「積分」して速度に
    velocity.limit(velo_max);   //速度をvelo_maxに制限
    location.add(velocity);     //速度を「積分」して位置に
    acceleration.mult(0);       //加速度のクリア（ゼロをかけ算）（毎回クリア）
  }
  
  
  void display(){ ////表示
    smooth();      //滑らかに
    ellipse(location.x, location.y, size, size);  //円を表示
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
  

}




//Moverクラスを拡張した、粒子Partクラスの定義
class Part extends Mover{
  color   color_exist = color(50, 120, 255);    //生存粒子の色
  color   color_dead = color(255,255,155);      //死亡粒子の色
  boolean dead = false;                         //生存粒子ならばfalse、死亡粒子ならばtrue
  float   size_exist = 20;                      //生存粒子の大きさ 
  float   size_dead = 10;                       //死亡粒子の大きさ
  boolean player = false;                       //操作可能であるか
  boolean invincible = false;                   //復活後の無敵状態であるか
  float   invincible_begin_time;                //復活後の無敵状態開始時間
  float   invincible_duration_time;             //復活後の無敵状態継続時間
  float   invincible_initial_duration_time = 4; //復活後の無敵状態継続時間(初期値）
  float   invincible_elapsed_time = 0.0;        //復活後の無敵状態経過時間
  float   revive_interval;                      //復活玉の生成にかかる時間
  float   revive_initial_interval = 18;         //復活玉の生成にかかる時間(初期値)
  boolean target_revive = false;                //復活玉の目標となっているか
  float   play_begin_time = 0.0;                //操作開始時間(秒)
  float   player_elapsed_time = 0.0;            //操作経過時間
  float   player_color;                         //操作粒子の縁の色相

  Part(float m, float x, float y){   //コンストラクタ
    super(m,x,y);  //スーパークラス(Moverクラス)のコンストラクタを使用
  }
  
  
  void update(){
    super.update();
    
    //復活玉の生成について
    //粒子操作中で、操作開始から、復活玉の生成にかかる時間秒経過しているとき
    if(player == true && elapsed_time >= play_begin_time + revive_interval){
      for(int i = 0; i < num_part; i++){  //全ての粒子について
        //粒子iが死亡していて、その粒子が他の復活玉の目標となっていないならば
        if(parts[i].dead == true && parts[i].target_revive == false){
          for(int j = 0; j < maxnum_revive; j++){  //全ての復活玉について
            if(rvvs[j].exist == false){    //復活玉jが存在していないならば
              rvvs[j] = new Revive(Mass, this, parts[i], true); //復活玉jを新たに生成して、存在させる
              //粒子操作開始時間を現在の経過時間にリセット(新たな復活玉の生成のため)
              play_begin_time = elapsed_time;                   
              //復活玉の生成に掛かる時間を計算(死亡粒子が多いほど短い）
              revive_interval = revive_initial_interval * (float)existnum_part/num_part;
              break;
            }
          }
          break;
        } 
      }
    }
    
    //現在無敵状態ならば
    if(invincible == true){
      invincible_elapsed_time = elapsed_time - invincible_begin_time; //無敵状態経過時間を計算
      //無敵開始から、無敵継続時間が経過している時、無敵解除
      if(invincible_elapsed_time > invincible_duration_time){
        invincible = false;
      }
    }
    
    //粒子の速度制限について
    if(dead == true){  //死亡粒子はvelo_MAX_DEADに制限
      velo_max = velo_MAX_DEAD;  
    }else{            //生存粒子はvelo_MAX(変化する)に制限
      velo_max = velo_MAX;
      //復活後の無敵状態の時は
      if(invincible == true){
        //速度制限は0から徐々に上げてく
        velo_max = velo_MAX * invincible_elapsed_time / invincible_duration_time;
      } 
    }
    
    // 操作中の粒子の場合は
    if(player == true){
      player_color = elapsed_time*40%255;                   //粒子の縁の色を時間で変化するものに
      player_elapsed_time = elapsed_time - play_begin_time; //操作開始からの経過時間を更新
      location = new PVector(mouseX, mouseY);               //粒子の位置をマウスの位置に
    }
    
    //生存粒子、死亡粒子の色、大きさについて
    if( dead == false ){   // 生存粒子ならば
      fill(color_exist); // 円の色を生存したものに
      size = size_exist; // 円の大きさを生存したものに
    }else{                 // 死亡粒子ならば
      fill(color_dead);  // 円の色を死亡したものに
      size = size_dead;  // 円の大きさを死亡したものに
    }
    
    //操作粒子の縁について
    if(player == true){
      strokeWeight( size_exist * player_elapsed_time/revive_interval ); //縁の大きさは時間が経つほど大きく
      //復活玉が生成できないと無限に大きくなるため、縁の大きさの最大を制限
      if(player_elapsed_time >= revive_interval){  
        strokeWeight(size_exist);
      }
      stroke(player_color,255,255);  //徐々に色が変わる縁をつける
    }else{  //操作粒子でない場合、縁無しで
      noStroke();
    }
    
    //無敵状態の粒子について
    if(invincible == true){
      //粒子の大きさは、死亡粒子のものから、徐々に生存粒子のものへ
      size = size_dead + (size_exist-size_dead) * invincible_elapsed_time/invincible_duration_time;
      if(invincible_elapsed_time <= invincible_duration_time / 2 ){  //無敵状態時間の半分が経過するまで
        //粒子の色を徐々に白く
        fill(255, 255 - 255*invincible_elapsed_time/(invincible_duration_time/2), 155 + (255-155)*invincible_elapsed_time/(invincible_duration_time/2));
      }else{  // 無敵状態時間の半分が経過した後
        //粒子の色を徐々に生存粒子のものへ
        fill(50, 120 * (invincible_elapsed_time-invincible_duration_time/2)/(invincible_duration_time/2), 255);
      }
    }
    
  }
  
  
  //粒子の操作の切り替えをする関数
  //引数：b (操作をオンにする時true, オフにする時false)
  void play(boolean b){
    
    player = b;  //操作を切り替え
    if(b == true){  //操作をオンにする時
      //復活玉の生成時間を計算(死亡粒子が多いほど短い)
      revive_interval = revive_initial_interval * (float)existnum_part/num_part;
      play_begin_time = elapsed_time;  //操作開始時間を記録
    }
    
  }
  
  
  // 粒子が死亡する関数
  void die(){  
    
    dead = true; //死亡を記録
    if(player == true){   //操作中であった場合
      play(false);      //操作不能に
      be.player_dead(); //操作粒子が死亡した際のエフェクトを表示
    }
    be.part_dead();  //粒子が死亡した際のエフェクトを表示
    deadnum_part++;  //死亡粒子+1
    existnum_part--; //生存粒子-1
    if(existnum_part <= 0){   //全滅したら全滅を記録
      gameover = true;
    }
    acceleration.mult(0);    //速度をリセット
    
  }
  
  
  // 死亡粒子を復活させる
  void revive(){    
    
    dead = false;                         //生存を記録
    deadnum_part--;                       //死亡粒子-1
    existnum_part++;                      //生存粒子+1
    invincible = true;                    //無敵状態にする
    invincible_begin_time = elapsed_time; //無敵状態開始時間を現在の経過時間に
    target_revive = false;                //復活玉の目標ではなくなる

    //魔法陣を描く
    for(int i = 0; i < maxnum_mgcc; i++){  //全ての魔法陣に対して
      if(mgccs[i].show == false){  //表示されていないものがあれば
        mgccs[i] = new MagicCircle(location, 60, true);  //魔法陣を生成して表示させる
        break;
      }
    }
    //無敵状態継続時間を計算 生存粒子が多いほど長い
    invincible_duration_time = invincible_initial_duration_time * (float)existnum_part/num_part;
    
  }
  

}




//Moverクラスを拡張した復活玉(Revive)クラス
class Revive extends Mover{
  float hue;              //復活玉の色相
  float saturation = 255; //復活玉の彩度
  boolean exist;          //存在するか
  Part target_part;       //復活の対象となる死亡粒子
  
  
  //コンストラクタ
  //引数：Part 復活玉の生成元の操作中粒子
  //  　　tartget　復活の対象となる死亡粒子
  //      ex  存在させるか
  Revive(float m, Part gene, Part target, boolean ex){ 
    super(m, gene.location.x, gene.location.y); //スーパークラス(Moverクラス)のコンストラクタを使用
    size = 40;                                  //初期サイズ
    velo_max = 4;                               //速度制限
    exist = ex;                                 //存在を代入
    hue = gene.player_color;                    //初期色相は、生成元の操作粒子の縁の色相
    target_part = target;                       //復活の対象を代入
    target_part.target_revive = true;           //復活対象の死亡粒子について、復活玉の対象となることを記録
  }
  
  
  void update(){
    if(gameover == true){  //全滅したら、存在を消す
      exist = false;
      return;
    }
    super.update();
  }


  void display(){
    
    if(saturation >= 0){  //彩度は0になるまで徐々に減らす
      saturation -= 3;
    }
    if(size >= 20){  //サイズは20になるまで減らす
      size -= 0.15;
    }
    fill(hue,saturation,255); //色を指定
    noStroke();               //縁無し
    
    super.display();
  }
  
  
  /* 衝突判定 */
  void collisionDetection(){
    
    //復活対象の粒子の縁に、復活玉の縁が接したら
    if( PVector.dist(location, target_part.location) <= (target_part.size + size) / 2 ){
      target_part.revive();  //復活対象の粒子を復活させる
      exist = false;         //存在を消す
    }
    
  }
  
  
}




//魔法陣（MagicCircle）クラス
class MagicCircle{
  boolean show;            //表示中はtrue
  boolean fadeout = false; //エフェクトのフェードアウト中ならtrue
  float opacity = 0.0;     //エフェクトの不透明度
  float x;                 //位置のx座標
  float y;                 //位置のy座標
  float n;                 //大きさ
  
  //コンストラクタ
  //引数：loc　表示させる位置の座標
  //      size  大きさ
  //      sh    表示するか
  MagicCircle(PVector loc, float size, boolean sh){
    x = loc.x;
    y = loc.y;
    n = size;
    show = sh;
    opacity = 30;  //エフェクトの不透明度の初期値
  }
  
  
  //表示させる関数
  void display(){
    
    if(opacity > 255){    //不透明度が最大を超えたら
      fadeout = true;   //フェードアウト
    }
    if(opacity < 0){    //フェードアウトで、不透明度が0を下回ったら
      show = false;  //表示しない
    }
    //正三角形の描き方参考→http://noriok.hatenablog.com/entry/2012/09/17/173655
    noFill();             //中身は塗りつぶさない
    stroke(255,opacity);  //縁は白
    strokeWeight(1);      //縁の太さは１
    float b = n * sqrt(3) / 4.0;
    float c = n / 4.0;
    float d = c * tan(radians(30));
    float x1 = 0;
    float y1 = -(b + d);

    float r = radians(120);
    float x2 = x1*cos(r) - y1*sin(r);
    float y2 = x1*sin(r) + y1*cos(r);

    float x3 = x1*cos(r*2) - y1*sin(r*2);
    float y3 = x1*sin(r*2) + y1*cos(r*2);

    pushMatrix();
    beginShape();
    ellipse(x, y, 1.16*n, 1.16*n); //内側の円
    ellipse(x, y, 1.4*n, 1.4*n);   //外側の円
    translate(x, y);
    triangle(x1, y1, x2, y2, x3, y3);  //上向き正三角形
    rotate(radians(180));              //180度回転
    triangle(x1, y1, x2, y2, x3, y3);  //下向き正三角形
    endShape(CLOSE);
    popMatrix();
    if(fadeout == false){  //フェードアウトするまでは、徐々に不透明に
      opacity += 7;
    }else{                 //フェードアウト時は、徐々に透明に
      opacity -= 7;
    }
  }
    
}




//Moverクラスを拡張した、顔Faceクラスの定義
class Face extends Mover {
  int num;                      //顔の番号(番号が大きいほど顔は大きい)
  float hue;                    //顔の色相
  PVector eye_direction;        //粒子接近時の目の向き  
  boolean near = false;         //生存粒子に接近しているか
  boolean pre_near = false;     //１フレーム前のnear
  float near_correction = 0;    //接近時の顔表示用補正値(接近した時は1に)
  boolean appearing = false;    //最初の登場中はtrueに
  float appearing_size = 0;     //登場時の大きさ(少しずつ大きくなる)
  boolean bigging = false;      //全滅時の巨大化中はtrueに
  float bigging_maxsize = 1000; //巨大化中の最大サイズ
  boolean eating = false;       //捕食時はtrueに
  float eat_begin_time;         //捕食を開始した時間
  float eat_required_time = 1;  //捕食に掛かる時間
  PVector pre_location;         //1フレーム前の位置（軌跡消去用）
  float velo_MAX_SLOW = 1;      //スロー時の最大速度
  
  Face(float m, float x, float y, int i){  //コンストラクタ
    super(m,x,y);
    num = i;                         //顔の番号を代入
    size = 30+2.5*sq(num);           //後の顔ほどサイズを大きく
    appearing = true;                //登場中に
    pre_location = new PVector(x,y); //前の位置を初期化
  }


  void update(){
    
    //捕食中で、捕食開始から捕食必要時間経過したら、捕食終了
    if(eating == true && elapsed_time >= eat_begin_time + eat_required_time){
      eating = false;
    }
    
    //全滅時の巨大化時、捕食中でないとき、
    if(bigging == true && eating == false){
      near = true;                                          //常に粒子が近い状態に
      velocity.add(new PVector(random(-5,5),random(-5,5))); //目の向きをランダムに
      if(size <= bigging_maxsize){  //最大サイズまで、巨大化
        size *= 1.02; 
        if(size >= bigging_maxsize / 2){ //最大サイズの半分に達したら、背景を赤く染める
          end_effect = true;
        }
      }
    }
    
    //捕食時と登場中は、移動させない
    if(eating == true || appearing == true){
      if(gameover != false){
        acceleration.mult(0);
      }
      return;
    }
    
    velo_max = velo_MAX;  //速度制限を更新
    
    //スローの際は、速度をスローに制限
    if(slowing == true){
      velo_max = velo_MAX_SLOW;
    }
    
    pre_location = location.get();  //現在の位置を記録
    
    super.update();
    
  }
  
  
  void display(){
    
    //全滅時、巨大化中の顔以外は表示しない
    if(gameover == true && bigging == false){
      return;
    }
    
    smooth();
    
    //登場中以外の、軌跡消去用
    if(appearing == false){
      fill(0);    //色を黒に
      noStroke(); //縁はなし
      //１フレーム前の位置に黒い円を出して、軌跡を消す
      if(pre_near == true){  //前が接近状態だった場合
        ellipse(pre_location.x, pre_location.y, 1.2*size, 1.2*size );  
      }else{
        ellipse(pre_location.x, pre_location.y, size, size );
      }
      //接近時の軌跡の場合
      if(near == true){
        fill(hue,255,255);                                           //顔の色を指定
        strokeWeight(0.05*size);                                     //縁の太さ指定
        stroke(0);                                                   //縁を黒に
        ellipse(pre_location.x, pre_location.y, 1.2*size, 1.2*size); //顔の輪郭だけ表示して、目と口を消す
      }
      
    }
    
    hue = 30*(elapsed_time + 2*num) % 255; //顔の色相を更新(時間により変化,顔毎に異なる)
    fill(hue,255,255);       //顔の色を指定
    strokeWeight(0.05*size); //縁の太さ指定
    stroke(0);               //縁を黒に
    
    //登場中の顔について
    if(appearing == true){
      ellipse(location.x, location.y, appearing_size, appearing_size); //円を表示
      appearing_size += 0.4;   //登場中は少しずつ大きく
      if(appearing_size >= size){   //本来のサイズになったら、登場中を解除
        appearing = false;
      }
      return;  //他は表示しない
    }
    
    //捕食中は、粒子接近状態に
    if(eating == true){
      near = true;  
    }
    
    pre_near = near; //現在のnearを保存
    
    //接近状態では、接近補正値を1に
    if(near == true){
      near_correction = 1;
    }else{
      near_correction = 0;
    }
    
    //顔の輪郭を表示(粒子が近いと実際のサイズより拡大）
    ellipse(location.x, location.y, size*(1+0.2*near_correction), size*(1+0.2*near_correction) );
    
    //接近状態（捕食中は除外）のときの口の表示について
    if(eating == false && near == true){
      fill(255,255,255);                                 //中身は赤に
      arc(location.x, location.y, size, size, 0,PI);     //下唇表示
      fill(hue,255,255);                                 //上唇の上は顔の色で塗りつぶす
      arc(location.x, location.y, size, 0.6*size, 0,PI); //上唇表示
    }

    //目の黒い部分の表示について    
    fill(0);  //中身は黒
    //右目表示(粒子接近時拡大)
    ellipse(location.x + 0.23*size, location.y -0.15*size, (0.15+0.3*near_correction)*size, (0.15+0.3*near_correction)*size);
    //左目表示(粒子接近時拡大)
    ellipse(location.x - 0.23*size, location.y -0.15*size, (0.15+0.3*near_correction)*size, (0.15+0.3*near_correction)*size);  
    
    //目の赤い部分の表示について（粒子接近時のみ）
    if(near == true){
      noStroke();                     //縁無し
      fill(255,255,255);              //中身は赤
      eye_direction = velocity.get(); //目の向きは、現在の速度の向き
      eye_direction.normalize();
      eye_direction.mult(0.08);       //ベクトルの大きさは固定
      //右目表示(粒子の方向を見る)
      ellipse(location.x + ( 0.23+eye_direction.x)*size, location.y + (-0.15+eye_direction.y)*size, 0.4*size, 0.4*size);  
      //左目表示(粒子の方向を見る)
      ellipse(location.x + (-0.23+eye_direction.x)*size, location.y + (-0.15+eye_direction.y)*size, 0.4*size, 0.4*size);  
      
      near = false;  //粒子接近をリセット
      
    }
    
  }
  
  
  //引力を計算する関数
  PVector attract(Mover m){ ////引力（ここでは斥力：静電反発力）
  
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();    //物体とattractorの距離を取得
    if( distance > size/2 ){         //顔の直径よりも距離が離れている場合
      distance = distance - size/2;  //顔の縁との距離を測る
    }else{  //顔の中に入ってる場合、全力で逃げる
      distance = 0.01;
    }
    float strength = - (G * mass * m.mass) / pow(distance,2); //斥力
    force.normalize();
    force.mult(strength);         //単位ベクトルに万有引力の大きさを書ける
    return force;
    
  }
  
  
  // 粒子との衝突を判定する関数
  // 引数は、判定対象の粒子オブジェクト
  void collisionDetection(Part part){
    
    //捕食中や、登場中や、対象が死亡粒子の場合は判定しない
    if(eating == true || appearing == true || part.dead == true){  
      return;
    }
    //粒子との距離が、顔の半径+粒子の半径以下(つまり接している)場合は接近に(死亡粒子が多くなるほど,判定は甘く)
    if( PVector.dist(location, part.location) <= (size + part.size)/2 + 1.2*deadnum_part ){
      near = true;  //粒子接近を記録
      //顔の円の縁が粒子の中心に接したら 
      if( PVector.dist(location, part.location) <= size/2 ){
        eat(part);        //粒子partを捕食
      }
    }
      
  }
  
  
  //粒子を捕食する関数
  //引数は捕食対象の粒子オブジェクト
  void eat(Part part){
    
    //粒子が無敵状態の時は捕食できない
    if(part.invincible == true){
      return;
    }
    part.die();                    //粒子を死亡させる
    eating = true;                 //捕食中にする
    eat_begin_time = elapsed_time; //捕食開始時間を記録
    if(gameover == true){  //今回の捕食により、粒子が全滅したら、この顔は巨大化
      bigging = true;
    }
    acceleration.mult(0);  //加速度をリセット
    
  }
  
  
}




//中心への引力となるCenterAttractorクラス
class CenterAttractor{
  float mass;                          //質量
  PVector location;                    //位置
  
  CenterAttractor(){ //コンストラクタ
    location = new PVector(width/2, height/2); //位置は窓の中央
    mass = 1.5;
  }
   
   
  PVector attract(Mover m){ ////引力
    PVector force = PVector.sub(location, m.location);
    //float distance = force.mag(); //物体とattractorの距離を取得
    float distance = 20;            //距離は固定で
    force.normalize();              //規格化（長さを１に）
    float strength = (G * mass * m.mass) * (distance * distance); //引力
    force.mult(strength);           //単位ベクトルに引力の大きさを書ける
    return force;
  }

  
}




// 背景エフェクトを表示するBackEffectクラス
class BackEffect{
  boolean part_dead_effect = false;      //粒子が死亡した際のエフェクトを表示させるときtrueに
  float part_dead_light = 0.0;           //粒子死亡時のエフェクトの赤の明るさ
  boolean player_dead_effect = false;    //操作中の粒子が死亡した際のエフェクトを表示させるときtrueに
  float player_dead_light = 0.0;         //操作粒子死亡時のエフェクトの赤の明るさ
  boolean slow_effect = false;           //スローのエフェクト表示の際trueに
  float end_effect_opacity = 0.0;        //全滅時の赤く染めるエフェクトの赤の不透明度
  float end_gameover_opacity = 0.0;      //全滅時のGAMEOVER表示エフェクトの文字の不透明度
  boolean existnum_part_effect = false;  //生存粒子数エフェクトを表示する際trueに
  boolean existnum_part_fadeout = false; //生存粒子数エフェクトをフェードアウトする際trueに
  float existnum_part_opacity;           //生存粒子数エフェクトの文字の不透明度
  
  //粒子が死亡した時、専用のエフェクトを表示
  void part_dead(){  
    part_dead_effect = true;
  }
  
  
  //操作中の粒子が死亡した時、専用のエフェクトを表示
  void player_dead(){
    player_dead_effect = true;
  }
   
  //スローのエフェクロトをオン・オフする関数 
  void slow(boolean b){
    if(b == true){
      slow_effect = true;
    }else{
      slow_effect = false;
    }
  }
  
  //終了時に画面を赤く染める関数
  void end_effect_func(){
    fill(255,255,255,end_effect_opacity); //透明な赤(不透明度はend_effect_red依存)
    rect(0,0,width,height);               //画面を染める
    if(end_effect_opacity <= 255){  //透明じゃなくなるまで、徐々に不透明に
      end_effect_opacity += 3;
    }else{  //真っ赤に染まった後
      fill(0,end_gameover_opacity);         //GAMEOVERの透明度指定
      textSize(80);                         //GAMEOVER表示の大きさ
      textAlign(CENTER, CENTER);            //文字は中央揃え
      text("GAME OVER", width/2, height/2); //表示は中心
      if(end_gameover_opacity <= 255){  //透明じゃなくなるまで、徐々に不透明に
        end_gameover_opacity += 1.5;
      }
    }
      
  }
  
  
  //エフェクトとか表示
  void display(){
    noStroke();  //縁無し
    
    if(part_dead_effect == false && slow_effect == false){
      fill(0,20);               //黒い半透明背景で軌跡を消していく
      rect(0,0, width, height); //背景表示
    }
    
    //粒子が死亡した際の背景エフェクトについて
    if(part_dead_effect == true){
      part_dead_light += 0.3;            //徐々に明るく
      fill(255,255,255,part_dead_light); //背景を赤に(明るさはpart_dead_lightに依存）
      rect(0,0, width, height);          //背景表示
      if(part_dead_light > 8.5) {  //一定の明るさになったら、0に戻してエフェクト終了
        part_dead_light = 0;
        part_dead_effect = false;
      }
      //生存粒子数が5以下であれば生存粒子数エフェクトを表示
      if(existnum_part <= 5){
        existnum_part_effect = true;
        existnum_part_opacity = 10;  //不透明度は10に
      }
      
    }
    
    //生存粒子が一定以下になった際の生存粒子数表示について
    if(existnum_part_effect == true && existnum_part <= 5){   
      if(existnum_part_fadeout == false){  //フェードアウト前は
        existnum_part_opacity += 3;   //徐々に不透明に
      }else{                               //フェードアウト中は
        existnum_part_opacity -= 0.7; //徐々に透明に
      }
      textSize(700- 80 * existnum_part);        //生存粒子が少ないほど表示を大きく
      fill(255, 0, 255, existnum_part_opacity); //文字は白く不透明度はexistnum_part_white依存
      textAlign(CENTER, CENTER);                //文字は中心揃え
      text(existnum_part,width/2, height/2);    //中心に生存粒子数を表示
      if(existnum_part_opacity > 25){     //不透明度が一定を超えたら
        existnum_part_fadeout = true;  //フェードアウト開始
      }
      if(existnum_part_opacity < 0){      //フェードアウト時、不透明度が0を下回ったら
        existnum_part_fadeout = false; //フェードアウト解除
        existnum_part_effect = false;  //エフェクト表示終了
      }
        
      
    }
    
    //スローの際は背景を青に
    if(slow_effect == true){
      fill(170, 255, 40, 20);
      rect(0,0, width, height);  //背景表示
    }
    
    //操作中有の粒子が死亡した際の背景エフェクトについて
    if(player_dead_effect == true){
      strokeWeight(70);                     //縁の太さ
      noFill();                             //中身は塗りつぶさない
      player_dead_light += 10;              //徐々に明るく
      stroke(255, 255, player_dead_light);  //縁を赤に(明るさはplayer_dead_red依存)
      rect(0,0,width,height);               //エフェクト表示
      if(player_dead_light >= 150){  //一定の明るさになったら、0に戻してエフェクト終了
        player_dead_light = 0;
        player_dead_effect = false;
      }
    }
    
  }
  
}

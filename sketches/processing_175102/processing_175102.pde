
//////////////////////////////////////////////////////////////
// example 1.2 バウンドするボール (Shiffman, p.30)（やや改変）
//////////////////////////////////////////////////////////////
/////大域変数宣言エリア
int n = 100;
//PVector location;  //位置
//PVector velocity;  //速度
PVector[] locations = new PVector[n];
PVector[] velocities = new PVector[n];
/////セットアップ
void setup(){
  size(620,360);                   //窓のサイズ
  //location = new PVector(100,100); //オブジェクト生成
  //velocity = new PVector(2.5, 5);  //オブジェクト生成
  for(int i=0; i<n; i++){
    locations[i] = new PVector(random(0.1,10), random(0.1,10));
    velocities[i] = new PVector(random(0.1,10), random(0.1,10));
  }
  colorMode(HSB);
}
/////メインループ
void draw(){
  background(0);         //背景は黒色
   
  //location.add(velocity);  //位置の更新（速度ベクトルを加算）
  //checkBound();            //端でバウンドさせる
  //stroke(0);               //ボールの縁の色は黒色
  //fill(175);               //ボールの色は灰色
  //ellipse(location.x, location.y, 16, 16);  //ボールの描画
  for(int i=1; i<n; i++){
    locations[i].add(velocities[i]);
    checkBound(i);
    stroke(0);
    fill(i);
    fill(i*10%255, 255, 255);
    ellipse(locations[i].x, locations[i].y, 14, 14);
  }
}
///////////////////////
// 関数定義エリア
void checkBound(int i){  //端でバウンドさせる
  //if((location.x > width)||(location.x < 0)){
  //  velocity.x *= -1;  //速度のx成分の符号を変える
  //}
  //if((location.y > height)||(location.y < 0)){
  //  velocity.y *= -1;  //速度のy成分の符号を変える
  //}
 if((locations[i].x > width)||(locations[i].x < 0)){
   velocities[i].x *= -1;
 }
 if((locations[i].y > height)||(locations[i].y < 0)){
   velocities[i].y *= -1;
 }
}
void mousePressed(){    //マウスボタンが押されたら呼び出される関数
  //location.x = mouseX;  //マウスポインタのx座標
  //location.y = mouseY;  //マウスポインタのy座標
  //velocity.x = random(-10, 10);  //速度は乱数で
  //velocity.y = random(-10, 10);  //速度は乱数で
  for(int i=0; i<n; i++){
    locations[i].x = mouseX;
    locations[i].y = mouseY;
    velocities[i].x = random(-10, 10);
    velocities[i].y = random(-10, 10);
  }
}
///// EOF


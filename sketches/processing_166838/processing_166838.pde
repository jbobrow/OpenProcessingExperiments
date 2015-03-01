
// example 1.2 バウンドするボール (Shiffman, p.30)（やや改変）
//////////////////////////////////////////////////////////////
/////大域変数宣言エリア
PVector location;  //位置
PVector velocity;  //速度
int n = 100;
 PVector[] locations = new PVector[n]; //オブジェクト生成
 PVector[] velocitys = new PVector[n];  //オブジェクト生成
/////セットアップ
void setup(){
  size(500,300);                   //窓のサイズ
 for(int i = 0; i < n; i++){
    locations[i] = new PVector(i,i); 
    velocitys[i] = new PVector(i,i);
  }
  colorMode(HSB);
}
/////メインループ
void draw(){
  int j;
  background(255,10);         //背景は白色
  for(j=1; j < n; j +=1)
  {
  locations[j].add(velocitys[j]);  //位置の更新（速度ベクトルを加算）
  checkBound(j);            //端でバウンドさせる
  stroke(0);               //ボールの縁の色は黒色
  fill(175);               //ボールの色は灰色
  fill(j*10%255,255,255);
  ellipse(locations[j].x, locations[j].y, 16, 16);  //ボールの描画
  }
}
///////////////////////
// 関数定義エリア
void checkBound(int j){  //端でバウンドさせる

  if((locations[j].x > width)||(locations[j].x < 0)){
    velocitys[j].x *= -1;  //速度のx成分の符号を変える
  }
  if((locations[j].y > height)||(locations[j].y < 0)){
    velocitys[j].y *= -1;  //速度のy成分の符号を変える
  }

}
void mousePressed(){    //マウスボタンが押されたら呼び出される関数
for(int j = 0; j < n; j++)
{
  locations[j].x = mouseX;  //マウスポインタのx座標
  locations[j].y = mouseY;  //マウスポインタのy座標
  velocitys[j].x = random(-10, 10);  //速度は乱数で
  velocitys[j].y = random(-10, 10);  //速度は乱数で
}
}
///// EOF

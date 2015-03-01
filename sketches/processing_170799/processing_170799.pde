
////////////////////////////////////////////
//  random walker
////////////////////////////////////////////

Walker w;
/////
void setup(){
  size(640,360);
  colorMode(HSB);    //色指定はHSBモード
  w = new Walker();  // オブジェクト w の生成
  background(150);
}
/////
void draw(){
  w.step();          //オブジェクト w に歩かせる
  w.display();       //オブジェクト w に自分を表示してもらう
}
/////
///// クラス定義
class Walker{
  float x;      //状態変数
  float y;      //状態変数
  float tx, ty; //パーリンノイズ用
  float x1, y1;
  Walker(){
    tx = 0;
    ty = 10000;
    x1=50;
    y1=50;
  }
  void display(){ //表示用メソッド
    fill(tx*100%256,255,255);  //色指定
    ellipse(x, y, x1, y1);     //円を描画
  }
  void step(){    //「歩く」メソッド
    x = map(noise(tx), 0, 1, 0, width);  //パーリンノイズ
    y = map(noise(ty), 0, 1, 0, height); //パーリンノイズ
    tx += 0.01;
    ty += 0.01;
  }
}
void mousePressed(){
if( mouseButton == LEFT ) {
   if(
     (mouseX-w.x)*(mouseX-w.x) + (mouseY-w.y)*(mouseY-w.y) <= (w.x1/2)*(w.x1/2)
    ){
   w.x1 += 10;
   w.y1 += 10;
 }
   //左ボタンが押されたときの処理
} else if( mouseButton == CENTER ) {
  if(
    (mouseX-w.x)*(mouseX-w.x) + (mouseY-w.y)*(mouseY-w.y) <= (w.x1/2)*(w.x1/2)
  ){
  w.x1 = 20;
  w.y1 = 20;
  }
  //中央ボタンが押されたときの処理
} else if( mouseButton == RIGHT ) {
  if(
    (mouseX-w.x)*(mouseX-w.x) + (mouseY-w.y)*(mouseY-w.y) <= (w.x1/2)*(w.x1/2)
  ){
  w.x1 -= 20;
  w.y1 -= 20; 
  }
  //右ボタンが押されたときの処理
  }
}
/////


////////////////////////////////////////////
//  random walker
////////////////////////////////////////////
 
Walker w;
/////
void setup(){
  size(640,360);
  colorMode(HSB);    //色指定はHSBモード
  w = new Walker();  // オブジェクト w の生成
  background(0);
}
/////
void draw(){
  w.step();          //オブジェクト w に歩かせる
  w.display();       //オブジェクト w に自分を表示してもらうbbbbbbbb
}
/////
///// クラス定義
class Walker{
  float x;      //状態変数
  float y;      //状態変数
  float tx, ty; //パーリンノイズ用
  
  Walker(){
    tx = 0;
    ty = 10000;
  }
  void display(){ //表示用メソッド
    if(!keyPressed){
    fill(255);  //色指定
    stroke(0);
    ellipse(x, y, 30, 30);     //円を描画
    }else{
      w.keyPressed();
    }
  }
  void step(){    //「歩く」メソッド
    x = map(noise(tx), 0, 1, 0, width);  //パーリンノイズ
    y = map(noise(ty), 0, 1, 0, height); //パーリンノイズ
    tx += 0.01;
    ty += 0.01;
  }
  
  void keyPressed(){
      if(key == 'A' || key == 'a'){
        fill(0);
        stroke(255);
      }else if(key == 'S' || key == 's'){
        fill(tx*100%256,255,255);
        stroke(0);
      }
      ellipse(x,y,30,30);
  }
}
/////

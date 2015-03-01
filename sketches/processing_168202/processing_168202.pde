

////////////////////////////////////////////
//  random walker
////////////////////////////////////////////
int N = 20; //個体数
int mouse_l, mouse_cen, mouse_r;
/*mouse_l = 0;
mouse_cen = 0;
mouse_r = 0;
*/
Walker[] walkers = new Walker[N];
/////
void setup(){
  size(640,480);
  colorMode(HSB);    //色指定はHSBモード
  for(int i = 0; i < N; i++){
    walkers[i] = new Walker(i);  // オブジェクト walkers の生成
  }
}
/////
void draw(){
  fill(150,10);           //第２に引数は不透明度
  rect(0,0,width,height); //ある程度透明な長方形を窓にかぶせる
  for(int i = 0; i < N; i++){
    walkers[i].step();          //オブジェクトに歩かせる
    walkers[i].display();       //オブジェクトに自分を表示してもらう
  }
}
/////
///// クラス定義
class Walker{
  float x;      //状態変数
  float y;      //状態変数
  int hue;      //色指定
  float tx, ty; //パーリンノイズ用
  float wei, hei;  //円の幅、高さ
  float tmp;
  
  Walker(int i){
    tx = 10000 * i;
    ty = 10000 * (i + 1);
    hue = (int)((float)i / N * 256);
  }
  void display(){ //表示用メソッド
    fill(hue,255,255);  //色指定（HSBモード）
    ellipse(x, y, wei, hei);     //円を描画
  }
  void step(){    //「歩く」メソッド
    x = map(noise(tx), 0, 1, 0, width);  //パーリンノイズ
    y = map(noise(ty), 0, 1, 0, height); //パーリンノイズ
    tx += 0.01;
    ty += 0.01;
    
    wei += 0.1;
    hei += 0.1;
    
    if(mouse_cen == 0){
      if(mouse_l == 0){
        wei ++;
      }
      else{
        wei --;
      }
      if(mouse_r == 0){
        hei ++;
      }
      else{
        hei --;
      }
    }
    else{
      tmp = wei;
      hei = wei;
      wei = tmp;
    }

  }
}

void mousePressed(){
  if(mouseButton == LEFT){
    if(mouse_l == 0){
      mouse_l = 1;
    }
    else{
      mouse_l = 0;
    }
  }
  else if(mouseButton == CENTER){
    if(mouse_cen == 0){
      mouse_cen = 1;
    }
    else{
      mouse_cen = 0;
    }
  }
  else if(mouseButton == RIGHT){
    if(mouse_r == 0){
      mouse_r = 1;
    }
    else{
      mouse_r = 0;
    }
  }
}
/////

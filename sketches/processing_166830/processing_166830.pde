
////////////////////////////////////////////
//  random walker
////////////////////////////////////////////
 
Walker w;
 float tx, ty; //パーリンノイズ用
int mouseFlag;
/////
void setup(){
  size(640,360);
  mouseFlag = 0;
  colorMode(HSB);    //色指定はHSBモード
  w = new Walker();  // オブジェクト w の生成
    background(150);
 
}
/////
void draw(){
 
  w.step();          //オブジェクト w に歩かせる
  w.display();       //オブジェクト w に自分を表示してもらう
/*  if(mouseFlag == 3)
  {
    w.display2();
  }*/
   fill(255,0,255,3);
     ellipse(width/2, height/2 , 1000,1000);
    
} 
/////
///// クラス定義
class Walker{
  float x;      //状態変数
  float y;      //状態変数
    float x2;      //状態変数
  float y2;      //状態変数
 
  float okisa;
  
  Walker(){
    tx = 0;
    ty = 10000;
    okisa = 100; 
  }
  void display(){ //表示用メソッド
    fill(tx*100%256,255,255,70);  //色指定
    
    ellipse(x, y, okisa, okisa);     //円を描画
  }
  
   void display2(){ //表示用メソッド
    fill(tx*100%256,255,255);  //色指定
    ellipse(x2, y2, okisa, okisa);     //円を描画
  }
  
  void step(){    //「歩く」メソッド
    x = map(noise(tx), 0, 1, 0, width);  //パーリンノイズ
    y = map(noise(ty), 0, 1, 0, height); //パーリンノイズ
     x2 = map(noise(tx*2), 0, 1, 0, width);  //パーリンノイズ
    y2 = map(noise(ty*2), 0, 1, 0, height); //パーリンノイズ
    tx += 0.01;
    ty += 0.01;

    if(mouseFlag == 0)
    {
      okisa += 0.5;
    }
    else if(okisa < 0)
    {
      okisa = 0;
    }
    else if(mouseFlag == 1)
    {
      okisa -= 0.5;
    }
    else if(okisa > 100)
   {
    okisa = 100;
   } 
   else if(mouseFlag == 2)
   {
     okisa = random(40);
   }
   else 
   {
   }

     
   

  }
}



void keyPressed() {
  if(key ==  'z' ){
    mouseFlag = 3;  
  }
   if(key ==  'x' ){
    
  }
}

void mousePressed(){
if( mouseButton == LEFT ) {
   //左ボタンが押されたときの処理
   mouseFlag = 0;
} else if( mouseButton == CENTER ) {
   //中央ボタンが押されたときの処理
   mouseFlag = 2;
} else if( mouseButton == RIGHT ) {
   //右ボタンが押されたときの処理
  mouseFlag = 1;
  }
} 
/////

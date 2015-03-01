
//  random walker
////////////////////////////////////////////
 int N =14;
 int count =0;
 
 int[] flag = new int[N];

Walker w1;
Walker w2;
Walker w3;
Walker[] ws = new Walker[N];
/////
void setup(){
  size(640,360);
  colorMode(HSB);    //色指定はHSBモード
  w1 = new Walker();  // オブジェクト w の生成
  w2 = new Walker();
  w3 = new Walker();
  for(int i=0; i<N; i++){
    ws[i] = new Walker();
  }
 for(int i=0;i<N;i++){
   flag[i] = 0; 
 }
  background(150);
}
/////
void draw(){
  fill(0,40);
  rect(0,0,width,height);
  w1.step();          //オブジェクト w に歩かせる
  w1.display();       //オブジェクト w に自分を表示してもらう
  w2.step();
  w2.display();
  w3.step();
  w3.display();
  for(int i=0;i<N;i++){
    if(flag[i] == 1){
       ws[i].step();
       ws[i].display(); 
    }
  }
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
    fill(tx*100%256,255,255);  //色指定
    noStroke();
    ellipse(x+random(10), y+random(10), random(20), random(20));     //円を描画
  }
  void step(){    //「歩く」メソッド
    x = map(noise(tx), 0, 1, 0, width);  //パーリンノイズ
    y = map(noise(ty), 0, 1, 0, height); //パーリンノイズ
    tx = tx+0.01+random(0.005);
    ty = ty+ 0.01+random(0.005);
  }
  
}

void mousePressed(){    //マウスボタンが押されたら呼び出される関数
    
   if(count<N){
        flag[count]=1;
    count++;
   }
}
  
  





////////////////////////////////////////////
//  random walker
////////////////////////////////////////////
///// クラス定義
class Walker{ //クラス名の最初は大文字で
  int x;      //状態変数
  int y;      //状態変数
  Walker(){   //コンストラクタ（初期化のためのメソッド．new で呼び出される）
    x = width/2;  //窓の中心に
    y = height/2; //窓の中心に
  }
  void display(){ //表示用メソッド
    background(255);
    stroke(0);    //黒色に
    ellipse(x, y, 25, 25);  //座標(x, y)に点を描画
  }
  void step(){    //「歩く」メソッド
 // 0,1,2,3 のいずれか
    if(mouseX - x > 0 && mouseY - y >0)
    {
     int choice = int(random(6));
     if(choice == 0 || choice == 4){
          x++;
        }else if(choice == 1 ){
          x--;
        }else if(choice == 2 || choice == 5){
          y++;
        }else{
          y--;
        }
      }
      else if(mouseX-x > 0 && mouseY-y < 0)
      {
       int choice = int(random(6));
        if(choice == 0 || choice == 4){
          x++;
        }else if(choice == 1 ){
          x--;
        }else if(choice == 2){
          y++;
        }else{
          y--;
        }
      }
      else if(mouseX-x < 0 && mouseY-y > 0)
      {
       int choice = int(random(6));
        if(choice == 0){
          x++;
        }else if(choice == 1  || choice == 4){
          x--;
        }else if(choice == 2  || choice == 5){
          y++;
        }else{
          y--;
        }
      }
       else if(mouseX-x < 0 && mouseY-y < 0)
      {
       int choice = int(random(6));
        if(choice == 0 ){
          x++;
        }else if(choice == 1 || choice == 4){
          x--;
        }else if(choice == 2){
          y++;
        }else{
          y--;
        }
      }
      else
      {
       int choice = int(random(4));
        if(choice == 0 ){
          x++;
        }else if(choice == 1 ){
          x--;
        }else if(choice == 2){
          y++;
        }else{
          y--;
        }
      }
     }
   }

/////
Walker w;            //「Walker型」の「変数」（オブジェクト） w の宣言
/////
void setup(){        //「前準備」
  size(640,360);
  w = new Walker();  // オブジェクト w の生成
  background(255);
}
/////
void draw(){         //「メイン関数」（無限ループ）
  w.step();          //オブジェクト w に歩かせる
  w.display();       //オブジェクト w に自分を表示してもらう
}
/////

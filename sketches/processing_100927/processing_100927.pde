
/*
〔問15〕「現在の座標軸」を基準に原点から(200,0)まで直線を描き、その後、
translate(200,0)とrotate(radians(180-36))を実行します。この操作を何回か繰り返し、星形
を描く関数foo(int w,color c)を定義して下さい。引数w では描く直線の幅を指
定し、引数cでは描く線の色を指定します。この関数では、pushMatrix 関数とpopMatrix 関数を使用して、
foo 関数実行前の「現在の座標軸」の状態に戻してから、foo 関数の実行を終了
するようにして下さい。また、この関数foo を利用して、次のプログラムを実行してみて下さい。


*/
void foo(int w, color c){
 stroke(c);
 strokeWeight(w); 
 for (int i=0; i<5;i++) {
  line(0,0,200,0);
  translate(200,0);
  rotate(radians(180-36));
 } 
}
void setup(){
 size(400,400);
 smooth(); 
}
void draw(){
 background(255);
 stroke(0);
 translate(mouseX,mouseY);
 pushMatrix();
  foo(20,color(0,0,0));
 popMatrix();
 pushMatrix();
  foo(10,color(0,0,255));
 popMatrix();
 pushMatrix();
  foo(2,color(0,255,0));
 popMatrix();
}

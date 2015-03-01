
size(600, 300);  //全体のサイズ
colorMode(RGB);  //カラーモードをRGBに変換
background(255);  //全体の背景の色
fill(0);

rect(300,0,300,600);//左背景の色
  for(int x= 10; x <= 295; x+=5){  //左の円
   noFill();  //図形の中に色を塗らない
   strokeWeight(3);  //線の太さ
   stroke(100+x,50,135,150);  //線の色
   ellipse(x,150,10,10);  //左円の描画
}
 
  
for(int x= 10; x <= 300; x+=5){  //右の円
   strokeWeight(3);  //線の太さ
   stroke(270-x,x,150-x,100);  //線の色
   ellipse(295+x,150,x,x);  //右円の描画
      
}
 



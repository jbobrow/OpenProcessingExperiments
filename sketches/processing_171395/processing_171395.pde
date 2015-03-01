
/*@pjs preload="0.png";*/
int eSize=5;
size(600, 300);
background(255);  
colorMode(HSB, 100, 200, 100);

//左側がスタートボタンを押す前、時が止まっている様子を表現しました。
//右側が変わり続ける時の流れを表現しました


//黒い線ーーーーーーーーーーーーーーーーーーーー
//奥行の表現

for(int x = 0; x <= width; x +=20) {
  for(int y = 0; y <= height; y += 30) {
    strokeWeight(5);
   stroke(200,90, 0, 30);
    line(800, -30, x, y);
  }
}

//仕切りの四角ーーーーーーーーーーーーーーーーーーーーーー
fill(0);
rectMode(CENTER);    
rect(150, 150, 300, 300);

//上の丸のグラデーーーーーーーーーーーーーーーーーーーーーーーーーーー
//上と下からきている動きがストップしている感じ
noStroke() ;  
for (int y = 0; y < 100; y+=10) {
  for (int x = 0; x < 300; x+=68) {
    fill(x/3, y, 100);
    ellipse(x, y, 50, 50);
  }
}

//下の丸のグラデーーーーーーーーーーーーーーーーーーーーーーーーーー
noStroke() ;  
for (int y =260; y < 300; y+=5) {
  for (int x = 0; x < 300; x+=40) {
    fill(x/3, y/2, 100);
    ellipse(x, y, 25, 25);
  }
}

//丸ーーーーーーーーーーーーーーーーーーーーーーーー
//スタートボタンをイメージ
noStroke();
strokeWeight( 10 );

fill(#00FF00);
 rect(150,195, 300,10);
 
 fill(#33CC99);
 rect(150,205, 300, 10);

 fill(#0033CC);
 rect(150,215, 300, 10);
 
 fill(255,0,255);
 rect(150,185, 300, 10);
 
 
 
 fill(255,255,0);
 arc( 70, 180, 100, 100, radians(0), radians(290) );
 
 fill(#00FF00);
 arc( 70, 180, 80,80, radians(0), radians(290) );
 
 fill(0);
 arc( 70, 180, 50, 50, radians(0), radians(360) );
 
//三角ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
 fill(#00FF00);
 triangle(100,140,80,175,115,165);

//数字ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
//時間の流れ
PImage img1;

img1 = loadImage("0.png");

tint(#FFFFFF);
image(img1,300,10,300,300);

 
 

 




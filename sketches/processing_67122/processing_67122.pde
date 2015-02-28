
size(200,200); // サイズ指定
fill(255,255,255); // 白で塗る
stroke(0,0,0); // 黒の線
smooth(); // 滑らかに
background(0,0,0);

int x;
int y;
int kankaku;

kankaku=10;
for(x=5; x<=200; x=x+kankaku) {
  for(y=5; y<=200; y=y+kankaku) {
    fill(random(255),random(255),random(255));
    ellipse(x,y,kankaku,kankaku);
  }
}
fill(255,255,255); // 白で塗る
rect(30,50,20,130);//1
triangle(50,50, 50,70, 70,50);//2
triangle(50,70, 70,50, 150,180);//3
rect(150,50,20,130);//4
fill(255,255,255);
text("By Akiyoshi MATSUYAMA",70,190);
save("sougou2-N.jpg");


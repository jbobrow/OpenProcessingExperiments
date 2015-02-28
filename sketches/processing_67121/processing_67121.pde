
size(200,200);
fill(17,206,237); // 白で塗る
stroke(0,0,0); // 黒の線
smooth(); // 滑らかに
int x;
int y;
int kankaku;
int yuragi;

background(0,0,0);
kankaku=10;
for(x=10; x<=200; x=x+kankaku) {
  for(y=10; y<=200; y=y+kankaku) {
    yuragi=int(random(4))-2;
    println(yuragi);
    if((x+y)%20==0)
    {
      fill(255,0,0);
      ellipse(x+yuragi,y+yuragi,kankaku*0.8,kankaku*0.8);}
    else
    {
      fill(0,0,255);
      rect(x-kankaku/2+yuragi,y-kankaku/2+yuragi,kankaku*0.8,kankaku*0.8);}
  }
}




fill(255,255,255); // 白で塗る

rect(60,30,80,10);
rect(60,160,80,10);
rect(40,50,20,100);
rect(140,50,20,100);
triangle(60,30, 40,50, 60,50);
triangle(100,20, 60,30, 100,30);
triangle(100,40, 60,40, 60,50);
triangle(100,20, 100,30, 140,30);
triangle(100,40, 140,40, 140,50);
triangle(140,30, 140,50, 160,50);
triangle(60,150, 40,150, 60,170);
triangle(60,150, 60,160, 100,160);
triangle(60,170, 100,170, 100,180);
triangle(140,150, 100,160, 140,160);
triangle(140,170, 100,170, 100,180);
triangle(140,150, 140,170, 160,150);

fill(255,255,255);
text("By ONEYAMAsan",70,190);
save("sougou2-O.jpg");














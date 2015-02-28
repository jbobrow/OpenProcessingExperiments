
//乱数を用いたゆらぎ(auto20)

size(200,200);
fill(255,0,0);
noStroke();
smooth();

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
size(200,200); // サイズ指定
fill(255,255,255); // 白で塗る
stroke(0,0,0); // 黒の線
smooth(); // 滑らかに

rect(50,18,25,160);
rect(75,20,60,20);
rect(75,105,60,20);

triangle(135,40,160,40,150,75);
triangle(135,105,160,105,150,75);
triangle(160,40,150,75,175,75);
triangle(160,105,150,75,175,75);
triangle(135,20,160,40,135,40);
triangle(135,105,150,75,175,75);
triangle(135,105,160,105,135,125);
fill(255,255,255);
text("By haruko hamada",70,190);
save("sougou2-P.jpg");



//文字を入れる(auto22)

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

fill(255,255,255);
stroke(0);
rect(60,40,70,15);
rect(60,90,70,15);
rect(60,40,15,120);
rect(130,40,15,120);

fill(255,255,255);
text("By nozomi kobayashi",70,190);
save("sougou2-A.jpg");




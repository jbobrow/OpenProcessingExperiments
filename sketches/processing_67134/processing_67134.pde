
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
      fill(242,10,157);
      ellipse(x+yuragi,y+yuragi,kankaku*0.8,kankaku*0.8);}
    else
    {
      fill(random(255),random(255),random(255));
      rect(x-kankaku/2+yuragi,y-kankaku/2+yuragi,kankaku*0.8,kankaku*0.8);}
  }
}
size(200,200);
smooth();
fill(255,255,255);
ellipse(100,40,80,20);
ellipse(100,100,30,100);
ellipse(100,160,80,20);

fill(255,255,255);
text("By Haruka Negishi",70,190);

save("sougou2-I.jpg");


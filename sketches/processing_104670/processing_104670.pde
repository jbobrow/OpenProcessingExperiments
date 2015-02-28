
size(200,200);
fill(255,0,0);
noStroke();
smooth();

int x;
int y;
int kankaku;
int yuragi;

background(255,255,255);
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
noStroke();
noStroke();

fill(255,255,255);
rect(50,30,130,30);
fill(255,255,255);
rect(30,30,30,150);
fill(255,255,255);
rect(60,100,80,30);
fill(255,255,255);
fill(0,0,0);
text("By Haruki Kurano",70,190);


save("sougou2-F");



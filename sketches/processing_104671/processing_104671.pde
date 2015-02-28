
//文字を入れる(auto22)

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
      fill(242,250,162);
      ellipse(x+yuragi,y+yuragi,kankaku*0.8,kankaku*0.8);}
    else
    {
      fill(66,44,5);
      rect(x-kankaku/2+yuragi,y-kankaku/2+yuragi,kankaku*0.8,kankaku*0.8);}
  }
}
fill(250,204,248);
rect(20,20,30,130);
triangle(20,150,50,180,75,150);
triangle(75,150,50,180,75,190);
rect(75,150,50,40);
triangle(50,125,50,150,75,150);
triangle(125,150,125,190,150,180);
triangle(125,150,150,180,180,150);
rect(150,20,30,130);
triangle(150,125,150,150,125,150);
fill(102,33,173);
text("By Kirara Kiatamura",70,190);
save("sougou2-U.jpg");





//作品を画像ファイルとして保存(auto21)

size(200,200);
fill(255,0,0);
noStroke();
smooth();

int x;
int y;
int kankaku;
int yuragi;

background(40,99,245);
kankaku=50;
for(x=25; x<=200; x=x+kankaku) {
  for(y=25; y<=200; y=y+kankaku) {
    yuragi=int(random(4))-2;
    println(yuragi);
    if((x+y)%20==0)
    {
      fill(250,116,232);
      ellipse(x+yuragi,y+yuragi,kankaku*0.8,kankaku*0.8);}
    else
    {
      fill(21,234,119);
      rect(x-kankaku/2+yuragi,y-kankaku/2+yuragi,kankaku*0.8,kankaku*0.8);}
  }
}
size(200,200);
//fill(255,255,255);
//rect(0,0,200,200);

//ellipse(100,100,100,125);
//fill(255,255,255);
fill(255,255,255,0);
strokeWeight(20);
stroke(255,255,255);
ellipse(100,100,70,100);


fill(247,12,28);
text("                  by Mizusawa Motoharu",10,190);
save("sougou2-O.jpg");


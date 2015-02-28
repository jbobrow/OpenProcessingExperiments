
//文字を入れる(auto22)

size(200,200);
fill(255,0,0);
noStroke();
smooth();

int x;
int y;
int kankaku;
int yuragi;

background(0,0,30);
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
stroke(0,0,0);
  fill(255, 255, 255);
  rect(30, 20, 150, 30);
  triangle(90, 50, 120, 50, 120, 70);
  triangle(90, 50, 120, 70, 90, 70);
  triangle(90,70,120,70,90,90);
  triangle(90,90,120,70,120,90);
  triangle(90,90,120,90,120,110);
  triangle(90,90,120,110,90,110);
  triangle(90,110,120,110,90,130);
  triangle(90,130,120,110,120,130);
  triangle(90,130,120,130,120,150);
  triangle(90,130,120,150,90,150);
  triangle(90,150,120,150,90,170);
  triangle(90,170,120,150,120,170);
fill(0,255,0);
text("By  Reiji Suzuki",100,190);
save("sougou2-T.jpg");




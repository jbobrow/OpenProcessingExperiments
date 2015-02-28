
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
rect(45,75,20,50);
triangle(65,55,45,75,65,75);
triangle(45,125,65,125,65,145);
triangle(65,55,65,75,95,55);
triangle(65,125,65,145,95,145);
triangle(65,55,95,35,95,55);
triangle(65,145,95,145,95,165);
triangle(95,35,95,55,125,55);
triangle(95,145,95,165,125,145);
triangle(95,55,125,55,125,75);
triangle(95,145,125,145,125,125);
triangle(125,55,125,75,145,75);
triangle(125,125,125,145,145,125);

fill(255,255,255);
text("By Tomo Aizawa",100,190);
save("sougou2-C.jpg");




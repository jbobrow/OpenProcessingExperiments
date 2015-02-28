
//円と正方形を交互に(auto19)
size(200,200);
noStroke();
smooth();
int x;
int y;
int kankaku;
background(0,0,0);
stroke(255,255,255);

kankaku=20;
for(y=0; y<=200; y=y+kankaku) {
 line(0,y, 200,y); // 横線

}
for(x=0; x<=200; x=x+kankaku) {
 line(x,0, x,200); // 縦線
}

kankaku=15;
for(x=10; x<=200; x=x+kankaku) {
  for(y=10; y<=200; y=y+kankaku) {
    if((x+y)%20==0)
    {
      fill(255,175,0);
      ellipse(x,y,kankaku*0.9,kankaku*0.9);}
    else
    {
      fill(0,200,255);
      rect(x-kankaku/2,y-kankaku/2,kankaku*0.9,kankaku*0.9);}
  }
}

fill(255,255,255);
stroke(0,0,0);
rect(30,20,45,150);
rect(30,150,145,40);
triangle(30,20,30,80,75,50);
triangle(30,80,30,140,75,110);
triangle(30,140,30,150,75,150);
triangle(30,190,90,190,60,150);
triangle(90,190,150,190,120,150);
triangle(120,150,175,150,150,190);
line(52.5,20,52.5,150);
line(30,170,175,170);
fill(0,0,255);
text("By Ryou Murakami",70,190);
save("sougou2-L.jpg");







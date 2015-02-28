
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/66312*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//sougou2-P
//背景の作成
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
//    println(yuragi);
    if((x+y)%20==0)
    {
      fill(255,255,0);
      ellipse(x+yuragi,y+yuragi,kankaku*0.8,kankaku*0.8);}
    else
    {
      fill(0,255,255);
      rect(x-kankaku/2+yuragi,y-kankaku/2+yuragi,kankaku*0.8,kankaku*0.8);}
  }
}

//アルファベットの作成
fill(255,255,255);
stroke(0,0,0);
rect(50,20,25,160);
rect(75,20,55,25);
rect(75,105,55,25);
triangle(130,20, 160,45, 130,45);
triangle(130,105, 160,105, 130,130);
triangle(135,45, 160,45, 150,75);
triangle(135,105, 160,105, 150,75);
triangle(160,45, 150,75, 175,75);
triangle(160,105, 150,75, 175,75);

fill(255,255,255);
text("                 By Taisuke HORIUCHI",10,190);

save("sougou2-P.jpg");



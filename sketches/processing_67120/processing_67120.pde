
//円の色をランダムに(auto15)
size(200,200);
fill(255,0,0);
noStroke();
smooth();

background(0,0,0);

int x;
int y;
int kankaku;

kankaku=10;
for(x=5; x<=200; x=x+kankaku) {
  for(y=5; y<=200; y=y+kankaku) {
    fill(random(255),random(255),random(255));
    ellipse(x,y,kankaku,kankaku);
  }
}
fill(255,255,255);
triangle(130,40, 160,70,130,70);//1
triangle(130,70, 160,70,160,90);//2
rect(70,40,60,30);//3
triangle(70,40, 70,70,40,70);//4
rect(40,70,30,30);//5
triangle(40,100, 70,100,70,130);//6
rect(70,100,60,30);//7
triangle(130,100, 160,130,130,130);//8
rect(130,130,30,30);//9
rect(70,160,90,30);//10
triangle(70,160, 70,190,40,190);//11
triangle(70,160, 40,190,40,160);//11

fill(255,255,255);
text("By HIROYOSHI ISHII",50,20);
save("sougou2-S.jpg");



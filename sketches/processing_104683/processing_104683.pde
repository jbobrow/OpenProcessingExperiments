
//繰り返し(auto5)
size(200,200);
int x;
int y;
int a;
int b;
int i;

background(0,0,0);
for(i=1; i<=100; i++) {
  stroke(int(random(255)),int(random(255)),int(random(255)));
  x=int(random(200));
  y=int(random(200));
  a=int(random(200));
  b=int(random(200));
  line(x,y,a,b);
}
stroke(0,0,0);
rect(85,20,80,30);
rect(165,30,10,10);
triangle(165,20,165,30,175,30);
triangle(165,40,165,50,175,40);
rect(70,20,15,30);
triangle(70,20,50,40,70,40);
rect(50,40,20,60);
triangle(75,50,85,50,75,60);
rect(70,50,5,70);
triangle(50,100,70,100,70,120);
triangle(75,80,75,90,85,90);
rect(75,90,75,30);
triangle(150,90,150,110,170,110);
rect(150,110,20,50);
rect(135,120,15,30);
triangle(125,120,135,120,135,130);
triangle(150,160,170,160,150,180);
triangle(135,140,135,150,125,150);
rect(60,150,90,30);
triangle(60,150,50,160,60,160);
rect(50,160,10,10);
triangle(50,170,60,170,60,180);
text("　　　      　   by Takemura.Hiroki",10,195);
save("sougou2-S.jpg");


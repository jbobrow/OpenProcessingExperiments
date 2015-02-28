
//繰り返し(auto5)
size(200,200);
int x,a,b,r,g;
int y;
int i;

background(98,89,46);
for(i=1; i<=100; i++) {
  x=int(random(200));
  y=int(random(200));
  b=int(random(200));
  r=int(random(200));
  g=int(random(200));
  a=int(random(30));
  fill(r,g,b);
  ellipse(x,y,a,a);
}
fill(255,255,255);
size(200,200);
smooth();
rect(100,30,50,20);
triangle(70,50,100,30,100,50);
rect(70,50,30,70);
triangle(70,120,90,120,90,140);
rect(90,120,40,20);
rect(130,100,20,50);

fill(255,255,255);
text("By Kouki Minemura",70,190);
save("sougou2-G.jpg");


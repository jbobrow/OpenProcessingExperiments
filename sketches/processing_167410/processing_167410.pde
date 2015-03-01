
int a=0;
int b=10;
int c=20;
int d=30;
int e=40;
int f=50;
int g=60;
int h=70;
int i=80;
int j=25;
int k=55;
int l=#FF2983;
int m=#5AFF29;
int n=#FF0000;

void setup()
{
  size(800,400);
  background(0);
}
void draw()
{
  background(0);
  frameRate(5);
fill(255,213,149);
stroke(255,213,149);
ellipse(e,140,60,40);
quad(b,190,c,190,b,210,a,210);
quad(g,190,h,190,i,210,h,210);
rect(c,270,10,10);
rect(f,270,10,10);
rect(d,160,20,10);
fill(0);
stroke(0);
ellipse(j,135,10,10);
ellipse(k,135,10,10);
ellipse(e,150,10,10);
fill(m);
stroke(m);
triangle(b,120,c,120,b,130);
triangle(a,140,b,140,a,150);
triangle(a,160,b,160,a,170);
triangle(g,120,h,120,h,130);
triangle(h,140,i,140,i,150);
triangle(h,160,i,160,i,170);
fill(l);
stroke(l);
triangle(a,130,b,130,a,140);
triangle(a,150,b,150,a,160);
triangle(h,130,i,130,i,140);
triangle(h,150,i,150,i,160);
fill(255);
stroke(255);
quad(c,170,g,170,h,190,b,190);
rect(c,190,40,30);
fill(n);
stroke(n);
quad(c,220,g,220,i,270,a,270);

a=a+10;
b=b+10;
c=c+10;
d=d+10;
e=e+10;
f=f+10;
g=g+10;
h=h+10;
i=i+10;
j=j+10;
k=k+10;
l=l+10;
m=m+10;
n=n+10;
}

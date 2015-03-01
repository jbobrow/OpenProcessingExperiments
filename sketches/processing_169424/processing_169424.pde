
int a=160;
int b=180;
int c=185;
int d=200;
int e=205;
int f=220;
int g=240;
int bb=#FCFFFC;
int bs=#FAF2E6;
float m;
void setup()
{
size(500,500);
}
void draw()
{
 frameRate(15);
background(#26EADF);
fill(bb);
bb=bb+bs;
m= random(20,30);
ellipse(b,150,m,70);
ellipse(f,150,m,70);
ellipse(d,300,120,100);
ellipse(d,220,80,80);
d=d+1;
ellipse(a,355,60,20);
a=a+1;
ellipse(g,355,60,20);
g=g+1;
ellipse(b,300,20,40);
b=b+1;
ellipse(f,300,20,40);
f=f+1;
fill(#000505);
float n;
n=random(5,15);
rect(c,210,n,10);
c=c+1;
rect(e,210,n,10);
e=e+1;
}


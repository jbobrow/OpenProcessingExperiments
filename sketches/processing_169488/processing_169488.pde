
int a=150;
int b=300;
int c=600;
int d=450;
int e=375;
int f=370;
int g=380;
int h=#EA2157;
int v=#EA9FC0;
int w=#EA3B87;
int u=#E587F2;

void setup()
{
size (1000,750);

}
void draw()
{

 frameRate(50);
  background(v);
  v=v+w;
float k;
k=random(200,300);
float j;
j=random(150,200);
stroke(h);
h=h+u;
fill(h,150);
ellipse(a,150,k,300);
stroke(h);
fill(h,150);
a=a+1;
stroke(h);
fill(#FA90AC);
ellipse(b,300,j,j);
b=b+1;
stroke(h);
fill(h,150);
ellipse(a,600,k,300);
stroke(h);
fill(#FA90AC);
ellipse(b,450,j,j);
stroke(h);
fill(h,150);

ellipse(c,150,k,300);
c=c+1;
stroke(h);
fill(#FA90AC);
ellipse(d,300,j,j);
d=d+1;
stroke(h);
fill(h,150);
ellipse(c,600,k,300);
stroke(h);
fill(#FA90AC);
ellipse(d,450,j,j);


stroke(h);
fill(#E587F2);
ellipse(e,400,50,600);
e=e+1;

fill(#403A40);
line(b,90,f,130);
f=f+1;
line(g,130,d,90);
g=g+1;

}

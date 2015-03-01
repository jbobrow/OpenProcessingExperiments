
int q=#BF1313;
int r=#ED3907;
int s=#6DC14C;
int t=#6075D8;

void setup()

{
size(500,500);
background(#A78C8C);
stroke(#CB28DE);
fill(#CB28DE);
strokeWeight(3);

line(width/2,0,width/2,height);
line(0,width/2,width,height/2);

}

void draw()
{
 
frameRate(10);

stroke(#36B405);
fill(s);
s=s+t;
float i;
i=random(width/2,height);
float j;
j=random(0,height/2);
float k;
k=random(1,30);
float l;
l=random(1,30);
ellipse(i,j,k,l);

stroke(#0930EA);
fill(t);
t=t+s;
float m;
m=random(0,height/2);
float n;
n=random(width/2,height);
float o;
o=random(1,30);
float p;
p=random(1,30);
ellipse(m,n,o,p);


stroke(q);
 q=q+r; 
fill(#FF6767);
float a;
a=random(1,height/2);
float b;
b=random(1,height/2);
float c;
c=random(1,30);
float d;
d=random(1,30);
rect(a,b,c,d);
  

stroke(r);
r=r+q;
fill(#E86B49);
float e;
e=random(width/2,height);
float f;
f=random(width/2,height);
float g;
g=random(1,30);
float h;
h=random(1,30);
rect(e,f,g,h);
}
void mousePressed()
{
  fill(#A78C8C);
  rect(width/2,0,width/2,height/2);
  rect(0,height/2,width/2,height/2);
}

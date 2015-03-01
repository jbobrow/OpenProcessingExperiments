
float k;
float r;
float g;
float b;

void setup()
{
size(500,500);
background(255);
strokeWeight(3);
rect(0,0,250,250);
rect(250,0,250,250);
rect(0,250,250,250);
rect(250,250,250,250);}

void draw()
{
k=random(0,5);
strokeWeight(k);
r=random(0);
g=random(255);
b=random(0);
frameRate(5);
fill(r,g,b);
float a;
a=random(width/2);
float b;
b=random(height/2);
float c;
c=random(50);
float d;
d=random(50);
rect(a,b,c,d);

r=random(255);
g=random(0);
b=random(0);
fill(r,g,b);
float l;
l=random(width/2,width);
float m;
m=random(height/2);
float n;
n=random(50);
float o;
o=random(50);
ellipse(l,m,n,o);


r=random(0);
g=random(0);
b=random(255);
fill(r,g,b);
float p;
p=random(width/2);
float q;
q=random(height/2,height);
float s;
s=random(50);
float t;
t=random(50);
ellipse(p,q,s,t);


r=random(255);
g=random(255);
b=random(255);
fill(r,g,b);
float u;
u=random(width/2,width);
float v;
v=random(height/2,height);
float w;
w=random(50);
float x;
x=random(50);
rect(u,v,w,x);


}

void mousePressed()
{strokeWeight(3);
fill(255);
rect(0,0,250,250);
k=random(0,5);
strokeWeight(k);
r=random(0);
g=random(255);
b=random(0);
frameRate(5);
fill(r,g,b);
float a;
a=random(width/2);
float b;
b=random(height/2);
float c;
c=random(50);
float d;
d=random(50);
rect(a,b,c,d);
strokeWeight(3);
fill(255);
rect(250,250,250,250);
r=random(255);
g=random(255);
b=random(255);
fill(r,g,b);
float u;
u=random(width/2,width);
float v;
v=random(height/2,height);
float w;
w=random(50);
float x;
x=random(50);
rect(u,v,w,x);}

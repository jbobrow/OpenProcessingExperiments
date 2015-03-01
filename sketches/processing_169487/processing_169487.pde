
int a=50;
int f=80;
int c=220;
int d=100;
int e=148;
float x;
float r;
float g;
float b;
void setup()
{size(800,500);}
void draw()
{background(0);
fill(#CEC6C6);
strokeWeight(3);
x=random(0,100);
ellipse(f,300,x,30);
f=f+1;
x=random(0,100);
ellipse(c,300,x,30);
c=c+1;
r=random(255);
g=random(255);
b=random(255);
fill(r,g,b);
rect(a,250,200,50);
a=a+1;
r=random(255);
g=random(255);
b=random(255);
fill(r,g,b);
rect(d,200,100,50);
d=d+1;
rect(e,220,40,30);
e=e+1;
}


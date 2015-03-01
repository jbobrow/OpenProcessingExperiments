
int x=3;
int y=3;
int s=4;
int t=4;
int q=#7C3052;
int w=#18F254;
int d=#9A8D0F;
int f=#4945C6;
void setup()
{size(300,140);}
void draw()
{background(#129FA4);
stroke(0);
fill(q);
q=q+w;
rect(x,10,60,110);
x=x+3;
fill(w);
w=w+q;
rect(y,30,40,70);
y=y+3;
fill(d);
d=d+f;
ellipse(s,110,20,20);
s=s+3;
fill(f);
f=f+w;
ellipse(t,20,20,20);
t=t+3;}

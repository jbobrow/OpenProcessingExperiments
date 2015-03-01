
int a=100;
int b=70;
int c=130;
int d=80;
int o=#FC14FC;
int p=#0DF0FA;
float x;
float y;
float z;
void setup()
{
size(500,200);
}
void draw()
{
background(o);
o=o+p;
fill(#DE98D4);
noStroke();
ellipse(a,60,40,40);
x=random(200);
y=random(150);
z=random(50);
fill(x,y,z);
triangle(b,50,a,20,c,50);
fill(#E11A1A);
rect(d,80,40,60);
fill(#0888EF);
rect(d,140,40,20);
a=a+1;
b=b+1;
c=c+1;
d=d+1;
}



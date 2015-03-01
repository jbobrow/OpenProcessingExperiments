
float a;
float c;
float d;
float f;
float r;
float g;
float b;

float h;
float k;
float i;
float j;

float l;
float m;
float n;
float o;

float p;
float q;
float t;
float s;
float x;
float y;


void setup()
{
  background(#F7E511);
size(800,800);
smooth();


fill(#FFF7F7);
stroke(#FFF7F7);
strokeWeight(5);
line(0,400,800,400);

fill(#FFF7F7);
stroke(#FFF7F7);
strokeWeight(5);
line(400,0,400,800);
}

void draw()
{
a=random(0,240);
c=random(0,350);
d=random(0,200);
f=random(0,100);
r=random(200);
g=random(200);
b=random(200);


stroke(#FFF7F7);
fill(r,g,b);
rect(a,c,d,f);

h=random(420,800);
i=random(0,400);
j=random(10,80);
k=random(10,80);

stroke(#FF0509);
fill(r,g,b);
ellipse(h,i,j,k);

l=random(0,400);
m=random(400,800);
n=random(10,60);
o=random(10,50);

stroke(#57FF05);
fill(r,g,b);
ellipse(l,m,n,o);

a=random(400,800);
c=random(400,800);
d=random(0,200);
f=random(0,100);
r=random(200);
g=random(200);
b=random(200);


stroke(#FFF7F7);
fill(r,g,b);
rect(a,c,d,f);
}

void mousePressed()
{

  fill(#F7E511);
rect(0,0,400,400);
rect(400,400,400,400);


}

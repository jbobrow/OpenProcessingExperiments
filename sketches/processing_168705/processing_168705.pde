
float a;
float b;
float c;
float d;
float e;
float f;
float g;
float h;
float i;
float j;
float k;
float l;
float x;
float y;
float z;
float m;
float n;
float o;
float p;
void setup()
{
  size(800,800);
  background(0);
  fill(255);
  line(0,100,200,100);
  line(100,0,200,100);
}
void draw()
{
a=random(width/2);
b=random(height/2);
c=random(30);
d=random(30);
fill(#640171,200);
rect(a,b,c,d);
e=random(width/2,width/1);
f=random(height/2,height/1);
g=random(30);
h=random(30);
fill(#10DEB6,200);
rect(e,f,g,h);
i=random(width/2);
j=random(height/2,height/1);
k=random(30);
l=random(30);
x=random(100);
y=random(150);
z=random(200);
fill(x,y,z,200);
ellipse(i,j,k,l);
m=random(width/2,width/1);
n=random(height/2);
o=random(40);
p=random(40);
fill(x,y,z,200);
ellipse(m,n,o,p);
}
void mousePressed()
{
fill(0);
rect(width/2,height/2,width/2,height/2);
rect(0,0,width/2,height/2);
}
  

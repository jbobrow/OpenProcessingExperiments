
float q;
float w;
float z;
float b;
float t;
float k;
float s;
float l;
float u;
float e;
float m;
float v;
float a;
float n;
float c;
float d;
float col;
float cal;
float cul;
float bla;
float ble;
float bli;
float tit;
float tot;
float tut;
float rac;
float rec;
float ric;
void setup()
{size(500,500);
stroke(0);
fill(255);
rect(0,0,250,250);
rect(0,250,250,250);
rect(250,0,250,250);
rect(250,250,250,250);}
void draw()
{col=random(255);
cal=random(255);
cul=random(255);
fill(col,cal,cul);
float q;
q=random(1,135);
float w;
w=random(1,135);
float z;
z=random(1,135);
float b;
b=random(1,135);
rect(q,w,z,b);
bla=random(255);
ble=random(255);
bli=random(255);
fill(bla,ble,bli);
float t;
t=random(250,800);
float k;
k=random(250,800);
float s;
s=random(250,800);
float l;
l=random(250,800);
rect(t,k,s,l);
tit=random(255);
tot=random(255);
tut=random(255);
fill(tit,tot,tut);
float u;
u=random(250,190);
float e;
e=random(0,190);
float m;
m=random(250,190);
float v;
v=random(1,70);
rect(u,e,m,v);
rac=random(255);
rec=random(255);
ric=random(255);
fill(rac,rec,ric);
float a;
a=random(0,250);
float n;
n=random(250,180);
float c;
c=random(30,18);
float d;
d=random(250,180);
rect(a,n,c,d);}
void mousePressed()
{fill(255);
rect(0,0,250,250);
rect(250,250,250,250);}



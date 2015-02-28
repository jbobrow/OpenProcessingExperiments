

int x=0;
int y=20;
int a=50;
int b=50;
int c=400;
int d=0;
int e=10;
int f=10;
int z=50;
int g=200;
int h=230;
int i= 0;

void setup () {
  size (400,400);
  background (255);
}

void draw () {
  fill(g,h,i);
  ellipse (x,y,a,b);
  x=x+1;
  y=y+2;
  a=a+1;
  b=b+1;
  
if(y>400){
 y=0;
}
if(x>400){
  x=0;
}
if(a>100){
  a=50;
}
if(b>100){
  b=50;
}

fill(z,z,z);
ellipse (c,d,e,f);
c=c-1;
d=d+2;
e=e+1;
f=f+1;

if(c<0) {
  c=400;
}
if (d>500) {
  d=0;
}
if (e>30) {
  e=10;
}
if (f>30) {
  f=10;
}
 if (mousePressed) {
   z=150;
   g=255;
   h=122;
   i=66;
 }else {
   z=50;
   g=200;
   h=230;
   i=0;
 }
}



                

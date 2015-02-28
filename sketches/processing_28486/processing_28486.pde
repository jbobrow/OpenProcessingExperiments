
int x=-10;
int y=-30;
int c=410;
int d=-10;
int z=50;
int g=137;
int h=104;
int i=89;
int q=224;
int r=73;
int s=87;
int a=410;
int b=410;
int t=255;
int u=205;
int v=42;
int e=-10;
int f=410;


void setup () {
  size (400,400);
  background (255);
}

void draw () {
  fill(t,u,v);
  rect (e,f,5,5);
  e=e+3;
  f=f-1;
  if(e>430) {
    e=-10;
  }
  if (f<-50) {
    f=410;
  }
 fill (q,r,s);
 rect (a,b, 10,30);
 a=a-2;
 b=b-1;
 if(a<-50) {
   a=410;
 }
 if(b<-30) {
   b=410;
 }
  fill(z,z,z);
  rect (x,y,50,10);
  x=x+1;
  y=y+2;
  
if(y>400){
 y=-30;
}
if(x>400){
  x=-10;
}

fill(g,h,i);
rect (c,d,10,10);
c=c-1;
d=d+2;

if(c<-10) {
  c=410;
}
if (d>500) {
  d=-10;
}

 if (mousePressed) {
   z=255;
   g=0;
   h=0;
   i=0;
   q=255;
   r=205;
   s=42;
   t=224;
   u=73;
   v=87;
 }else {
   z=50;
   g=137;
   h=104;
   i=89;
   q=224;
   r=73;
   s=87;
   t=255;
   u=205;
   v=42;
 }
}
                

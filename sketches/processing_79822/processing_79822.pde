
int a=5;
void setup()
{
size(300,300);
noFill();
frameRate(10);
}
int r=255, g=0, b=210;
int x1=0;
int y1=150;
int x2=300;
int y2=150;
int c=0;
int d=0;
int a1=300;
int b1=0;
int a2=0;
int b2=300;
int f=0;
int h=0;
int z=5;
int j=0;
void draw()
{

stroke(r,g,b);

if(a<321)
  ellipse(150,150,a,a);

else{
  line(x1,y1,x2,y2);
  y1=y1-10;
  y2=y2+10;
  r=255;
  b=0;
}
if (f<601){
  line(a1,b1,a2,b2);
  a1=a1-10;
  a2=a2+10;
  r=r-2;
  b=b+20;
  f=f+1;
}
a = a + 20;

if (h<100){
  stroke(0,255,50);
  ellipse(300,0,z,z);
  z=z+10;
  h=h+1;}
if (h<100){
  stroke(255,255,50);
  ellipse(0,300,z,z);
  z=z+10;
  j=j+1;}





}






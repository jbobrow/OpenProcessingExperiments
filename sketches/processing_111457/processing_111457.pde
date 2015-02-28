
PImage hakim;
boolean filterApplied=false;
boolean drawn=false;
void setup()
{
  size(500,500);
  hakim=requestImage("hakim.jpg");
}
void draw()
{
  if(drawn==false &&hakim.width>0)
  {
    drawn=true;
    if(hakim.width>0)
    {
      hakim.filter(GRAY);
      filterApplied =true;
    }
    image(hakim,0,0,500,500);
    stroke(255,0,0);
     int y=0;
 while(y<height)
 {
   line(0,y,width,y);
   //horzontal
   y+=30;
 }
 int q=30;
 int t=470;
 while(t > -height)
 {
   line(0,t,q,height);
   q+=30;
   t-=30;
 }
 q=470;
 t=470;
 while(q > -width)
 {
   line(width,t,q,height);
   q-=30;
   t-=30;
 }
  float a=0;
  float b=99;
  float prevA=a;
  float prevB=b;
  strokeWeight(5);
  stroke(0,0,255);
while(a<500)
{
  a+=5;
  b+=random(-10,10);
  line(prevA, prevB,a,b);
  prevA=a;
  prevB=b;
  }
  float c=0;
  float d=300;
  float prevC=c;
  float prevD=d;
  strokeWeight(5);
  stroke(#3E7E06);
while(c<500)
{
  c+=5;
  d+=random(-10,10);
  line(prevC, prevD,c,d);
  prevC=c;
  prevD=d;
  }
    float e=0;
  float f=400;
  float prevE=e;
  float prevF=f;
  strokeWeight(5);
  stroke(#7E7906);
while(e<500)
{
  e+=5;
  f+=random(-10,10);
  line(prevE, prevF,e,f);
  prevE=e;
  prevF=f;
  }
  float g=150;
  float h=0;
  float prevG=g;
  float prevH=h;
  strokeWeight(5);
  stroke(#E813A8);
while(h<500)
{
  g+=random(-10,10);
  h+=noise(h*.005);
  line(prevG, prevH,g,h);
  prevG=g;
  prevH=h;
  }
  float i=300;
  float j=0;
  float prevI=i;
  float prevJ=j;
  strokeWeight(5);
  stroke(#14E3FC);
while(j<500)
{
  i+=random(-10,10);
  j+=noise(j*.02);
  line(prevI, prevJ,i,j);
  prevI=i;
  prevJ=j;
  }
  float k=400;
  float l=0;
  float prevK=k;
  float prevL=l;
  strokeWeight(5);
  stroke(#23FC14);
while(l<500)
{
  if(k>500)
  {
    k-=10;
  }
  k+=random(-10,10);
  l+=noise(l*.02);
  line(prevK, prevL,k,l);
  prevK=k;
  prevL=l;
  }
}
  }
  



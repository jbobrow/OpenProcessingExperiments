
//A drop of olive oil over a plastic tablecloth, or
//another bouncing ball by estebangreg
PImage img=createImage(300,200,RGB);
int lado=10;
int paso=16;
int m=30;
int n=150;
int e=70;
int f=190;
int speedx=1;
int speedy=1;
int speede=1;
int speedf=1;
int radius=40;
color colorin;
color bolin=color(76,214,213);
float distance;
void setup()
{
size(300,200);
background(255,255,121);
noStroke();
fill(255,53,3);
for(int i=0;i<width;i+=paso)
{
  for(int j=0;j<height;j+=paso)
  {
    rect(i,j,lado,lado);
  }
}
for(int i=0;i<width;i++)
{
  for(int j=0;j<height;j++)
  {
    colorin=get(i,j);
    img.set(i,j,colorin);
  }
}
frameRate(60);
}
void draw()
{
background(255);
noStroke();
fill(255,0,0);
for(int i=0;i<width;i+=paso)
{
  for(int j=0;j<height;j+=paso)
  {
    rect(i,j,lado,lado);
  }
}
for(int r=(m-radius);r<(m+radius);r+=1)
{
  for(int s=(n-radius);s<(n+radius);s+=1)
  {
    
    float distancia=sqrt((r-m)*(r-m)+(s-n)*(s-n));
    if(distancia<(radius-4))
    {
      float angulo=acos(sqrt(radius*radius-distancia*distancia)/radius);
      float factor=PI*angulo/2;
      int p=int(m+factor*(r-m));
      int q=int(n+factor*(s-n));
      colorin=img.get(p,q);
      set(r,s,colorin);
    }
  }
}

m=m+speedx;
n=n+speedy;
e=e+speede;
f=f+speedf;
if((m>(width-20))||(m<20)) speedx=-speedx;
if((n>(height-20))||(n<20)) speedy=-speedy;
if((e>(width-10))||(e<10)) speede=-speede;
if((f>(height-10))||(f<10)) speedf=-speedf;
distance=sqrt((m-e)*(m-e)+(n-f)*(n-f));
if(distance<30)
{
  speede=-speede;
  speedf=-speedf;
  bolin=color(76,214,136);
  fill(bolin);
  ellipse(e,f,15*90/(distance+35),15*90/(distance+35));
}
else
{
  bolin=color(76,214,213);
  fill(bolin);
  ellipse(e,f,20,20);
}
}



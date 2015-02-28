
//A drop of olive oil over a plastic tablecloth, or
//another bouncing ball by estebangreg
PImage img=createImage(300,200,RGB);
int lado=10;
int paso=16;
int m=50;
int n=150;
int speedx=1;
int speedy=1;
int radius=50;
color colorin;
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
if((m>(width-25))||(m<25)) speedx=-speedx;
if((n>(height-25))||(n<25)) speedy=-speedy;
}



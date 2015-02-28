
//Jarvis Law,Ticklish Penguin,CP1 mod 16-17
int a=255;
int b=255;
int c=255;
int x=250;
int y=250;
int z=0;

void setup()
{
  size(500,500);
  frameRate(10);
   background(0);
}

void draw()
{
   fill(0,20);
   rect(0,0,500,500);
   fill(256-a,256-b,256-c);
   stroke(a,b,c);
   strokeWeight(2);
   a=a-20;
   b=b-10;
   c=c-5;
   ellipse(x,y,25,25);
  int z=int(random(0,4));
  if(z==0)
  {
    x=x+15;
  }
  else if(z==1)
  {
    x=x-15;
  }
  else if(z==2)
  {
    y=y+15;
  }
  else
  {
    y=y-15;
  }
  if(a<16)
  {
  a=255;
  }
  if(b<16)
  {  
    b=255;
  }
  if(c<16)
  {
   c=255;
 }
}

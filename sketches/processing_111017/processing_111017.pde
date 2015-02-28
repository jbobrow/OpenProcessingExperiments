
PImage weirdpic;
PImage wakka;
PImage sea;
boolean filterApplied = false;
boolean hasDrawn=false;
void setup()
{
  weirdpic=requestImage("test.jpg");
  wakka=requestImage("wakka.png");
 sea=requestImage("sea.jpg"); 
  size (500,500);
}
void draw()
{
  if (hasDrawn == false && weirdpic.width>0 && wakka.width>0 && sea.width>0)
  {
    hasDrawn = true;
  if(weirdpic.width>0)
  {
    if(filterApplied == false)
    {
    weirdpic.filter(INVERT);
    filterApplied = true;
  }
    image(weirdpic,0,0,500,500);
  }
  if(wakka.width>0)
  {
    image(wakka,0,250,100,100);
  }
  if(sea.width>0)
  {
    image(sea,400,250,100,100);
  }
  float a=100;
  float b=250;
  float prevA=a;
  float prevB=b;
  strokeWeight(5);
while(a<400)
{
  //if(hasDrawn==false)
  {
  a+=5;
  b+=random(-10,10);
  line(prevA, prevB,a,b);
  prevA=a;
  prevB=b;
  }
}
float c=100;
float d=350;
float prevC=c;
float prevD=d;
while(c<400)
{
  c+=noise(c*.005);
  d+=random(-5,4.9);
  line(prevC,prevD,c,d);
  prevC=c;
  prevD=d;
}
strokeWeight(1);
 stroke(0);
 int x =0;
 while(x<width)
 {
   line(x,0,x, height);
   x+=50;
 }
 int y=0;
 while(y<height)
 {
   line(0,y,width,y);
   y+=50;
 }
 for(x=0; x<width;x+=50)
 {
   stroke(0);
   line(x,0,x,height);
 }
 }
}



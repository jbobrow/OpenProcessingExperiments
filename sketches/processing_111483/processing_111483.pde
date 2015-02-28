
PImage me;
boolean filterA = false;
int x=300;
int y=300;
int wdt=1;
int hgt=1;
int xx=0;
int yy=0;
int wdtz=600;
int hgtz=600;
boolean stop=false;
void setup()
{
  size(600,600);
  me = requestImage("me.jpg");
  frameRate(40);
   if (me.width > 0)
    {
       if (filterA == false)
    {
      me.filter(INVERT);
      filterA=true;
    }   
      image(me,0,0,width,height);
}
  
}
 



void draw()
{
  float r = random(0, 255);
   float s= random(0,200);
    float t= random (100,200); 
   //tint(r,255,255,255);
 
  if (me.width > 0)
    {
       if (filterA == false)
    {
      me.filter(INVERT);
      filterA=true;
      image(me,0,0,width,height);

    }   
       stroke(255,0,0);  
    //  image(me,0,0,width,height);

image(me,x,y,wdt,hgt);
  image(me,xx,yy,wdtz,hgtz);

int trans=255;
if (trans>=255)
{
for(trans=255;trans>0;trans--)
{
//tint(r,s,t,trans);


}
if (stop == false)
{
  
  if(x<=1 || xx>=300)
{
stop = true;

}
else 
{

image(me,x,y,wdt,hgt);
  image(me,xx,yy,wdtz,hgtz);

  x--;
y--;
wdt+=2;
hgt+=2;
xx++;
yy++;
wdtz-=2;
hgtz-=2;
}
}
else 
{

 if (x<=300|| xx>=1)
 {
   
image(me,x,y,wdt,hgt);
  image(me,xx,yy,wdtz,hgtz);

x++;
y++;
wdt-=2;
hgt-=2;
xx--;
yy--;
wdtz+=2;
hgtz+=2;
 }
else 
{
  stop = false;
}
 } 
}
  
}


  float wdth= width;
    float hgth= 10;
    float zx=10;
    float zy=10;
    float px=10;
    float py=10;
    
    strokeWeight(5);
    stroke(0);
    
   // line(200,200,wdth,hgth);

    while (zx<=wdth)
   {
    
     zx+= 5;
     if (zx > wdth - 5)
     {
       zy = hgth;
     }
     else
     {
     zy+= random(-5, 4);
     }
    line(px,py,zx,zy);
      px=zx;
      py=zy;
   } 
     strokeWeight(1);

for (int vw = 0; vw< width;vw+=100)
  {
    stroke(0);  
    line(vw,0,vw,height);
  }
  for (int my = 0; my< height;my+=100)
  {
    
    line(0,my,width,my);
  }

  }

 




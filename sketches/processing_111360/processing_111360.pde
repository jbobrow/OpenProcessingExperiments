
PImage me;
boolean filterA = false;
int x=260;
int y=280;
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
    if (me.width > 0)
    {
       if (filterA == false)
    {
      me.filter(INVERT);
      filterA=true;
    }   
       stroke(255,0,0);  
      image(me,0,0,width,height);

image(me,x,y,wdt,hgt);
int trans=255;
if (trans>=255)
{
for(trans=255;trans>0;trans--)
{
 tint(255,trans);


}
if (stop == false)
{
  if(x>0)
{
x--;
y--;
wdt+=2;
hgt+=2;
}
}
}
    }

/*image(me,xx,yy,wdtz,hgtz);
xx++;

yy++;

wdtz--;
hgtz--;
}
else if (x<=0)
{
  stop = true;
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
*/

for (int vw = 0; vw< width;vw+=100)
  {
    stroke(0);  
    line(vw,0,vw,height);
  }
  for (int my = 0; my< height;my+=100)
  {
    
    line(0,my,width,my);
  }
      image(me,0,0,width,height);

  

}



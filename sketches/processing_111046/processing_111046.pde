
PImage angel;
PImage scp;
PImage rake;
boolean filterA = false;
void setup()
{
  size(900,600);
  angel = requestImage("angel.jpg");
  scp = requestImage("scp173.jpg");
  rake = requestImage("scprake.jpg");


}

void draw()
{
 
  if (angel.width > 0)
  {
    
    if (filterA == false)
    {
      angel.filter(INVERT);
      filterA=true;
    }
    image(angel,0,0,width,height);
    int x=1;
    int y=1;
    for (x = 0; x< width;x+=20)
  {
    stroke(255,0,0);  
    line(x,0,x,height);
  }
   for (y = 0; y< height;y+=20)
  {
    stroke(255,0,0);  
    line(0,y,width,y);
  }
    if (rake.width > 0)
    {
       image(rake,0,0,200,200);
    }
    
    if (scp.width > 0)
    {
      image(scp,width-200,height-200,200,200);
    }
    float wdth= width-200;
    float hgth= height-200;
    float zx=200;
    float zy=200;
    float px=200;
    float py=200;
    
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
     zy+= random(-5, 10);
     }
    line(px,py,zx,zy);
      px=zx;
      py=zy;
   } 
     strokeWeight(1);



  }
}



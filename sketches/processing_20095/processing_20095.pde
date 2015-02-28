
void setup()
{
size(250,250);
background(0);
stroke(255,30);
strokeWeight(8);
noLoop(); // void draw only once
}
float x1,y1,x2,y2,rad1,rad2,srad;
int increment,sx,sy;
void draw()
{ 
  for(int deg1=0;deg1<360;deg1+=10)
  {
  srad=radians(deg1);
  sx=int(sin(srad)*70+width/2);
  sy=int(cos(srad)*70+height/2);
  ngon(80,50,50,sx,sy);
  }
}
void ngon(int sides,int xradius,int yradius,int xcent, int ycent)//polygon function
 {
  increment=int(360/sides);
  for(int deg=0;deg<360; deg=deg+increment)
{
  rad1=radians(deg);
  rad2=radians(deg+increment);
  x1=sin(rad1)*xradius+xcent;
  y1=cos(rad1)*yradius+ycent;
  x2=sin(rad2)*xradius+xcent;
  y2=cos(rad2)*yradius+ycent;
  line(x1,y1,x2,y2);
}
}


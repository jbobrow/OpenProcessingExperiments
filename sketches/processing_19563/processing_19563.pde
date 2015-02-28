
void setup()
{
size(250,250);

 background(#ffff46);//backgrong circles 
 for(int m=0;m<400;m+=10){
  stroke(255);
  strokeWeight(0.3);
  fill(#ff661c,20);
  ellipse(width/2,height/2,300-m,300-m);
  }
stroke(0,30);
strokeWeight(7);
noLoop();
}
float x1,y1,x2,y2,rad1,rad2,srad;
int num,increment,sx,sy;
void draw()
{ 
  for(int deg1=0;deg1<360;deg1=deg1+10)
  {
  srad=radians(deg1);
  sx=int(sin(srad)*70+width/2);
  sy=int(cos(srad)*70+height/2);
  ngon(300,100,100,sx,sy);
  }
}
void ngon(int sides,int xradius,int yradius,int xcent, int ycent)
 {
  num=sides;
  increment=int(360/num);
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


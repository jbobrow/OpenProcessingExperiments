
PImage img;
float[] xvals = new float[256];
float[] yvals = new float[256];
void setup()
{
  size(128,128,JAVA2D);
  img = loadImage("wheel.tga");
}
int x,y,off;
float ang;
void draw()
{
  ang += rad(mouseX*.5);
  off = 128;
  background(0);
  for(x=0;x<256;x++)
  {
    for(y=0;y<256;y++)
   {
     xvals[x]=cos(ang+ang(off,off,x,y))*dist(x,y,off,off)+128;
     yvals[y]=sin(ang+ang(off,off,x,y))*dist(x,y,off,off)+128;
     if(alpha(img.get(x,y))>0)
     {
       set((int)xvals[x]/2,(int)yvals[y]/2,color(img.get(x,y)));
     }
   }
  }
}
PVector vec = new PVector(0,0);
float ang(float x, float y, float x2, float y2)
{
  vec.x = x - x2;
  vec.y = y - y2;
  return(-atan2(-vec.x,-vec.y));
}
float rad(float d)
{
  return(d*PI/180); 
}



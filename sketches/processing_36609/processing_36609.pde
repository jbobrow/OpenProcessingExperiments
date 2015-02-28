
/* Video Filter Coding from Kye Ehrlich
This is Love
Elizabeth Tolson*/




import processing.video.*;
Capture cam;
PImage hearts;
 
void setup()
{
  size(640,480);
  cam= new Capture(this, width, height);
  smooth();
  hearts= loadImage("compprocesshearts.png");
}
 
void draw()
{

   if (cam.available())
  {
    cam.read();
  }
  if(key=='f')
  {
    for (int i = 0; i < width; i = i+1)
    {
      for (int j = 0; j < height; j=j+1)
      {
        color px = cam.get(i,j);
        float r= red(px);
        float g= green(px);
        float b= blue(px);
        float s= r+g+b;
 
        if(-1<s && s<182)
        {
          r=86;
          g=49;
          b=79;
        }
        if(181<s && s<364)
        {
          r=208;
          g=248;
          b=22;
        }
        if(363<s && s<546)
        {
          r=244;
          g=36;
          b=207;
        }
        if(545<s && s<766)
        {
          r=43;
          g=227;
          b=64;
        }
        colorMode(RGB);
        color c= color (r,g,b);
        set(i,j,c);  
      }
    }
  }


else
  {
    for (int i = 0; i < width; i = i+1)
    {
      for (int j = 0; j < height; j=j+1)
      {
        color px = cam.get(i,j);
        float r= red(px);
        float g= green(px);
        float b= blue(px);
        color c= color (r,g,b);
        set(i,j,c);
      }
    }
  }
  image(hearts,0,0);
}



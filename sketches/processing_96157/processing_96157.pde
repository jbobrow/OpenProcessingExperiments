
import processing.video.*;
Capture video;
 
void setup()
{
  size(640,480);
  video = new Capture(this, width, height);
  video.start();
  smooth();
}
void draw()
{
  if (video.available())
  {
    video.read();
  }
  if(mousePressed == true)
  {
    for (int y = 0; y < height; y=y+1)
    {
      for (int X = 0; X < width; X= X+1)
      {
        color px = video.get(X,y);
        float r= red(px);
        float g= green(px);
        float b= blue(px);
        color c= color (r,g,b);
        set(X,height-y,c);
      }
    }
  }
  else if (key=='y')
  {
    for (int i = 0; i < width; i = i+1)
    {
      for (int j = 0; j < height; j=j+1)
      {
        color px = video.get(i,j);
        float r= red(px);
        float g= green(px);
        float b= blue(px);
        float T=0;
        float C= (r+b+g) % 255;
        if (C<40)
        {
          T= 0;
        }
        if (C>39)
        {
          T= 255;
        }
        colorMode(HSB);
        color c= color (C,C,C,T);
        set(i,j,c);
        colorMode(RGB);
      }
    }
  }
  else
  {
    for (int i = 0; i < width; i = i+1)
    {
      for (int j = 0; j < height; j=j+1)
      {
        color px = video.get(i,j);
        float r= red(px);
        float g= green(px);
        float b= blue(px);
        color c= color (r,g,b);
        set(i,j,c);
      }
    }
  }
}



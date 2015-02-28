
import processing.video.*;
MovieMaker myMovie;
Capture cam;
int srcX, dstX;
void setup()
{
  size(640, 480);
  cam= new Capture(this, width, height);
  myMovie = new MovieMaker(this, width, height, "capture.mov", 25, MovieMaker.H263, 
  MovieMaker.BEST);
  smooth();
  srcX = cam.width / 2;
  dstX = width - 1;
}

void draw()
{
  myMovie.addFrame();

  if (cam.available())
  {
    cam.read();
  }
  if (key=='v')
  {
    for (int y = 0; y < height; y=y+1)
    {
      for (int X = 0; X < width; X= X+1)
      {
        color px = cam.get(X, y);
        float r= red(px);
        float g= green(px);
        float b= blue(px);
        color c= color (r, g, b);
        set(X, height-y, c);
      }
    }
  }
  else if (key=='l') {
    copy(cam, srcX, 0, 1, cam.height, dstX, 0, 1, height);
    if (--dstX < 0) dstX = width - 1;
  }

  else if (key=='s')
  {
    for (int i = 0; i < width; i = i+1)
    {
      for (int j = 0; j < height; j=j+1)
      {
        int sepiaAmount=20;
        color px = cam.get(i, j);
        float r= red(px)+(2*sepiaAmount);
        float g= green(px)+sepiaAmount;
        float b= blue(px)-sepiaAmount;
        color c= color (r, g, b);
        set(i, j, c);
      }
    }
  }

  else if (key=='r')
  {

    for (int i = 0; i < width; i = i+1)
    {
      for (int j = 0; j < height; j=j+1)
      {
        color px = cam.get(i, j);
        float r= red(px);
        float g= green(px);
        float b= blue(px);
        float s= r+g+b;

        if (-1<s && s<182)
        {
          r=0;
          g=51;
          b=76;
        }
        if (181<s && s<364)
        {
          r=217;
          g=26;
          b=33;
        }
        if (363<s && s<546)
        {
          r=112;
          g=150;
          b=158;
        }
        if (545<s && s<766)
        {
          r=252;
          g=227;
          b=166;
        } 
        colorMode(RGB);
        color c= color (r, g, b);
        set(i, j, c);
      }
    }
  } 

  else if (key=='b')
  {

    for (int i = 0; i < width; i = i+1)
    {
      for (int j = 0; j < height; j=j+1)
      {
        color px = cam.get(i, j);
        float r= red(px);
        float g= green(px);
        float b= blue(px);
        float s= r+g+b;

        if (-1<s && s<266)
        {
          r=0;
          g=0;
          b=0;
        }
        else {
          r=255;
          g=255;
          b=255;
        }
        colorMode(RGB);
        color c= color (r, g, b);
        set(i, j, c);
      }
    }
  } 

  else
  {
    for (int i = 0; i < width; i = i+1)
    {
      for (int j = 0; j < height; j=j+1)
      {
        color px = cam.get(i, j);
        float r= red(px);
        float g= green(px);
        float b= blue(px);
        color c= color (r, g, b);
        set(i, j, c);
      }
    }
  }
}
void keyPressed() {
  if (key == ' ') {   // If we press spacebar...
    myMovie.finish(); // Stop recording
  }
}
void stop() {
  myMovie.finish();
  super.stop();
}




import processing.video.*;

int width = 1280;
int height = 960;
//This string holds all of the potential Cameras that can be read **Includes various sizes/frame rates**
String[] Camaras;
//Cam holds the Camara you're using, and also functions as an image to play with pixels, etc.
Capture Cam;

//This keeps track of
int ContrastCap = 170;
int ContrastInv;
PImage CurrentFrame = createImage(width, height, RGB);

boolean Picture = false;
String Temp;

PFont MyFont;

boolean Color = true;
int AccumDifference;

//This keeps track of the current image index
int j = 0;

void setup()
{
  size(width, height);
  MyFont = loadFont("Arial-Black-20.vlw");
  textFont(MyFont);
  Camaras = Capture.list();
  println(Camaras.length);

  //The loop below prints out all of the camara options available to the computer
  /*int i = 0;
   while(i < Camaras.length)
   {
   println(Camaras[i]);
   i++;
   }*/
  //the 75 may need to be changed depending on your camera's settings.
  Cam = new Capture(this, Camaras[75]);
  Cam.start();
}

void draw()
{
  if (Cam.available() == true)
  {
    Cam.read();
    //Cam.loadPixels();
    //image(Cam, 0, 0);
    if(Color == true)
    {
      BuildColorImage();
    }
    else
    {
      BuildGreyScaleImage();
    }
    image(CurrentFrame, 0, 0);
    if(Picture == true)
    {
      Temp = "MyPic_" +j+ ".tif";
      save(Temp);
      println("Your picture is '" +Temp+ "'.");
      j++;
      Picture = false;
    }
    
    fill(255, 0, 0);
    ContrastInv = 255 - ContrastCap;
    text("Current Contrast: " +ContrastInv+ "  (Default = 85)", width-500, 100);
    text("Press 'a' to add to the Contrast", width-500, 130);
    text("Press 's' to subtract from the Contrast", width-500, 160);
    text("Press 'p' to take Picture number: " +j, width-500, 190);
    text("Press 't' to toggle modes", width - 500, 220);
    fill(255, 255, 255);
  }

  //println(Cam.pixels.length);
  //BuildImage();
  //image(CurrentFrame, 0, 0);
}

void BuildColorImage()
{
  Cam.loadPixels();
  CurrentFrame.loadPixels();
  int h = 1;
  int w = 1;
  int r, g, b;
  while (h < (height - 1))
  {
    w = 1;
    while (w < (width - 1))
    {
      r = int(red((Cam.pixels[(h+1)*width + w]))) - 
        int(red(Cam.pixels[(h-1)*width + w]));
      g = int(green((Cam.pixels[(h+1)*width + w]))) - 
        int(green(Cam.pixels[(h-1)*width + w]));
      b = int(blue((Cam.pixels[(h+1)*width + w]))) - 
        int(blue(Cam.pixels[(h-1)*width + w]));

      /*if (r < 0)
       r = 255 + r;
       if (g < 0)
       g = 255 + g;
       if (b < 0)
       b = 255 + b;*/

      /*if(r < 0)
       r = -r;
       if(g < 0)
       g = -g;
       if(b < 0)
       b = -b;*/


      if (r < ContrastCap)
      {
        r = int(map(r, 0, ContrastCap, 0, 255));
      }
      else
      {
        r = 255;
      }

      if (g < ContrastCap)
      {
        g = int(map(g, 0, ContrastCap, 0, 255));
      }
      else
      {
        g = 255;
      }

      if (b < ContrastCap)
      {
        b = int(map(b, 0, ContrastCap, 0, 255));
      }
      else
      {
        b = 255;
      }

      CurrentFrame.pixels[h*width + w] = color(r, g, b);
      w++;
    }
    h++;
  }
  println(ContrastCap);
  Cam.updatePixels();
  CurrentFrame.updatePixels();
}

//---------------------------------------------------------------------
void BuildGreyScaleImage()
{
  Cam.loadPixels();
  CurrentFrame.loadPixels();
  int h = 1;
  int w = 1;
  int r, g, b;
  while (h < (height - 1))
  {
    w = 1;
    while (w < (width - 1))
    {
      AccumDifference = 0;
      
      AccumDifference = AccumDifference + int(abs(red(Cam.pixels[h*width + w]) - red(Cam.pixels[(h-1)*width + (w-1)])));
      AccumDifference = AccumDifference + int(abs(green(Cam.pixels[h*width + w]) - green(Cam.pixels[(h-1)*width + (w-1)])));
      AccumDifference = AccumDifference + int(abs(blue(Cam.pixels[h*width + w]) - blue(Cam.pixels[(h-1)*width + (w-1)])));
      
      AccumDifference = AccumDifference + int(abs(red(Cam.pixels[h*width + w]) - red(Cam.pixels[(h-1)*width + w])));
      AccumDifference = AccumDifference + int(abs(green(Cam.pixels[h*width + w]) - green(Cam.pixels[(h-1)*width + w])));
      AccumDifference = AccumDifference + int(abs(blue(Cam.pixels[h*width + w]) - blue(Cam.pixels[(h-1)*width + w])));
      
      AccumDifference = AccumDifference + int(abs(red(Cam.pixels[h*width + w]) - red(Cam.pixels[(h-1)*width + (w+1)])));
      AccumDifference = AccumDifference + int(abs(green(Cam.pixels[h*width + w]) - green(Cam.pixels[(h-1)*width + (w+1)])));
      AccumDifference = AccumDifference + int(abs(blue(Cam.pixels[h*width + w]) - blue(Cam.pixels[(h-1)*width + (w+1)])));
      
      AccumDifference = AccumDifference + int(abs(red(Cam.pixels[h*width + w]) - red(Cam.pixels[h*width + (w-1)])));
      AccumDifference = AccumDifference + int(abs(green(Cam.pixels[h*width + w]) - green(Cam.pixels[h*width + (w-1)])));
      AccumDifference = AccumDifference + int(abs(blue(Cam.pixels[h*width + w]) - blue(Cam.pixels[h*width + (w-1)])));
      
      AccumDifference = AccumDifference + int(abs(red(Cam.pixels[h*width + w]) - red(Cam.pixels[(h-1)*width + (w+1)])));
      AccumDifference = AccumDifference + int(abs(green(Cam.pixels[h*width + w]) - green(Cam.pixels[(h-1)*width + (w+1)])));
      AccumDifference = AccumDifference + int(abs(blue(Cam.pixels[h*width + w]) - blue(Cam.pixels[(h-1)*width + (w+1)])));
      
      AccumDifference = AccumDifference + int(abs(red(Cam.pixels[h*width + w]) - red(Cam.pixels[(h+1)*width + (w-1)])));
      AccumDifference = AccumDifference + int(abs(green(Cam.pixels[h*width + w]) - green(Cam.pixels[(h+1)*width + (w-1)])));
      AccumDifference = AccumDifference + int(abs(blue(Cam.pixels[h*width + w]) - blue(Cam.pixels[(h+1)*width + (w-1)])));
      
      AccumDifference = AccumDifference + int(abs(red(Cam.pixels[h*width + w]) - red(Cam.pixels[(h+1)*width + w])));
      AccumDifference = AccumDifference + int(abs(green(Cam.pixels[h*width + w]) - green(Cam.pixels[(h+1)*width + w])));
      AccumDifference = AccumDifference + int(abs(blue(Cam.pixels[h*width + w]) - blue(Cam.pixels[(h+1)*width + w])));
      
      AccumDifference = AccumDifference + int(abs(red(Cam.pixels[h*width + w]) - red(Cam.pixels[(h+1)*width + (w+1)])));
      AccumDifference = AccumDifference + int(abs(green(Cam.pixels[h*width + w]) - green(Cam.pixels[(h+1)*width + (w+1)])));
      AccumDifference = AccumDifference + int(abs(blue(Cam.pixels[h*width + w]) - blue(Cam.pixels[(h+1)*width + (w+1)])));
      
      AccumDifference = int(AccumDifference);
      
      if(AccumDifference > ContrastCap)
      {
        CurrentFrame.pixels[h*width + w] = color(0, 0, 0);
      }
      else
      {
        CurrentFrame.pixels[h*width + w] = color(255, 255, 255);
      }
   
      w++;
    }
    h++;
  }
  CurrentFrame.updatePixels();
  Cam.updatePixels();
}

//-------------------------------------------------------------------------
void keyPressed()
{
  if (key == 'a')
  {
    if (ContrastCap > 50)
    {
      ContrastCap = ContrastCap - 5;
    }
  }
  if (key == 's')
  {
    if (ContrastCap < 255)
    {
      ContrastCap = ContrastCap + 5;
    }
  }
  if(key == 'p')
  {
    Picture = true;
  }
  if(key == 't')
  {
    Color = !Color;
    if(!Color)
    {
      ContrastCap = 170;
    }
    if(Color)
    {
      
    }
  }
}




















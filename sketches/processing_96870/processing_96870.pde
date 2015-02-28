
String imageLocation = "http://3.bp.blogspot.com/-2v9t2Fg9he8/TlnSsXHIq4I/AAAAAAAACyA/75TvnE05rn8/s1600/Lily+flower+wallpaper3.jpg";
PImage img = loadImage(imageLocation);
int effect = 0;
int sizeX = 800;
int sizeY = 600;

void setup()
{
size(sizeX, sizeY);
image(img,0,0,width,height);
}

void draw()
{
}

void mousePressed()
{
  setEffects();
}

void keyPressed()
{
  if (keyCode == 'X')
  {
    effect = 0;
    setEffects();
  }
  else if (keyCode == 'R') 
  {
    effect = 1;
    setEffects();
  }
  else if (keyCode == 'G')
  {
    effect = 2;
    setEffects();
  }
  else if (keyCode == 'B')
  {
    effect = 3;
    setEffects();
  }
  else if (keyCode == 'C')
  {
    effect = 4;
    setEffects();
  }
  
  
}

void setEffects()
{
  if (effect == 0)
  {
    for(int x=0; x<width; x++)
    {
     for(int y=0; y<height; y++)
     {
         color c = get(x,y);
         float red = red(c);
         float green = green(c);
         float blue = blue(c);
         int grey = (int)(red+green+blue)/3;
         color Color =color(grey,grey,grey);
         set(x,y,Color);
     }
    }
    effect = 1;
  }
  else if(effect == 1)
  {
    tint(240,20,20);
    image(img,0,0,width,height);
    effect = 2;
  }
  else if (effect == 2)
  {
    tint(0,255,10);
    image(img,0,0,width,height);
    effect = 3;
  }
  else if (effect == 3)
  {
    tint(20,100,255);
    image(img,0,0,width,height);
    effect = 4;
  }
  else if (effect == 4)
  {
   tint(255,255,255);
   image(img,0,0,width,height);
   effect = 0;
  }
}







PImage [] myimages = new PImage [10];

int backgroundIndex = 0;
float timer = 0;

void setup()
{
  size (500, 500);
  frameRate(30);
  myimages[0] = requestImage("bleach1.png");
  
  for (int I = 1 ; I < myimages.length ; I = I + 1)
  {
    myimages[I] = requestImage("bleach" + (I + 1) + ".png");
  }
}

void draw()
{
  background (#000000);
  timer = timer + 1.0 / 30.0;
  
  if (timer > 1)
  {
    backgroundIndex = backgroundIndex + 1;
    timer = 0;
  }
   
  if (backgroundIndex >= myimages.length || backgroundIndex < 0)
  {
    backgroundIndex = 0;
  }
   
  if (myimages[backgroundIndex].width > 0)
  {
    drawLoadedImage(myimages[backgroundIndex], 0, 0, width, height);
  }


}
 
void drawLoadedImage(PImage aimage, float ax, float ay, float aw, float ah)
{
  if (aimage.width > 0)
  {
    image(aimage, ax, ay, aw, ah);
  }
}
  
  void keyReleased ()
  {
    if (key == '1')
    {
      backgroundIndex = (int)random(0,9);
    }
    if (keyCode == LEFT)
    {
      backgroundIndex = backgroundIndex - 1;
    }
    if (keyCode == RIGHT)
    {
      backgroundIndex = backgroundIndex +1;
    }
  }
    
  





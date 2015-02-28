
float timer;
PImage[] myimages = new PImage [10];
int backgroundIndex = 0;
float cycletime = 2;

void setup()
{
  size(500, 500);
  frameRate(30);
  
  myimages[0] = requestImage("");
  myimages[1] = requestImage("Spongebob_SquarePants.jpg");
  myimages[2] = requestImage("silver-apple-logo-apple-picture.jpg");
  myimages[3] = requestImage("Patrick_Star.png");
  myimages[4] = requestImage("smile__squidward__by_animalsss-d5adnhm.png");
  myimages[5] = requestImage("MrKrabs.png");
  myimages[6] = requestImage("316508_orig.png");
  myimages[7] = requestImage("Iu.jpg");
  myimages[8] = requestImage("larrythelobsterpic.jpg");
  myimages[9] = requestImage("290px-Sandy_Cheeks.jpg");
}
void draw()
{
  background(255);
  timer = timer + 1.0 / 30.0;
   
  if (timer > cycletime)
  {
    backgroundIndex = backgroundIndex + 1;
    timer = 0;
  }
   
  if (backgroundIndex >= myimages.length)
  {
    backgroundIndex = 0;
  }
  if (backgroundIndex < 0)
  {
    backgroundIndex = myimages.length - 1;
  }
  
  drawLoadedImage(myimages[backgroundIndex], 0, 0, width, height);
}
 
void drawLoadedImage(PImage aimage, float ax, float ay, float aw, float ah)
{
  if (aimage.width > 0)
  {
    image(aimage, ax, ay, aw, ah);
  }
}
 
void keyReleased()
{
  if (key == ' ')
  {
    backgroundIndex = backgroundIndex + 1;
  }
  if (keyCode == LEFT)
  {
    backgroundIndex = backgroundIndex - 1;
  }
  if (keyCode == UP)
  {
    if (cycletime > 0.1)
    {
      cycletime = cycletime - 0.1;
    }
  }
  if (keyCode == DOWN)
  {
    cycletime = cycletime + 0.1;
  }
}




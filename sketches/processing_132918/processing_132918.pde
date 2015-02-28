
String image0 = "image1";
String image1 = "image2";
String image2 = "image3";
String image3 = "image4";
String image4 = "image5";
String image5 = "image6";
String image6 = "image7";
String image7 = "image8";
String image8 = "image9";
String image9 = "image10";
String image10 = "image11";
String image11 = "image12";
 
 
String[] images = {"image1", "image2", "image3", "image4", "image5", "image6", "image7", "image8", "image9", "image10", "image11", "image12"};
PImage[] myimages = new PImage[12];
 
int backgroundIndex = 0;
int timerplay = 1;
float timer = 1;
 
 
class SpriteObject
{
  PImage m_image;
  float m_rotation;
  float m_x;
  float m_y;
  float m_w;
  float m_h;
}
SpriteObject mysprite = new SpriteObject();
 
void setup()
{
  size(630,350);
  frameRate(30);
  myimages[0] = requestImage("image1.png");
  myimages[1] = requestImage("image2.png");
  myimages[2] = requestImage("image3.png");
  myimages[3] = requestImage("image4.png");
  myimages[4] = requestImage("image5.png");
  myimages[5] = requestImage("image6.png");
  myimages[6] = requestImage("image7.png");
  myimages[7] = requestImage("image8.png");
  myimages[8] = requestImage("image9.png");
  myimages[9] = requestImage("image10.png");
  myimages[10] = requestImage("image11.png");
  myimages[11] = requestImage("image12.png");
}
 
void draw()
{
  background(255);
  if (timerplay == 1)
  {
  timer = timer + .1 / 30.0;
  }
    if (timer > .01)
    {
    backgroundIndex = backgroundIndex + 1;
    timer = 0;
    }
      if (backgroundIndex >= myimages.length||backgroundIndex < 0)
      {
      backgroundIndex = 0;
      }
        if (myimages[backgroundIndex].width > 0)
        {
        drawLoadedImage(myimages[backgroundIndex], 0, 0, width, height);
        }
}
 
void drawLoadedImage (PImage aimage,float ax, float ay,float aw, float ah)
{
  if (aimage.width > 0)
  {
  image(aimage, ax, ay, aw, ah);
  }
}
void keyPressed()
{
  if (keyCode == UP)
  {  
  backgroundIndex = backgroundIndex + int(random(5));
  }
    if (keyCode == DOWN)    
    {
    timer++;
    }
}
void keyReleased()
{
  if (keyCode == LEFT)
  {
  backgroundIndex = backgroundIndex - 1;
  timerplay = 0;
  timer = 0;
  }
    if (keyCode == RIGHT)
    {
    timerplay = 1;
    backgroundIndex = backgroundIndex + 1;
    timer = 0;
    }
}





String image0 = "picture1";
String image1 = "picture2";
String image2 = "picture3";
String image3 = "picture4";
String image4 = "picture5";
String image5 = "picture6";
String image6 = "picture7";
String image7 = "picture8";
String image8 = "picture9";
String image9 = "picture10";
String image10 = "picture11";
String image11 = "picture12";
 
 
String[] images = {"picture1", "picture2", "picture3", "picture4", "picture5", "picture6", "picture7", "picture8", "picture9", "picture10", "picture11", "picture12"};
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
  size(200,300);
  frameRate(30);
  myimages[0] = requestImage("picture1.jpg");
  myimages[1] = requestImage("picture2.jpg");
  myimages[2] = requestImage("picture3.jpg");
  myimages[3] = requestImage("picture4.jpg");
  myimages[4] = requestImage("picture5.jpg");
  myimages[5] = requestImage("picture6.jpg");
  myimages[6] = requestImage("picture7.jpg");
  myimages[7] = requestImage("picture8.jpg");
  myimages[8] = requestImage("picture9.jpg");
  myimages[9] = requestImage("picture10.jpg");
  myimages[10] = requestImage("picture11.jpg");
  myimages[11] = requestImage("picture12.jpg");
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





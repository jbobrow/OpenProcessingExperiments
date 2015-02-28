
String image0 = "image 0";
String image1 = "image 1";
String image2 = "image 2";
String image3 = "image 3";
String image4 = "image 4";
String image5 = "image 5";
String image6 = "image 6";
String image7 = "image 7";
String image8 = "image 8";
String image9 = "image 9";
String image10 = "image 10";
String image11 = "image 11";


String[] images = {"image 0", "image 1", "image 2", "image 3", "image 4", "image 5", "image 6", "image 7", "image 8", "image 9", "image 10", "image 11"};
PImage[] myimages = new PImage[12];

int backgroundIndex = 0;
float timer = 0;
int timerplay = 1;


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
  size(641,340);
  frameRate(30);
  myimages[0] = requestImage("image1.jpg");
  myimages[1] = requestImage("image2.jpg");
  myimages[2] = requestImage("image3.jpg");
  myimages[3] = requestImage("image4.jpg");
  myimages[4] = requestImage("image5.jpg");
  myimages[5] = requestImage("image6.jpg");
  myimages[6] = requestImage("image7.jpg");
  myimages[7] = requestImage("image8.jpg");
  myimages[8] = requestImage("image9.jpg");
  myimages[9] = requestImage("image10.jpg");
  myimages[10] = requestImage("image11.jpg");
  myimages[11] = requestImage("image12.jpg");
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
  if (backgroundIndex >= myimages.length || backgroundIndex < 0)
  {
    backgroundIndex = 0;
  }
  if (myimages[backgroundIndex].width > 0)
  {
    drawLoadedImage(myimages[backgroundIndex], 0, 0, width, height);
  }
  /*for (int i = 0; i < myimages.length; i = i + 1)
  {
    drawLoadedImage(myimages[1], i * 100, 0, 100, 100);
  }
  //mysprite.draw(); */
}

void drawLoadedImage(PImage aimage, float ax, float ay, float aw, float ah)
{
  if (aimage.width > 0)
  {
    image(aimage, ax, ay, aw, ah);
  }
}
void keyPressed()
{
  if (key == '1')
  {
    backgroundIndex = backgroundIndex + 100;
  }
  if (key == '2')
  {
    backgroundIndex = backgroundIndex + int(random(10));
  }
}
void keyReleased()
{
  if (keyCode == LEFT)
  {
    timerplay = 0;
    backgroundIndex = backgroundIndex - 1;
    timer = 0;
  }
  if (keyCode == RIGHT)
  {
    timerplay = 1;
    backgroundIndex = backgroundIndex + 1;
    timer = 0;
  }
}



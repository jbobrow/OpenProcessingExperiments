
float[][] grid = new float[3][4];
 
PImage[] myimages = new PImage[10];
 
int backgroundIndex = 0;
float timer = 0;
 
class SpriteObject
{
  PImage m_image;
  float  m_rotation;
  float m_x;
  float m_y;
  float m_w;
  float m_h;  
}
 
SpriteObject mysprite = new SpriteObject();
 
void setup()
{
  size(500, 500);
  frameRate(30);
      
  myimages[0] = requestImage("snowscape.jpg");
  myimages[1] = requestImage( "800px-Smiley.png");
  myimages[2] = requestImage( "FrostAce.jpg");
  myimages[3] = requestImage( "Chrysanthemum.jpg");
  myimages[4] = requestImage( "JackFrostP4.PNG");
  myimages[5] = requestImage( "Leanan_Sidhe.jpg");
  myimages[6] = requestImage( "Orpheus_fullsize.jpg");
  myimages[7] = requestImage( "Raiho.png");
  myimages[8] = requestImage( "SMTIV_Cover_Large.png");
  myimages[9] = requestImage( "original.jpg");
  
  grid[0][2] = 3.0;

}
 
void draw()
{
  background(255);
  timer = timer + 0.5 / 30.0;
   
  if (timer > 3)
  {
    backgroundIndex = backgroundIndex + 1;
    timer = 0;
  }
   
  if (backgroundIndex < 0 || backgroundIndex >= myimages.length)
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
 
void keyReleased()
{
  if (keyCode == UP)
  {
    backgroundIndex = backgroundIndex + 1;
  }
  if (keyCode == DOWN)
  {
    backgroundIndex = backgroundIndex - 1;
  }
  if (keyCode == LEFT)
  {
    timer = timer + 0.1 / 30.0;
  }
  if (keyCode == RIGHT)
  {
    timer = timer + 1.0 / 30.0;
  }
  if (key == 'a')
  {
    backgroundIndex = (int)random(0, 9);
  }
}






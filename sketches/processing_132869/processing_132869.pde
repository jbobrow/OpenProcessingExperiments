
float[][] grid = new float[3][4];
  
PImage[] myimages = new PImage[18];
PImage[] mybackgrounds = new PImage[3];
PImage sparkle;
PImage sparkling;
  
int backgroundIndex = 0;
int stageIndex = 0;
float timer = 0;
float backgroundtimer = 0;
  
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
  
  sparkle = requestImage("Sparkle.png");
  sparkling = requestImage("sparkles.png");
  
  mybackgrounds[0] = requestImage("nice-backgrounds.jpg");
  mybackgrounds[1] = requestImage("wooden-stage-2560x1600.jpg");
  mybackgrounds[2] = requestImage("rongbo-bg-2l1ecet.jpg");
       
  myimages[0] = requestImage("body01.png");
  myimages[1] = requestImage("body02a.png");
  myimages[2] = requestImage("body03.png");
  myimages[3] = requestImage("body04.png");
  myimages[4] = requestImage("body04A (1).png");
  myimages[5] = requestImage("body04A (2).png");
  myimages[6] = requestImage("body04A (3).png");
  myimages[7] = requestImage("body04A (4).png");
  myimages[8] = requestImage("body04A (5).png");
  myimages[9] = requestImage("body04A (6).png");
  myimages[10] = requestImage("body04A (7).png");
  myimages[11] = requestImage("body04A (8).png");
  myimages[12] = requestImage("body04A (9).png");
  myimages[13] = requestImage("body04A (10).png");
  myimages[14] = requestImage("body04A (11).png");
  myimages[15] = requestImage("body04A (12).png");
  myimages[16] = requestImage("body05.png");
  myimages[17] = requestImage("body06.png");
   
  grid[0][2] = 3.0;
 
}
  
void draw()
{
  timer = timer + 3.0 / 5.0;
  backgroundtimer = backgroundtimer + 1.0 / 30.0;
    
  if (timer > 3)
  {
    backgroundIndex = backgroundIndex + 1;
    timer = 0;
  }
  
  if (backgroundtimer > 3)
  {
    stageIndex = stageIndex + 1;
    backgroundtimer = 0;
  }
    
  if (backgroundIndex < 0 || backgroundIndex >= myimages.length)
  {
    backgroundIndex = 0;
  }
  if (stageIndex < 0 || stageIndex >= mybackgrounds.length)
  {
    stageIndex = 0;
  }
    
  if (mybackgrounds[stageIndex].width > 0)
  {
    drawLoadedImage(mybackgrounds[stageIndex], 0, 0, width, height);
  }  
  if (myimages[backgroundIndex].width > 0)
  {
    drawLoadedImage(myimages[backgroundIndex], 100, 200, 300, 300);
  }
  for (int x = 0; x < width; x += 40)
  {
    image(sparkle, x, 0, 40, 40);
    image(sparkle, x, 466, 40, 40);
  }
  for (int x = 0; x < width; x += 100)
  {
    image(sparkling, x, 0, 100, 100);
  }
  for (int y = 35; y < height; y += 40)
  {
    image(sparkle, 0, y, 40, 40);
    image(sparkle, 466, y, 40, 40);
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



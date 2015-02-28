
PImage[] myImages = new PImage[10];
float timer = 0;
float timeX = 2;
int picCount = 0;

void setup()
{
  size(501,501);
  background(#FFFFFF);
  frameRate(30);
  
  myImages[0] = requestImage("Basketball.png");
  myImages[1] = requestImage("Cube.png");
  myImages[2] = requestImage("Mario.png");
  myImages[3] = requestImage("Mushroom.PNG");
  myImages[4] = requestImage("Smiley.png");
  myImages[5] = requestImage("Spongebob.png");
  myImages[6] = requestImage("Star1.png");
  myImages[7] = requestImage("Super_sonic.gif");
  myImages[8] = requestImage("World.png");
  myImages[9] = requestImage("YinYang.png");
}

void draw()
{
  timer = timer + (1.0 / 30.0);
  
  if (timer > timeX)
  {
    picCount = picCount + 1;
    timer = 0;
  }
  if (picCount >= myImages.length)
  {
    background(#FFFFFF);
    picCount = 0;
  }
  
  if (myImages[picCount].width > 0)
  {
    drawLoadedImages(myImages[picCount], 0,0, width,height);
  }
  
  /*for (int i = 0; i < myImages.length; i++)
  {
    drawLoadedImages(myImages[i], i * 100, 0, 100, 100); //drawing pictures all across the top of the window
  }*/
  
  if (picCount < 0 || picCount >= myImages.length)
  {
    picCount = 0;
  }
}

void keyReleased()
{
  if (key == '1')
  {timeX = 1;}
  if (key == '2')
  {timeX = 2;}
  if (key == '3')
  {timeX = 3;}
  
  if (key == 'r')
  {
    background(#FFFFFF);
    timer = 0;
    picCount = picCount + int(random(0,9));
  }
  
  if (keyCode == LEFT)
  {
    timer = 0;
    picCount = picCount - 1;
  }
  if (keyCode == RIGHT)
  {
    timer = 0;
    picCount = picCount + 1;
  }
}

void drawLoadedImages(PImage picSeries, float picX, float picY, float picWidth, float picHeight)
{
  if (picSeries.width > 0)
  {
    image(picSeries, picX, picY, picWidth, picHeight);
  }
}



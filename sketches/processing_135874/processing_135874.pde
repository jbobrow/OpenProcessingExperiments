
int numberFrames = 9;
float timer = 0.0;
PImage[] images = new PImage[numberFrames];
PImage walkingSonic;
PImage standingSonic;
int xMove = 0;
int backgroundIndex = 0;

void setup()
{
  size(500, 500);
  background(255);
  frameRate(30);
  
  images[0] = requestImage("Level1.jpg");
  images[1] = requestImage("Level2.jpg");
  images[2] = requestImage("Level3.jpg");
  images[3] = requestImage("Level4.jpg");
  images[4] = requestImage("Level5.jpg");
  images[5] = requestImage("Level6.jpg");
  images[6] = requestImage("Level7.jpg");
  images[7] = requestImage("Level8.jpg");
  images[8] = requestImage("Level9.jpg");
  
  walkingSonic = loadImage("SonicRun.png");
  standingSonic = loadImage("SonicIdle.png");
  
}

void draw()
{
  timer = timer + (1.0/30.0);
  println(timer);
  if (timer > 3.37)
  {
    backgroundIndex += 1;
    timer = 0;
  }
  if (backgroundIndex < 0 || backgroundIndex >= images.length)
  {
    backgroundIndex = 0;
  }
  image(images[backgroundIndex], 0, 0, width, height);
  
  if (timer > 0)
  {
    xMove = xMove + 5;
    if (backgroundIndex == 0 || backgroundIndex <= 5)
    {
      image(walkingSonic, xMove, 300);
    }
    if (backgroundIndex >= 6)
    {
      image(standingSonic, xMove, 300);
    }
  }
  
  if (xMove > width)
  {
    xMove = 0;
  }
}





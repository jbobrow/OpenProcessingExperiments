
int numFrames = 6;
float timer = 0.0;
PImage [] images = new PImage[numFrames];
PImage runningman;
int xMove = 0;
int backgroundIndex = 0;

void setup()
{
  size(400,400);
  background(255);
  frameRate(30);
  
  images[0] = requestImage("volcano.jpg");
  images[1] = requestImage("tank.jpg");
  images[2] = requestImage("swamp.jpg");
  images[3] = requestImage("skyrimmountain.jpg");
  images[4] = requestImage("ice.jpg");
  images[5] = requestImage("underwater.jpg");
  
  runningman = loadImage("runningman.jpg");
}

void draw()
{
  timer = timer +(1.0/30.0);
  println(timer);
  if (timer > 3)
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
    xMove = xMove + 4;
    if (backgroundIndex == 0 || backgroundIndex <= 5)
    {
      image(runningman, xMove, 100);
    }
  }
  if (xMove > width)
  {
    xMove = 0;
  }
}

void keyReleased()
{
  if (key == 'z')
  {
    timer = 0;
  }
}



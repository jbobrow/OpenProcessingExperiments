
int numFrames =10;
float timer=0.0;
PImage[] images = new PImage[numFrames];
int backgroundIndex = 0;


void setup()
{
  size(500,500);
  background(255);
  frameRate(30);
  
  images[0] = requestImage ("artorias.png");
  images[1] = requestImage ("canti.png");
  images[2] = requestImage ("daft punk.png");
  images[3] = requestImage ("gurran lagann.png");
  images[4] = requestImage ("magneto.png");
  images[5] = requestImage ("monster hunter.png");
  images[6] = requestImage ("pikachu.png");
  images[7] = requestImage ("smash.png");
  images[8] = requestImage ("smile.png");
  images[9] = requestImage ("sol.png");
}

void draw()
{
  timer= timer+(1.0/30.0);
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
  
  image (images[backgroundIndex], 0, 0, width, height);
}

void keyReleased()
{
  if (keyCode == RIGHT)
  {
    backgroundIndex += 1;
  }
  if (keyCode == LEFT)
  {
    backgroundIndex += -1;
  }
  if (key == 'r')
  {
    backgroundIndex = (int)random(0,9);
  }
}



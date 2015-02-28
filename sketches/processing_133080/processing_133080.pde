


PImage[] myimages = new PImage[8];

int backgroundIndex = 0;
float timer = 0;


void setup()
{
size (600, 600);
framerate(30);

myimages[0] = requestImage("gampicwalk1.png");
myimages[1] = requestImage("gampicwalk2.png");
myimages[2] = requestImage("gampicwalk3.png");
myimages[3] = requestImage("gampicwalk4.png");
myimages[4] = requestImage("gampicwalk5.png");
myimages[5] = requestImage("gampicwalk6.png");
myimages[6] = requestImage("gampicwalk7.png");
myimages[7] = requestImage("gampicwalk8.png");

}

void draw()
{
background (225);
timer = timer + 1.0 / 30.0;

if (timer > 3)//when it starts
{
  backgroundIndex = backgroundIndex + 1;
  timer = 0;
}

if (backgroundIndex < 0 || backgroundIndex >= myimages.length)
  {
  backgroundIndex = 0;
  }

if (backgroundIndex >= myimages.length)
  {
  backgroundIndex = 0;
  }

image(myimages[backgroundIndex], 0, 0, width, height);

}

void keyReleased()
{
  if (key == 'r')
    {
      backgroundIndex = (int)random(0, 7);
    }
  if (keyCode == LEFT)
    {
    backgroundIndex = backgroundIndex - 1;
    }
  if (keyCode == RIGHT)  
    {
    backgroundIndex = backgroundIndex +1;
    }
    
    
    
}



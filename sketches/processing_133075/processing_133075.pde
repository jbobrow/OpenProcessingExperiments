


PImage[] myimages = new PImage[10];

int backgroundIndex = 0;
float timer = 0;



void setup()
{
size (300, 300);
frameRate(30);

myimages[0] = requestImage("gampic_duck.jpeg");
myimages[1] = requestImage("gampic_fish.jpeg");
myimages[2] = requestImage("gampic_giraffe.jpeg");
myimages[3] = requestImage("gampic_goat.jpeg");
myimages[4] = requestImage("gampic_orangecat.jpeg");
myimages[5] = requestImage("gampic_ost.jpeg");
myimages[6] = requestImage("gampic_owl.jpeg");
myimages[7] = requestImage("gampic_penguine.jpeg");
myimages[8] = requestImage("gampic_chicken.jpeg");
myimages[9] = requestImage("gampic_dog.jpeg");
}


void draw ()
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
      backgroundIndex = (int)random(0, 9);
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



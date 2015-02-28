
int numFrames = 13;
float timer = 0.0;
PImage [] images = new PImage [numFrames];
int backgroundIndex = 0;

void setup()
{
  size(500,500);
  background(255);
  frameRate(30);
  
  images[0] = requestImage("ash.png");
  images[1] = requestImage("pichu.jpg");
  images[2] = requestImage("pikachu.jpg");
  images[3] = requestImage("raichu.jpg");
  images[4] = requestImage("bulbasaur.jpg");
  images[5] = requestImage("ivysaur.png");
  images[6] = requestImage("venasaur.png");
  images[7] = requestImage("squirtle.jpg");
  images[8] = requestImage("wartortle.jpg");
  images[9] = requestImage("Blastoise.gif");
  images[10] = requestImage("charmander.jpg");
  images[11] = requestImage("charmeleon.png");
  images[12] = requestImage("charizard.png");
}

void draw()
{
  timer = timer + (1.0/30.0);
  println (timer);
  if (timer > 2)
  {
    backgroundIndex += 1;
    timer = 0;
  }
  if (backgroundIndex < 0 || backgroundIndex >= images.length)
  {
    backgroundIndex = 0;
  }
  image(images[backgroundIndex], 0, 0, width, height);
}

void mouseReleased()
{
  if (mouseButton == RIGHT)
  {
    backgroundIndex = (int)random(0, 12);
  }
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
  if (keyCode == CENTER)
  {
    backgroundIndex = (int) random(0, 12);
  }
}



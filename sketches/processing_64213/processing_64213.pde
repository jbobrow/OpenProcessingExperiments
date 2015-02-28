
Fish f;                 //creating a fish
Bubbles b;
double speed = 2;       //speed the fish moves
double x = 0;           //initalized x coordinate of fish
double y = 0;           //initalized y coordinate of fish
PImage bubble;
PImage fish;

void setup()
{
  size(500, 500);
  f = new Fish(100, 100);
  b = new Bubbles();
  bubble = loadImage("bubble.png");
  fish = loadImage("Fish.png");
}

void draw()
{
  Stopwatch s = new Stopwatch();
  s.start();
  if(s.getElapsedTimeSecs() == 60)
  {
    noLoop();
  }
  else
  {
    background(#99FFFF);
    f.swim();
    b.spawn();
    if(keyCode == 'n')
    {
      setup();
    }
  }
  
  
}

class Fish
{
  Fish(int xCord, int yCord)
  {
    x = xCord;
    y = yCord;
  }

  void swim()
  {
    fill(0, 0, 200);
    image(fish, (int)x, (int)y);
  }
}

class Bubbles
{
  int rX = 0;      //random X value
  int bY = height; //starting y value for the bubble
  Bubbles()
  {
    //b = new ArrayList<PImage>();
  }

  void drift()
  {
    bY--;
  }

  void spawn()
  {
    for(int i = 0; i < 5; i++)
      image(bubble, (int)x+100, (int)y+50, randomX(), 30);
  }

  int randomX()
  {
    return floor(random(height));
  }
}


public void keyPressed()
{
  if (keyCode == 'w' || keyCode == UP)
    y = y > 0 ? y-=speed:0;
  if (keyCode == 'a' || keyCode == LEFT)
    x = x > 0 ? x-=speed:0;
  if (keyCode == 's' || keyCode == DOWN)
    y = y < height-105 ? y+=speed:height-105;
  if (keyCode == 'd' || keyCode == RIGHT)
    x = x < width-100 ? x+=speed:width-100;
}



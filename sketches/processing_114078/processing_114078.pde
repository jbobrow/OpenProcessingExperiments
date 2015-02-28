
SpriteObject[]  mysprites = new SpriteObject[10];
boolean direction;
int currentSprite = 0;
float timer = 0;
float x = 0;

void setup()
{
  size(200, 200);
  for (int i = 0; i < 10; i++)
  {
    mysprites[i] = new SpriteObject("animal" + i + ".jpg");
  }
  direction = false;
}

void draw()
{
  background(0);
  timer += 0.05;
  timer = timer + x;
  println(currentSprite);

  if (timer > 3)
  {
    if (direction == false)
    {
      currentSprite++;;
      timer = 0;
    }
    else
    {
      currentSprite--;
      timer = 0;
    }
  }
  if (currentSprite >= 10)
  {
    currentSprite = 0;
  }
  if (currentSprite < 0)
  {
    currentSprite = 9;
  }
  mysprites[currentSprite].render();
}

void keyPressed()
{
  if (key == 'r')
  {
    noLoop();
    mysprites[int(random(10))].render();
  }

  if (key == 'w')
  {
    x += 0.05;
  }
  if (key == 's')
  {
    x -= 0.05;
  }
  if (key == 'f')
  {
    direction = !direction;
  }
}
void keyReleased()
{
  if (key == 'r')
  {
    loop();
  }
}

class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
  boolean loaded = false;

  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }

  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }

    if (loaded)
    {
      image(this.img, 0, 0, 200, 200);
    }
  }
}




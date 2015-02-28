
SpriteObject[] charmander = new SpriteObject[3];
int currentFrame = 0;
float timer = 0;
float x = 0;
float y = 0;
float speed = 3.0;
float left = 0;
float right = 0;
float up = 0;
float down = 0;

class Player extends SpriteObject
{
  Player(String filename)
  {
    super(filename);
  }
  void update()
  {
    this.x += (right - left) * speed;
    this.y += (down - up) * speed;
  }
}


void setup()
{
  size(500, 500);
  
  charmander[0] = new SpriteObject ("charmander1.png");
  charmander[1] = new SpriteObject ("charmander2.png");
  charmander[2] = new SpriteObject ("charmander3.png");
}
 
void draw()
{
  background(0);
  
  timer += 0.0167;
  
  if (timer > .1)
  {
    currentFrame ++;
    timer = 0;
  }
  
  if (currentFrame >= 3)
    { 
      currentFrame = 0;
    } 
    charmander [currentFrame].render();
      charmander [currentFrame].update();  
  

}
 
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 0;
    }
    if (keyCode == RIGHT)
    {
      right = 0;
    }
    if (keyCode == UP)
    {
      up = 0;
    }
    if (keyCode == DOWN)
    {
      down = 0;
    }
  }
}
 
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 1;
    }
    if (keyCode == RIGHT)
    {
      right = 1;
    }
     if (keyCode == UP)
    {
      up = 1;
    }
    if (keyCode == DOWN)
    {
      down = 1;
    }
  }
}

class SpriteObject
{
  float x = 0;
  float y = 0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = .5;
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
      imageMode(CENTER);
      pushMatrix();
      translate(this.x / 2, this.y /2);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}




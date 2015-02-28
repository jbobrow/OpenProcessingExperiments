
SpriteObject player;
SpriteObject[] enemiesTop, enemiesBottom;
int[] speeds;
boolean colliding;
PImage b;
int timer, best;

void setup()
{
  timer = 0;
  best = 0;
  size(600, 400);
  b = loadImage("The-Forest-Floor.jpeg");
  player = new SpriteObject("apple.png");
  enemiesTop = new SpriteObject[15];
  enemiesBottom = new SpriteObject[15];
  speeds = new int[30];
  
  for(int c = 0; c < 15; c++)
  {
    enemiesTop[c] = new SpriteObject("ant.png");
    enemiesTop[c].x = random(0, 580);
    enemiesTop[c].y = -100;
    enemiesBottom[c] = new SpriteObject("ant.png");
    enemiesBottom[c].x = random(0, 580);
    enemiesBottom[c].y = 500;
    speeds[c] = (int)random(4, 8);
  }
}

void draw()
{
  timer++; 
  
  image(b, width/2, height/2, 600, 400);

  if(colliding)
  {
    fill(202, 0, 0);
    rect(0, 0, 600, 400);
    if(timer > best)
    {
      best = timer;
    }
    timer = 0;
  }
  
  colliding = false;
  
  player.x = mouseX;
  player.y = mouseY;
  player.render();
  
  for(int c = 0; c < 15; c++)
  {
    enemiesTop[c].y += speeds[c];
    enemiesBottom[c].y -= speeds[c];
    
    if(enemiesTop[c].y >= 500)
    {
      enemiesTop[c].y = -100;
      enemiesTop[c].x = random(0, 580);
    }
    
    if(enemiesBottom[c].y <= -100)
    {
      enemiesBottom[c].y = 500;
      enemiesBottom[c].x = random(0, 580);
    }
    
    enemiesTop[c].render();
    enemiesBottom[c].render();
    
    if(enemiesTop[c].isOverlapping(player) || 
      enemiesBottom[c].isOverlapping(player))
    {
      colliding = true;
    }
  }
  stroke(0);
  fill(170, 14, 14);
  textSize(20);
  text("Score: " + timer, 10, 20);
  text("Best: " + best, 10, 35); 
  
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
   
  boolean isMouseOverlapping()
  {
    if (mouseX > (this.x - (this.w * 0.5 * this.s))
      && mouseX < (this.x + (this.w * 0.5 * this.s))
      && mouseY > (this.y - (this.h * 0.5 * this.s))
      && mouseY < (this.y + (this.h * 0.5 * this.s)))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
   
  boolean isOverlapping(SpriteObject other)
  {
    float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
      
    float otherLeft = other.x - (other.w * 0.5 * other.s);
    float otherRight = other.x + (other.w * 0.5 * other.s);
    float otherTop = other.y - (other.h * 0.5 * other.s);
    float otherBottom = other.y + (other.h * 0.5 * other.s);  
      
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
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
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}




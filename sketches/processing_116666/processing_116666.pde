
int [] circleX= new int[8];
int [] circleY= new int[8];
int [] circleSize= new int[8];
float [] circleSpeed= new float[8];
color[] ccolor= new color[8];
int x=300;
SpriteObject player;
color playerColor = color(255);
void setup()
{
  player=new SpriteObject("ship.jpg");
  player.y=470;
  player.s=.3;
  size(500,500);
for (int circle=0;circle<8;circle++)
{
  
  circleX[circle]=(int)random(10,480);
  circleY[circle]=(int)random(5,200);
  circleSize[circle]=(int)random(30,50);
  ccolor[circle]=color(random(30,255),random(30,255),random(30,255));
  
  circleSpeed[circle]=random(1,3);
  
}

}
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      x-=10;
    }
    if (keyCode == RIGHT)
    {
      x+=10;
    }
  }
}


void draw()
{
    player.x=x;
    

  background (255);
  tint(playerColor);
  player.render();
  playerColor = color(255);
  
  for (int circle=0;circle<8;circle++)
{
  if (player.isOverlappingCircle(circleX[circle], circleY[circle], circleSize[circle] * 0.5) == true)
  {
    fill(0,0,0,0);
    stroke(0,0,0,0);
    playerColor = color(255, 0);
  }
  else
  {
    stroke(0);
    fill(ccolor[circle]);
  }
  ellipse(circleX[circle],circleY[circle],circleSize[circle],circleSize[circle]);

  
}

for (int circle=0;circle<8;circle++)
{
  circleY[circle] +=  circleSpeed[circle] + random(-0.2,1.5);

  
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
 
boolean isOverlappingCircle(float cx, float cy, float cr) 
{
 float rx = this.x - (this.w * 0.5 * this.s);
 float ry = this.y - (this.h * 0.5 * this.s);
 float rw = this.w * this.s;
 float rh = this.h * this.s;
 
  float circleDistanceX = abs(cx - rx - rw/2);
  float circleDistanceY = abs(cy - ry - rh/2);
 
  if (circleDistanceX > (rw/2 + cr)) { return false; }
  if (circleDistanceY > (rh/2 + cr)) { return false; }
  if (circleDistanceX <= rw/2) { return true; }
  if (circleDistanceY <= rh/2) { return true; }
 
  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
  return cornerDistance <= pow(cr, 2);
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
 
boolean rectRectIntersect(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}





class Platform
{
  float x,y,w,h;
  float xvel, yvel;
 
  Platform(int x, int y, int w, int h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
 
  void display()
  {
    fill(0);
    rect(x,y,w,h);
  }
 
  void move()
  {
    x += xvel;
    y += yvel;
  }
 
}
 
class HorizontalMovingPlatform extends Platform
{
  static final float speed = 0.9;
   
  HorizontalMovingPlatform(int x, int y, int w, int h)
  {
    super(x, y, w, h);
    this.xvel = speed;
  }
   
  void move()
  {
    super.move();
    if( (x+w > width - 10) || (x < 10) )
    {
      xvel *= -1;
    }
  }
}

class Player
{
 
  static final float gravity = 0.14;
  static final float bounceVel = 6.1;
  static final float maxYVel = 12;
  static final float maxXVel = 2;
 
  float x, y, xVel, yVel;
  int w, h;
  Player(int x, int y)
  {
    this.x = x;
    this.y = y;
    w = h = 20;
  }
 
  void display()
  {
    fill(204,0,0);
    rect(x,y,w,h);
  }
 
  void move()
  {
    x += xVel;
    y += yVel;
 
    // wrap around
    if (x > width-w) x = 0;
    if (x < 0) x = width-w;
 
    // horizontal
    if (!gameOver)
    {
      if (aPressed) xVel -= 0.05;
      else if (dPressed) xVel += 0.05;
      else
      {
        if (xVel > 0) xVel -= 0.03;
        else  xVel += 0.03;
      }
    }
    if (abs(xVel) < 0.01) xVel = 0;
    xVel = min(maxXVel, xVel);
    xVel = max(-maxXVel, xVel);
 
    // vertical
    yVel += gravity;
    yVel = min(maxYVel, yVel);
    yVel = max(-maxYVel, yVel);
  }
 
  void collide(Platform p)
  {
    // standard rectangle intersections, but only for our lowest quarter
    if(x         < p.x + p.w &&
      x + w      > p.x       &&
      y+h/2+h/4  < p.y + p.h &&
      y + h      > p.y)
    {
      // but we only care about platforms when falling
      if (yVel > 0) {
        // for bouncing
        yVel = -bounceVel;
      }
    }
  }
 
}

Player p;
ArrayList platforms;
boolean wPressed, aPressed, sPressed, dPressed;
int score, fallCount;
boolean gameOver;
 
void setup()
{
  size(320, 480);
  frameRate(60);
  initialize();
}
 
void initialize()
{
  score = 0;
  fallCount = 0;
  gameOver = false;
  p = new Player(width/2, height/2);
  platforms = new ArrayList();
  platforms.add(new HorizontalMovingPlatform(20,80,70,8));
  platforms.add(new Platform(100,420,100,8));
  platforms.add(new Platform((int)random(40,180),320,100,8));
  platforms.add(new Platform((int)random(40,180),220,100,8));
  platforms.add(new Platform((int)random(40,180),120,100,8));
  platforms.add(new Platform((int)random(40,180),20,100,8));
}
 
void draw()
{
  //println(score);
  background(204);
  for(int i=0; i<platforms.size(); i++)
  {
    // le sigh... i wish processing supported generics.
    // http://dev.processing.org/bugs/show_bug.cgi?id=598
    p.collide((Platform)platforms.get(i));
    ((Platform)platforms.get(i)).display();
    ((Platform)platforms.get(i)).move();
  }
  p.display();
  p.move();
 
  adjustViewport();
  cleanUp();
  seedNewPlatforms();
  if (platformsBelow() == 0) gameOver = true;
  if (gameOver) fallCount++;
  if (fallCount > 90 ) initialize();
}
 
int platformsBelow()
{
  int count = 0;
  for(int i=0; i<platforms.size(); i++)
  {
    if (((Platform)platforms.get(i)).y >= p.y) count++;
  }
  return count;
}
 
void adjustViewport()
{
  // above midpoint
  float overHeight = height * 0.5 - p.y;
  if(overHeight > 0)
  {
    p.y += overHeight;
    for(int i=0; i<platforms.size(); i++)
    {
      ((Platform)platforms.get(i)).y += overHeight;
    }
    score += overHeight;
  }
  // falling
  float underHeight = p.y - (height-p.h-4);
  if(underHeight > 0)
  {
    p.y -= underHeight;
    for(int i=0; i<platforms.size(); i++)
    {
      ((Platform)platforms.get(i)).y -= underHeight;
    }
  }
}
 
void cleanUp()
{
  for(int i=platforms.size()-1; i>=0; i--)
  {
    // scrolled off the bottom
    if(((Platform)platforms.get(i)).y > height)
    {
      platforms.remove(i);
    }
  }
}
 
void seedNewPlatforms()
{
  if(platforms.size() < 7)
  {
    if(random(0,10) < 2) platforms.add(new HorizontalMovingPlatform((int)random(10,width-80),-10,70,8));
    else platforms.add(new Platform((int)random(20,200),-10,70,8));
  }
}
 
void keyPressed()
{
  if (key == 'w') wPressed = true;
  if (key == 'a') aPressed = true;
  if (key == 's') sPressed = true;
  if (key == 'd') dPressed = true;
}
 
void keyReleased()
{
  if (key == 'w') wPressed = false;
  if (key == 'a') aPressed = false;
  if (key == 's') sPressed = false;
  if (key == 'd') dPressed = false;
}


Ball b;
Rect r1;
ArrayList<Rect> rects = new ArrayList<Rect>();
boolean keyup,keyleft,keyright,keydown;

void setup()
{
  background(0);
  size(700,700);
  b = new Ball(200,200,5,1);
  for (int i = 0; i< 10; i++)
  {
    rects.add(new Rect());
  }
}

void draw()
{
  background(0);
  b.drawBall();
  for(int i = 0; i< rects.size(); i++)
  {
    Rect r1 = rects.get(i);
    r1.drawRect();
    if (keyleft)  r1.keyLeft();
    if (keyright) r1.keyRight();
    if (keyup)    r1.keyUp();
    if (keydown)  r1.keyDown();
  }
}

void keyPressed()
{
  if(keyCode == UP)    keyup = true;
  if(keyCode == LEFT)  keyleft = true;
  if(keyCode == RIGHT) keyright= true;
  if(keyCode == DOWN)  keydown = true;
}
void keyReleased()
{
  if(keyCode == UP)    keyup = false;
  if(keyCode == LEFT)  keyleft = false;
  if(keyCode == RIGHT) keyright = false;
  if(keyCode == DOWN)  keydown = false;
}

class Rect
{
  float xpos;
  float ypos;
  int xvel;
  int yvel;
  float ws;
  float hs;
  float rfill;
  int c;
  
  Rect()
  {
    xpos = random(width);
    ypos = random(height);
    ws = random(100);
    hs = random(100);
    c = color(random(255),random(255),random(255));
  }
  void drawRect()
  {
    rect(xpos,ypos,ws,hs);
    fill(c);
    if (xpos > width - ws)   xpos = xpos - 3;
    if (ypos > height - hs)  ypos = ypos - 3;
    if (xpos < 0) xpos = xpos + 3;
    if (ypos < 0) ypos = ypos + 3;
    println(xpos);
    //if ()
   // {
     // c = color(255,0,0);
    //}
  }
  void keyUp()
  {
    ypos = ypos - 3;
  }
  void keyDown()
  {
    ypos = ypos +3;
  }
  void keyLeft()
  {
    xpos = xpos - 3;
  }
  void keyRight()
  {
    xpos = xpos +3;
  }
}

class Ball
{
  float posx;
  float posy;
  float xvel;
  float yvel;
  float s;
  float c;
  
  Ball(float x, float y, float xv, float yv)
  {
    posx = x;
    posy = y;
    xvel = xv;
    yvel = yv;
    s = 30;
  }
  
  void drawBall()
  {
    posx += xvel;
    posy += yvel;
    fill(255);
    if ((posx < 0) || (posx > width))  xvel *= -1;
    if ((posy < 0) || (posy > height))  yvel *= -1;
    noStroke();
    ellipse(posx,posy,s,s);
  }
}


float timer = 0;
int index = 0;
 
class SpriteObject
{
  SpriteObject()
  {
    m_w = 100;
    m_h = 100;
  }
  SpriteObject(float ww, float hh)
  {
    m_w = ww;
    m_h = hh;
  }
  PImage m_image;
  float  m_rotation;
  float m_x;
  float m_y;
  float m_w;
  float m_h;
   
  void draw()
  {
    if (m_image.width > 0)
    {
      pushMatrix();
      translate(m_x, m_y);
      rotate(radians(m_rotation));
      //imageMode(CENTER);
      image(m_image, 0, 0, m_w, m_h);
      popMatrix();
      noTint();
      //imageMode(CORNER);
    }
  }
}
SpriteObject[] mySpriteObject = new SpriteObject[10];
 
void setup()
{
  size(500, 500);
  frameRate(24);
  mySpriteObject[0] = new SpriteObject();
  mySpriteObject[0].m_image = requestImage("smiley.png");
  for (int i = 1; i < mySpriteObject.length; i = i + 1)
  {
    mySpriteObject [i] = new SpriteObject();
    mySpriteObject [i].m_image = requestImage("smiley" + (i+1) + ".png");
    mySpriteObject[i].m_x = width / 2;
    mySpriteObject[i].m_y = height / 2;
    mySpriteObject[i].m_rotation = 0;
    mySpriteObject[i].m_w = 250;
    mySpriteObject[i].m_h = 250;
  }
}
 
void draw()
{
  background(255);
  timer = timer + 1;
  mySpriteObject[index].draw();
}

void keyReleased()
{
  if (key == 'r')
  {
    index = (int)random(0, 9);
  }
  if (keyCode == LEFT)
  {
    index = index - 1;
  }
  if (keyCode == RIGHT)
  {
    index = index + 1;
  }
}



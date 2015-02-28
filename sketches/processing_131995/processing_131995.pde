
float timer;
int index;

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
      imageMode(CENTER);
      image(m_image, 0, 0, m_w, m_h);
      popMatrix();
      noTint();
      imageMode(CORNER);
    }
  }
}

SpriteObject mysprite;
SpriteObject smile;

void setup()
{
  size(500, 500);
  
  mysprite = new SpriteObject(100, 100);
  smile = new SpriteObject();
  mysprite.m_image = requestImage("sonic.png");
  smile.m_image = requestImage("smile.png");
  smile.m_x = 200;
  smile.m_y = 200;
}

void draw()
{
  mysprite.draw();
  smile.draw();
}





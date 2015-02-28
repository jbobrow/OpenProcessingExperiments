
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

SpriteObject one;
SpriteObject two;
SpriteObject three;

void setup()
{
  size(500, 500);
   
  one = new SpriteObject(100, 100);
  two = new SpriteObject();
  three = new SpriteObject();
  one.m_image = requestImage("1.png");
  two.m_image = requestImage("2.png");
  three.m_image = requestImage("3.png");
  one.m_x = 200;
  one.m_y = 200;
}
 
void draw()
{
  one.draw();
  two.draw();
}



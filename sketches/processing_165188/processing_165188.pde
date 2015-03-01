
/*
  
  1. Making a SpriteObject class
  2. Arrays
  3. Loading and Cycling Multiple Images
  
*/
 
SpriteObject one;
SpriteObject two;
SpriteObject three;
 
void setup()
{
  size(500, 500);
    
  one = new SpriteObject(100, 100, 100, 200);
  two = new SpriteObject(200, 200, 100, 0);
  three = new SpriteObject(100,100, 300, 200);
  one.m_image = requestImage("1.png");
  two.m_image = requestImage("2.png");
  three.m_image = requestImage("3.png");
}
  
void draw()
{
  one.draw();
  two.draw();
  three.draw();
}

class SpriteObject {
  
  PImage m_image;
  float  m_rotation;
  float m_x;
  float m_y;
  float m_w;
  float m_h;
  
  SpriteObject(float ww, float hh, float xx, float yy){
    m_w = ww;
    m_h = hh;
    m_x = xx;
    m_y = yy;
  }
   
  void draw(){
    if (m_image.width > 0)
    {
      pushMatrix();
      translate(m_x, m_y);
      imageMode(CENTER);
      image(m_image, 0, 0, m_w, m_h);
      popMatrix();
      noTint();
      imageMode(CORNER);
    }
  }
}




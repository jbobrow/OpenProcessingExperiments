
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
      timer = timer + 1.0 / 30.0;
   
  if (timer > 3)
  {
   index = index + 1;
    timer = 0;
  }
   
  if (index >= myspriteobject.length)
  {
    index = 0;
  }

  } 
} 

SpriteObject[] myspriteobject = new SpriteObject[10];

void setup() 
{ 
 size(500, 500); 
   myspriteobject[0] = new SpriteObject();
   myspriteobject[0].m_image = requestImage ("Walking1.png"); 
  for (int i = 1; i < myspriteobject.length; i = i + 1)
  {
    myspriteobject [i] = new SpriteObject();
    myspriteobject [i].m_image = requestImage("Walking" + (i+1) + ".png");
  }
  for (int i = 0; i < myspriteobject.length; i = i + 1)
  {
    myspriteobject [i].m_x = width/2;
    myspriteobject [i].m_y = height/2;
    myspriteobject [i].m_w = width;
    myspriteobject [i].m_h = height;
  }
} 

void draw() 
{ 
  myspriteobject[index].draw(); 
} 

  
  




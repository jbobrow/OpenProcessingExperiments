
//Circle myCircle;
ArrayList balls;

void setup()
{
  size(500,500);
  balls = new ArrayList();
  //myCircle = new Circle();
  balls.add(new Circle(mouseX,mouseY));
}

void draw()
{
  background(255);
  for(int i=balls.size()-1; i>=0; i--)
 {
   Circle myCircle = (Circle) balls.get(i);
   myCircle.move();
   myCircle.display();
 } 
  //myCircle.move();
  //myCircle.display();
}

class Circle
{
    color m_c;
    float m_xspeed;
    float m_yspeed;
    float m_x;
    float m_y;
    float r=random(255);
    float g=random(255);
    float b=random(255);
//    float a=random(255);
        float a=255;
        
    Circle(int mouseX,int mouseY)
    {
      r=random(r);
      m_c = color(r,g,b,a);
      m_xspeed = -3;
      m_yspeed = 3;
      m_x = mouseX; 
      m_y = mouseY;
      
    }
    void display()
    {
      stroke(0);
      fill(m_c);
       ellipseMode(CENTER);
      ellipse(m_x,m_y,50,50);
      
      // ellipse(width/2,-abs(sin(a)*200),50,50);
   
  
  }
  
  void move()
  {
    m_x = m_x+m_xspeed;
      m_y = m_y+m_yspeed;
      
      m_yspeed = m_yspeed + 0.1;
      
      if(m_x>width)
      {
        m_x=width;
        m_xspeed = m_xspeed * -0.8;
      }
      if(m_x<0)
      {
        m_x=0;
        m_xspeed = m_xspeed * -0.8;
      }
      if(m_y>height)
      {
        m_y=height;
        m_yspeed = m_yspeed * -0.8;
      }
  }
 
}

void mousePressed()
{
 
  balls.add(new Circle(mouseX,mouseY));
}




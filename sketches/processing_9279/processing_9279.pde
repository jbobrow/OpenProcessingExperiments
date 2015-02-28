
public class Particle
{
  PVector position,acc,speed;
  float angle;
  boolean GRAVITY = true;
  float sat;
  float col;
  float trans;
  
  public Particle(float cX , float cY , String MODE , String COLORMODE , float clr)
  {
    if (MODE=="RANDOM")
    {
      angle = random(0,TWO_PI);
      float distance = random(1,200);
      float x = cos(angle)*distance;
      float y = sin(angle)*distance;
      position = new PVector(cX+x,cY+y);
      speed = new PVector(0,0);
      trans = 100;
      if (COLORMODE=="RANDOM")
      col = random(0,100);
      else
      col = clr;
    }
    
    else if (MODE=="CENTER")
    {
      angle = random(0,TWO_PI);
      float distance = random(5,10);
      float x = cos(angle)*distance;
      float y = sin(angle)*distance;
      position = new PVector(cX,cY);
      speed = new PVector(x,y);
      trans = 100;
      if (COLORMODE=="RANDOM")
      col = random(0,100);
      else
      col = clr;
    }
    
  }
  
  public void draw()
  {
    strokeWeight(1);
    stroke(col,100,50,trans);
    fill(col,100,100,trans);
    ellipse(position.x,position.y,2,2);
  }
  
  void calculate()
  {
    if (GRAVITY)
    {
      gravity();
    }
    
    speed.x*=0.98;
    speed.y*=0.98;
    
    trans-=.8;
    
    position.add(speed);
    
  }
  
  void gravity()
  {
    speed.y+=.2;
  }
  
}


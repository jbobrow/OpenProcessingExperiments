


ArrayList circle_list;

void setup()
{
  size(900, 450);
  background(20);
  
  circle_list = new ArrayList();
  
}

void draw()
{
  
  background(20);
  
  int i;
  
  for(i=0;i<circle_list.size();i++)
  {
    PCircle temp;
    temp = (PCircle) circle_list.get(i);
    temp.pulse();
  }
  
}

void mousePressed()
{
  PCircle temp;
  temp = new PCircle(new PVector(mouseX, mouseY), random(20, 40));

  circle_list.add(temp);
}

class PCircle
{
  
  PVector loc;
  
  float rad;
  
  float t = 0;
  
  PCircle(PVector _loc, float _rad)
  {
    loc = _loc;
    rad = _rad;
  }
  
  void shout()
  {
    //println("My coordinates are: " + loc.x + ", " + loc.y + ".");
  }
  
  void increaseSize(float amount)
  {
    rad = rad + amount;
  }
  
  void pulse()
  {
    
    
    rect(loc.x, loc.y, sin(t) *3* rad, sin(t) * 2*rad);
    
    t = t + 0.1; 
    
    if(t >= PI*4) 

    {
      t = 0;
    }
  }
  
}

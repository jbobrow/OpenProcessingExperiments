


ArrayList pointlist;

void setup()
{
  size(900, 450);
  background(255);
  
  pointlist = new ArrayList();
}

void draw()
{
  
  int i;
  
  for(i = 1; i < pointlist.size(); i++)
  {
    PVector p1, p2;
    
    p1 = (PVector) pointlist.get(i);
    p2 = (PVector) pointlist.get(i-1);
    
    strokeWeight(map(p1.dist(p2), 0, 100, 0.2, 10));
    stroke( map(p1.dist(p2), 0, 100, 0, 150), map(p1.dist(p2), 0, 100, 255, 150), 50);

    line(p1.x, p1.y, p2.x, p2.y);    
  }
  
  int j;
  
  for(i = 0; i < pointlist.size()-1; i++)
  {
    for(j = i + 1; j < pointlist.size(); j++)
    {
      PVector p1, p2;
    
      p1 = (PVector) pointlist.get(i);
      p2 = (PVector) pointlist.get(j);
      
      if(p1.dist(p2) < 60)
      {
        line(p1.x, p1.y, p2.x, p2.y); 
      }
    }
  }
  
}

void mousePressed()
{
  PVector p;
  p = new PVector(mouseX, mouseY);
  
  pointlist.add(p);
}

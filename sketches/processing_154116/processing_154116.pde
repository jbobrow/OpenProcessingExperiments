
class Bot
{
  int r, g, b;
  int size;
  color c;
  PVector position;
  PVector velocity = new PVector();
  
  
  Bot (PVector startPos)
  {
    position = startPos;
  }
  
  void update()
  {
    
    if (velocity.x>1)
    {
      velocity.x = 1;
    }
    if (velocity.y>1)
    {
      velocity.y = 1;
    }
    if (velocity.x<-1)
    {
      velocity.x = -1;
    }
    if (velocity.y<-1)
    {
      velocity.y = -1;
    }
    
    position.add (velocity);    
  }
  
  void display ()
  {
    fill (c);
    ellipse (position.x, position.y, size, size);
  }
}

Bot[] bots = new Bot[300];

void setup ()
{
  size (500,500);
  
  
  for (int i = 0; i<bots.length; i++)
  {
    float x = random(width);
    float y = random (height);
    bots[i] = new Bot (new PVector (x, y));
    
    float r = random (255);
    float g = random (255);
    float b = random (255);
    
    color c = color (r, g, b);
    bots[i].c = c;
    
    bots[i].r = (int) r;
    bots[i].b = (int) b;
    
    bots[i].size = 3;
    
  }
  
}

void draw()
{
  background(0);
  
  for (int i=0; i<bots.length; i++)
  {
    
  
    int xR = (int) random(2);
    int yR = (int) random(2);
    bots[i].velocity.x = bots[i].velocity.x + (bots[i].r/1000)*(xR - 1);
    bots[i].velocity.y = bots[i].velocity.y + (bots[i].r/1000)*(yR - 1);
    
    bots[i].update();
    bots[i].display();
  
  } 
}


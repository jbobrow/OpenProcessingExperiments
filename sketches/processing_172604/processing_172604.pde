
Raindrop[] raindrops = new Raindrop[250];
Raindrop[] raindrops1 = new Raindrop[250];

float wind;
void setup()
{
  smooth();
  size(1000, 850);  
  if (frame != null) 
  {
    frame.setResizable(true);
  } 
  background(0);
  for(int i=0;i<raindrops.length;i++)
  {
    raindrops[i] = new Raindrop(random(0,width),random(0,height));
    raindrops1[i] = new Raindrop(random(0,width),random(0,height));
    
  }
}

void draw()
{
  background(0);
 for(int i=0;i<raindrops.length;i++)
  {
    raindrops[i].fall(random(1,25),wind);
    raindrops1[i].fall(random(1,25),wind);
    
  }
}

void keyPressed() 
{
  if (key == 'r')
  {
    wind = wind + 0.4;
  }
  else if (key == 'l')
  {
    wind = wind - 0.4;
  }
  
  /*if (key == CODED) 
  {
    else if (keyCode == RIGHT) 
    {
      wind = wind + 0.4;
    }
    else if (keyCode == LEFT) 
    {
      wind = wind - 0.4;
    }
  } */ 
}
class Raindrop
{
  float x;
  float y;


  Raindrop(float dropX, float dropY)
  {
    x = dropX;
    y = dropY;
  }

  void fall(float speed, float wind)
  {
    y = y + speed;
    x = x + wind;
    if (y >= height){y = 0;}
    
    if(x <=0){x=width;}
    else if(x >= width){x=0;}

    fill(#5D91FF);
    ellipse(x, y, 5, 10);
  }
}




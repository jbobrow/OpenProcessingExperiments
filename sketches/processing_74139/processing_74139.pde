
int bars = 36;
int rotation = 45;
int horizontal = 24;
int xrot = 0;

void setup()
{
  size(600, 600, P3D);
  smooth();
  strokeWeight(1);
  frameRate = 30;
}

void draw()
{
  rotateY(radians(rotation));
  rotateX(radians(xrot));
  background(50);
  translate(horizontal * -70, 550, 0);  
  
  int xOffset = 0;
  
  for(int p = 0; p < bars; p++)
  {
    colorMode(HSB, bars);
    fill(p, 120, 160);
    
    for(int i = 0; i < horizontal; i++)
    {
      box(120, 10, 120);
      translate(140, 0);
      xOffset += 140;
    }
    
    translate(xOffset * -1, -15, 0);
    xOffset = 0;
    
    colorMode(RGB, 256);
  }
}
  
  void keyPressed()
  {
    if(keyCode == UP)
    {
      if(bars < 72)
      {
        bars++;
      }
    }
    
    if(keyCode == DOWN)
    {
      if(keyCode > 0)
      {
        bars--;
      }
    }
    
    if(keyCode == LEFT)
    {
      rotation += 2; 
    }
    
    if(keyCode == RIGHT)
    {
      rotation -= 2;
    }
    
    if(key == '[')
    {
      if(horizontal > 1)
      {
        horizontal -= 2;
      }
    }
    
    if(key == ']')
    {
      if(horizontal < 100)
      {
        horizontal += 2;
      }
    }
    
    if(key == 'w')
    {
      xrot += 2;
    }
    
    if(key == 's')
    {
      xrot -= 2;
    }
    
    if(keyCode == CONTROL)
    {
      xrot = 0;
      rotation = 45;
      horizontal = 24;
      bars = 36;
    }
  }


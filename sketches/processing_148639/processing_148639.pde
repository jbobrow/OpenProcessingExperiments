
plane animation;

void setup()
{
  size(640,480);
  animation = new plane(width/2,30,2);
}

void draw()
{
  background(150,200,255);
  animation.render();
}

class plane
{
  int x;
  int y;
  int speed;
  
  plane(int tempX, int tempY, int tempSpeed)
  {
    x = tempX;
    y = tempY;
    speed = tempSpeed;
  }
  
  void render()
  {
    y += speed;
    noStroke();
    fill(150,150,150);
    ellipse(x+4,y+5,25,7);
    ellipse(x+4,y+25,55,15);
        
    fill(130,130,130);
    ellipse(x+4,y+40,7,10);
    rect(x,y,7,40);
    
    if(y > height)
    {
      y = -70;
    }
  }
}



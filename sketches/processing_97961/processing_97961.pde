
Paddle myPaddle;

void setup()
{
  size (400,400);
  myPaddle = new Paddle();
}

void draw()
{
  background(0);
  myPaddle.display();
  
}



class Paddle
{
  int xpos;
  int ypos;
  int w;
  int h;
  
  Paddle()
  {
    xpos = mouseX;
    ypos = 300;
    w = 100;
    h = 20;
    
  }
  
  void display()
  {
    fill (255, 178, 215);
    rect (mouseX,ypos,w,h);
    
  }
}



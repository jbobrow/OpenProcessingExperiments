
boolean pressed;


void setup()
{
  size(300,300);
  pressed = false;  
}

void draw()
{
  if(pressed)
  background(100,100,100);
  else
  background(200,200,200);
  
}

void keyTyped()
{
  pressed = false;
  
}

void keyReleased()
{
  pressed = true;
}


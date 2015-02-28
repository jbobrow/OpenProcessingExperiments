
float x = 300;
float y = 200;
float speed = random(1,10);
boolean color_change;

void setup()
{
  size(400,400);
}

void draw()
{
  background(0);
  ellipse(x,y,100,100);
  
  if ( x>= width && y <= height )
  {
    color_change = true;
    fill (54,252, 181);
    speed = speed * - 1;
  }
  else if (x < 0 && y < 0)
  {
    color_change = false;
    fill (252, 248, 122);
    speed = speed * - 1;
  }
  else
  { 
    color_change = false;
  }
  if ( x>= width && y <= height && keyPressed)
  {
    color_change = true;
    fill (252, 199, 228);
  }
  else if (x < 0 && y < 0 && keyPressed)
  {
    color_change = false;
    fill (199, 219, 252);
  }
  if (mousePressed)
  {
    rect(100,100,100,100);
    rect(200,200,100,100);
    rect(300,100,100,100);
    rect(0,200,100,100);
  }
   
    x = x + speed;
      y = y + speed;
}     



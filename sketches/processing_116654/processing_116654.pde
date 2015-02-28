
//KEYBOARD REEFERENCE
//http://www.openprocessing.org/sketch/114076


float x = 0;
float y = 0;
float speed = 3.0;
float left = 0;
float right = 0;

void setup()
{
  size(500, 500);
}
 
void draw()
{
  background(0);
  fill(100);
  x += (right - left) * speed;
  noStroke();
  ellipse(x + width/2, 400, 50, 50);

  
  fill(20);
  y += speed;
  rect(50, y, 25, 25);
  
  rect(100, y - 50, 25, 25);
  
  rect(150, y - 100, 25, 25);
  
  rect(200, y - 150, 25, 25);
  
  rect(250, y - 200, 25, 25);
  
  rect(300, y - 250, 25, 25);
  
  rect(350, y - 300, 25, 25);
  
  rect(400, y - 350, 25, 25);
  
  rect(450, y - 400, 25, 25);
}
 
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 0;
    }
    if (keyCode == RIGHT)
    {
      right = 0;
    }
  }
}
 
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 1;
    }
    if (keyCode == RIGHT)
    {
      right = 1;
    }
  }
}



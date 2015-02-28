
//colorful circles and square by nicole agcaoili
// 9/16/10

float x = 200;
float y = 200;
int presses = 0;

void setup()
{
  size(800, 600);
  noStroke();
  frameRate(500);
  background(49, 193, 91);
}

void draw()
{
  if (mousePressed == true)
  {
    if (presses > 1)
    {
      fill(random (mouseX), random (255), random(mouseY));
      rect (mouseX, mouseY, width/20, width/20);
    }
    else
    {
      fill(random (mouseX), random (255), random(mouseY));
      ellipse(mouseX, mouseY, width/20, width/20);
    }
  }
}

void mousePressed()
{
  if ( presses < 2 )
  {
    presses = presses +1;
  }
  else 
  {
    presses = presses -1;
  }
  
  println(presses);
}



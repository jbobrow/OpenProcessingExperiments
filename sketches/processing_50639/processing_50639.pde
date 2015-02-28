
// 48-257, bumyeolk_HW4
// Bumyeol Kim, Copyright 2012

float dia;

void setup( )
{
  size(400, 400);
  smooth();
  dia = 10;
}

void draw()
{
  
}

void keyPressed()
{
  //draw random circles
  if (keyPressed == true)
  {
    fill(random(255), random(200), random(198));
    noStroke();
    ellipse(random(400), random(400), dia, dia);
  }
  //enhance the size
  //use keyCode for arrow keys
  if (keyCode == UP)
  {
    dia = dia + 1;
  }
  //reduce the size
  if (keyCode == DOWN)
  {
    dia = dia - 1;
  } 
}

// click mouse buttons to change the background 
// or start a new drawing
void mouseClicked ()
{
  if (mouseButton == RIGHT)
  {
    background(random(255), random(255), random(255));
  }
  if (mouseButton == LEFT)
  {
    noFill();
    background(0, 0, 0);
    fill(#FAFF03);
    ellipse(200, 200, 200, 200);
    fill(#F0FFF3);
    ellipse(150, 150, 50, 50);
    ellipse(250, 150, 50, 50);
    strokeWeight(10);
    line(150, 250, 250, 250);
  }
}


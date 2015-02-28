
/* Press S to clear
   Press D to change color to orange
   Press F to change color to red
   Press G to change color to blue
   Press H to randomize color
   Click mouse for white
 
 */






boolean sPressed, dPressed, fPressed, gPressed, hPressed;


void setup()
{
  noStroke();
  size (1600, 1000);
  background (0);
  smooth();
}

void keyPressed()
{

  if (key == 's') sPressed = true;

  if (key == 'd') dPressed = true;

  if (key == 'f') fPressed = true;

  if (key == 'g') gPressed = true;

  if (key == 'h') hPressed = true;
}

void keyReleased ()
{
  if (key == 's')
  {
    sPressed = false;
  }

  if (key == 'd')
  {
    dPressed = false;
  }

  if (key == 'f')
  {
    fPressed = false;
  }

  if (key == 'g')
  {
    gPressed = false;
  }

  if (key == 'h');
  {
    hPressed = false;
  }
}


void draw()
{
  rect (mouseX, mouseY, random(75), random (75));
  if (mousePressed == true)
  {
    fill (255, 255, 255);
  }

  if (sPressed)
  {
    background(0);
  }

  if (dPressed)
  {
    fill (240, 120, 0);
  }

  if (fPressed)
  {
    fill (255, 0, 0);
  }


  if (gPressed)
  {
    fill (0, 0, 255);
  }

  if (hPressed)

  {
    fill (random (255), random (255), random (255));
  }
}



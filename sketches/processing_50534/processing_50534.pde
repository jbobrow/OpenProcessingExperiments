
//variables for ball movement
int ballX;
int ballY;

//controls sweeping of direction line
int xSweep; 
boolean dir;

//manages rounds
boolean swing;

PFont font;

void setup()
{
  size (300, 300);
  xSweep = 150;
  ballX = 150;
  ballY = 250;

  dir = true;
  swing = false;
}
void draw()
{ 
  shapes();

  sweep();
  if (hover(100, 280, 100, 25) && mousePressed)
  {
    roll();
  }

  if (hover(275, 275, 25, 25) && mousePressed)
  {
    cheat();
  }

  win();
}

void roll()
{
  swing = true;

  shapes();
  if (dir)
  {
    ballX = xSweep;
    xSweep++;
  }
  else
  {
    ballX = xSweep;
    xSweep--;
  }
  ballY--;
  swing = false;
}
void cheat()
{
  swing = true;

  shapes();
  ballY--;

  swing = false;
}
void sweep()
{
  if (!swing)
  {
    stroke(0,255,255);
    line(ballX, ballY +10, xSweep, ballY - 50); 
    stroke(0);

    if (xSweep < 200 && dir)
    {
      xSweep = xSweep + 1;
      if (xSweep == 200) 
      {
        dir = !dir;
      }
    }

    if (xSweep > 100 && !dir)
    {
      xSweep = xSweep - 1;
      if (xSweep == 100) 
      {
        dir = !dir;
      }
    }
  }
}

boolean hover(int x, int y, int w, int h)
{
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h)
  {
    return true;
  } 
  else
  {
    return false;
  }
}

void win()
{
  if (ballY < 50)
  {
    if (ballX > 125 && ballX < 160) 
    {
      //WIN
      xSweep = 150;
      ballX = 150;
      ballY = 250;
      dir = true;
      swing = false;
      fill(0);
      text("Good Job!", 100,150);
    }
    else 
    {
      //TRY AGAIN 
      xSweep = 150;
      ballX = 150;
      ballY = 250;
      dir = true;
      swing = false;
      fill(0);
      text("Try Again", 100,150);
    }
  }
}

void shapes()
{
  background(5,121,13);
  
  fill(255);
  rect(100, 280, 100, 25);
  fill(0);
  text("Hold to Swing", 105, 295);
  fill(0,0,255);
  ellipse(ballX, ballY, 20, 20);
  
  line(125, 80, 125, 50);
  line(125, 50, 160, 50);
  line(160, 50, 160, 80);

  fill(255, 0, 0);
  stroke(0);
}



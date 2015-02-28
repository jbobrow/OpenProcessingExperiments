
/* @pjs globalKeyEvents="true"; */ 
//human
int x=260;
int y=250;
int dir=UP;
//computer
int compx=240;
int compy=250;
int compdir=UP;



boolean gameover = false;
boolean compgameover = false;
void setup()
{
  size(500, 500);
  background(0);
  frameRate(30);
  noFill();
  stroke(255);
  strokeWeight(4);
  rect(0, 0, 500, 500);
}

void draw()
{
  strokeWeight(0);
  if (gameover == true)
  {
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("HUMANS ARE INFERIOR", 250, 250);
    textSize(15);
    text("Press r to play again.", 250, 290);
  }
  else computer();
  if (compgameover == true)
  {
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("YOU SURVIVED THIS TIME", 250, 250);
    textSize(15);
    text("Press r to play again.", 250, 290);
  }
  else human();
}

void keyPressed()
{
  if (key=='w')
  {
    dir=UP;
  }
  if (key=='a')
  {
    dir=LEFT;
  }
  if (key=='s')
  {
    dir=DOWN;
  }
  if (key=='d')
  {
    dir=RIGHT;
  }
  if (key=='r')
  {
    background(0);
  fill(0);
  stroke(255);
  strokeWeight(4);
  rect(0, 0, 500, 500);
  compx=240;
  compy=250;
  x=260;
  y=250;
  dir=UP;
  compdir=DOWN;
  gameover=false;
  compgameover=false;
  }
}

void human()
{
  if (get(x, y) != color(0))
  {
    gameover = true;
  }
  stroke(0, 100, 255);
  fill(0, 100, 255);
  rect(x, y, 3, 3);
  if (dir==RIGHT)
  {
    x=x+4;
  }
  if (dir==LEFT)
  {
    x=x-4;
  }
  if (dir==UP)
  {
    y=y-4;
  }
  if (dir==DOWN)
  {
    y=y+4;
  }
}

void computer()
{
  if (get(compx, compy) != color(0))
  {
    compgameover = true;
  }

  stroke(50, 255, 100);
  fill(50, 255, 100);
  rect(compx, compy, 3, 3);
  if (compdir==RIGHT)
  {
    compx=compx+4;
    if (get(compx+4, compy) != color(0))
    {
      compdir=UP;
    }
  }
  else if (compdir==LEFT)
  {
    compx=compx-4;
    if (get(compx-4, compy) != color(0))
    {
      compdir=DOWN;
    }
  }
  else if (compdir==UP)
  {
    compy=compy-4;
    if (get(compx, compy-4) != color(0))
    {
      compdir=LEFT;
    }
  }
  else if (compdir==DOWN)
  {
    compy=compy+4;
    if (get(compx, compy+4) != color(0))
    {
      compdir=RIGHT;
    }
  }
}

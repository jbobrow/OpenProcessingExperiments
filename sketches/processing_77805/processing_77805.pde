
//Grace O. C.P. Mods 11-12 Tron
int x=250;
int y=100;
int direction=DOWN;
int compx=250;
int compy=400;
int compdir=UP;
boolean gameOver = false;
boolean computerLost = false;
boolean humanLost = false;
void setup()
{
  size(500, 500);
  background(0);
  noFill();
  stroke(0, 255, 0);
  quad(1, 1, 1, 499, 499, 499, 499, 1);
  textSize(30);
  textAlign(CENTER);
}
void draw()
{
  if (gameOver == true)
  {
    text("Game over", 250, 250);
      if(humanLost == true)
    {
      text("human loses!", 250,300);
    }
    else if(computerLost == true)
    {
      text("computer loses!", 250,300);
    }
 
}
  
  else
  {
    human();
    computer();
  }
  if (mousePressed==true)
  {
    background(0);
    stroke(0, 255, 0);
    quad(1, 1, 1, 499, 499, 499, 499, 1);
    gameOver = false;
    x=250;
    y=100;
    compx=250;
    compy=400;
    compdir = UP;
    direction = DOWN;
    humanLost = false;
    computerLost = false;
  }
}
void human()
{
  frameRate=0.5;
  if (get(x, y)!=color(0))
  {
    gameOver = true;
    humanLost = true;
  }
  stroke(255);
  rect(x, y, 1, 1);
  if (direction == RIGHT)
  {
    x=x+2;
  }
  if (direction == LEFT)
  {
    x=x-2;
  }  
  if (direction == UP)
  {
    y=y-2;
  }  
  if (direction == DOWN)
  {
    y=y+2;
  }
}

void computer ()
{
  println(compdir);
  if (get(compx, compy)!=color(0))
  {
    gameOver = true;
    computerLost = true;
  }

  stroke(255, 0, 0);
  rect(compx, compy, 1, 1);
  if (compdir==LEFT)
  {
    compx=compx-2;
    if(get(compx-2,compy) != color(0))
    {
      compdir=DOWN;
    }
  }
  if (compdir==RIGHT)
  {
    compx=compx+2;
    if(get(compx+2,compy) != color(0))
    {
      compdir = UP;
    }
  }
  if (compdir==UP)
  {
    compy=compy-2;
    if(get(compx,compy-2) != color(0))
    {
      compdir =LEFT;
    }
  }
  if (compdir==DOWN)
  {
    compy=compy+2;
    if(get(compx,compy+2)!=color(0))
    {
      compdir=RIGHT;
    }
  }
}
void keyPressed()
{
  if (key=='w')
  {
    direction = UP;
  }
  if (key=='a')
  {
    direction=LEFT;
  }
  if (key =='s')
  {
    direction=DOWN;
  }
  if (key =='d')
  {
    direction=RIGHT;
  }
}

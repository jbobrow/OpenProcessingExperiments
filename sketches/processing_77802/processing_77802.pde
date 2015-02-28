
//Bozhong H. Tron CP1 Mods 14-15
int x = 140;
int y = 150;
int direction = DOWN;
int compX=150;
int compY=150;
int compDirection= DOWN;
boolean gameOver= false;
void setup()
{
  size(300, 300);
  background(0);
  stroke(255, 100, 100);
  noFill();
  rect(-1, -1, 301, 301); 
  frameRate(30);
}
void draw()
{
  if (gameOver==true)
  {
    textAlign(CENTER);
    textSize(25);
    fill(0,0,255);
    text("Game Over!", 150, 150);
  }
  else
  {
    human();
    computer();
    move();
  }
}
void human()
{
  if (get(x, y) != color(0))
  {
    textAlign(CENTER);
    textSize(25);
    fill(0,255,0);
    text("Computer Wins!", 150, 170);
    gameOver=true;
  }
  else
  {
    stroke(100,100,255);
    fill(100,100,255);
    rect(x, y, 5, 5);
    if (direction == RIGHT)
    {
      x=x+6;
    }
    else if (direction == LEFT)
    {
      x=x-6;
    }
    else if (direction == UP)
    {
      y=y-6;
    }
    else if (direction == DOWN)
    {
      y=y+6;
    }
  }
}

void move()
{
  if (keyPressed==true && key == 'a')
  {
    direction=LEFT;
  }
  else if (key=='d')
  {
    direction=RIGHT;
  }
  if (key == 'w')
  {
    direction=UP;
  }
  else if (key=='s')
  {
    direction=DOWN;
  }
}
void keyPressed()
{
  if(key==' ')
  {
  gameOver=false;
  background(0);
  noFill();
  rect(-1, -1, 301, 301);
  x=140;
  y=150;
  compX=150;
  compY=150;
  direction=DOWN;
  compDirection=DOWN;
  }
}
void computer()
{
  if (get(compX, compY) != color(0))
  {
    textAlign(CENTER);
    textSize(25);
    fill(255,0,123);
    text("Human Wins!", 150, 170);
    gameOver=true;
  }
  else
  {
    stroke(100,255,100);
    fill(100,255,100);
    rect(compX, compY,5,5);
    if (compDirection==LEFT)
    {
      compX-=6;
      if (get(compX-6, compY) != color(0))
      {
        compDirection=DOWN;
      }
    }
    else if (compDirection==RIGHT)
    {
      compX+=6;
      if (get(compX+6, compY) != color(0))
      {
        compDirection=UP;
      }
    }
    else if (compDirection==UP)
    {
      compY-=6;
      if (get(compX, compY-6) != color(0))
      {
        compDirection=LEFT;
      }
    }
    else if (compDirection==DOWN)
    {
      compY+=6;
      if (get(compX, compY+6) != color(0))
      {
        compDirection=RIGHT;
      }
    }
  }
}




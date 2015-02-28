
//Julie O, CompProg Mods 4/5, Tron Game
/* @pjs globalKeyEvents="true"; */

int x = 10;
int y = 250;
int hdirection = RIGHT;

int cx = 490;
int cy = 250;
int cdirection = LEFT;

boolean gameOver = false;

void setup()
{
  size(500,500);
  background(60,0,100); //(0);
  fill(255); //(255);
  smooth();
  frameRate(100);
  keyCode = RIGHT;
}

void draw()
{
  if(gameOver == true)
  {
    fill(255,0,0);
    textSize(64);
    textAlign(CENTER);
    text("GAME \n\nOVER!",250,175);
  }
  else
    {
      h();
      c();
    }
}

void h()
{
  if(get(x,y) != color(60,0,100)) //background: (60,0,100)
    {
      gameOver = true;
      fill(238,118,0);
      ellipse(250,250,100,100);
      fill(0,0,0);
      rect(225,225,10,25);
      rect(265,225,10,25);
      rect(225,270,50,10);
      fill(255,255,0);
      textSize(44);
      text("You Lost!",150,410);
    }
    if(x>500)
    {
      gameOver = true;
      fill(255,255,0);
      textSize(44);
      text("You Lost!",150,410);
    }
    if(y>500)
    {
      gameOver = true;
      fill(255,255,0);
      textSize(44);
      text("You Lost!",150,410);
    }
    if(x<0)
    {
      gameOver = true;
      fill(255,255,0);
      textSize(44);
      text("You Lost!",150,410);
    }
    if(y<0)
    {
      gameOver = true;
      fill(255,255,0);
      textSize(44);
      text("You Lost!",150,410);
    }
  else
  {
    stroke(127,255,0);
    point(x,y);
    if(keyCode == RIGHT)
    {
      hdirection = RIGHT;
      x++;
    }
    else if(keyCode == UP)
    {
      hdirection = UP;
      y--;
    }
    else if(keyCode == DOWN)
    {
      hdirection = DOWN;
      y++;
    }
    else if(keyCode == LEFT)
    {
      hdirection = LEFT;
      x--;
    }
  }
}
  
void c()
{
  if(get(cx,cy) != color(60,0,100)) //background: (60,0,100)
    {
      gameOver = true;
      fill(238,118,0);
      ellipse(250,250,100,100);
      fill(0,0,0);
      rect(225,225,10,25);
      rect(265,225,10,25);
      rect(225,270,50,10);
      fill(255,255,0);
      textSize(44);
      text("You Won!",150,410);
    }
    if(cx>500)
    {
      gameOver = true;
    }
    if(cy>500)
    {
      gameOver = true;
    }
    if(cx<0)
    {
      gameOver = true;
    }
    if(cy<0)
    {
      gameOver = true;
    }
  else
  {
    stroke(92,172,238);
    point(cx,cy);
    if(cdirection == LEFT)
    {
      cx--;
      if(get(cx-2,cy) != color(60,0,100))
      cdirection = DOWN;
    }
    else if(cdirection == RIGHT)
    {
      cx++;
      if(get(cx+2,cy) != color(60,0,100))
      cdirection = UP;
    }
    else if(cdirection == DOWN)
    {
      cy++;
      if(get(cx,cy+2) != color(60,0,100))
      cdirection = RIGHT;
    }
    else if(cdirection == UP)
    {
      cy--;
      if(get(cx,cy-2) != color(60,0,100))
      cdirection = LEFT;
    }
    if(cx>498)
    {
      cdirection = UP;
    }
    if(cx<2)
    {
      cdirection = DOWN;
    }
    if(cy>498)
    {
      cdirection = RIGHT;
    }
    if(cy<2)
    {
      cdirection = LEFT;
    }
  }
}


/* @pjs globalKeyEvents="true"; */
int x = 32;
int y = 120;
int dir = RIGHT;
int cx = 463;
int cy = 150; 
int cdir = LEFT;
boolean gameOver = false;
void setup()
{
  size(500,500);
  background(0);
  stroke(5,252,217);
  frameRate(45);
}
void draw()
{
   if(gameOver == true)
  {  
    //textSize(60);
    //text("GAME OVER",75,100);
    //fill(225,0,0);
    //ellipse(150,150,150,150);
  }
  if(gameOver == false)
  {
    human();
    comp();
 
  }
}
void keyPressed()
{
  if(key == 'w')
  {
     dir = UP; 
  }
  if(key == 's')
  {
    dir = DOWN;
  }
  if(key == 'a')
  {
    dir = LEFT;
  }
  if(key == 'd')
  {
    dir = RIGHT;
  }
  if(key == 'r')
  {
    x = 32;
    y = 120;
    dir = RIGHT;
    cx = 463;
    int cy = 150; 
    int cdir = LEFT;
    boolean gameOver = false;
    background(0);
  }
}
void human()
{
  if(get(x,y) != color(0))
    {
      gameOver = true;
      textSize(60);
      text("GAME OVER",75,100);
      text("HUMAN LOSS",60,300);
    }
    stroke(5,252,217);
    strokeWeight(2);
    point(x,y);
    if(dir == RIGHT)
    {
      x=x+2;
    }
    if(dir == LEFT)
    {
      x=x-2;
    }
    if(dir == DOWN)
    {
      y=y+2;
    }
    if(dir == UP)
    {
      y=y-2;
    }
}
void comp()
{
  if(get(cx,cy) != color(0))
    {
     gameOver = true;
     textSize(60);
     text("GAME OVER",75,100);
     text("COMPUTER LOSS",10,300);
    }
    
    stroke(255);
    strokeWeight(2);
    point(cx,cy);
    println(cx + ", " + cy);
    if(cdir == RIGHT)
    {
      cx=cx+2;
      if(get(cx+2,cy) != color(0) && get(cx,cy-2) != color(0))
      {
        cdir = DOWN;
      }
      else if(get(cx+2,cy) != color(0) && get(cx,cy+2) != color(0))
      {
        cdir = UP;
      }
      else if(get(cx+2,cy) != color(0))
      {
        if(random(0,1)>.5)
        {
          cdir = UP;
        }
        else
        {
          cdir = DOWN;
        }
        
      }
    }
   else if(cdir == LEFT)
    {
      cx=cx-2;
      if(get(cx-2,cy) != color(0) && get(cx,cy+2) != color (0))
      {
        cdir = UP;
      }
      else if(get(cx-2,cy) != color(0) && get(cx,cy-2) != color (0))
      {
        cdir = DOWN;
      }
      else if(get(cx-2,cy) != color(0))
      {
        if(random(0,1)>.5)
        {
          cdir = UP;
        }
        else
        {
          cdir = DOWN;
        }
      }
    
    }
    else if(cdir == DOWN)
    {
      cy=cy+2;
      if(get(cx,cy+2) != color(0) && get(cx-2,cy) != color(0))
      {
        cdir = RIGHT;
      }
      else if(get(cx,cy+2) != color(0) && get(cx+2,cy) != color(0))
      {
        cdir = LEFT;
      }
      else if(get(cx,cy+2) != color(0))
      {
        if(random(0,1)>.5)
        {
          cdir = LEFT;
        }
        else
        {
          cdir = RIGHT;
        }
      }
    }
    else if(cdir == UP)
    {
      cy=cy-2;
      if(get(cx,cy-2) != color(0) && get(cx-2,cy) != color(0))
      {
        cdir = RIGHT;
      }
      else if(get(cx,cy-2) != color(0) && get(cx+2,cy) != color(0))
      {
        cdir = LEFT;
      }
      else if(get(cx,cy-2) != color(0))
      {
        if(random(0,1)>.5)
        {
          cdir = LEFT;
        }
        else
        {
          cdir = RIGHT;
        }
      }
    }  
}

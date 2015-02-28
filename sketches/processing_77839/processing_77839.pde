
//Will Slotterback CP1 16-17 TRON
int dir=RIGHT; //player starts going right
int x = 50;
int y = 400;
int compdir=LEFT; //computer starts going left
int compx = 750;
int compy = 400;
boolean gameOver = false; //keeps track of whether game is over or not
boolean click = false;
PImage img;

void setup()
{
  size(800, 800);
  background(0);
  frameRate(100);
  //code for the menu screen below
  noFill();
  stroke(255);
  rect(345, 370, 115, 50);
  rect(350, 375, 105, 40);
  //for the title
  img = loadImage("Tron.logo.2.112409-580px.jpg");
  image(img, 100, 50);
  // end of title
  fill(255);
  textSize(11);
  text("click here to start", 355,400);
}


void draw()
{
  if (mousePressed==true && mouseX>=350 && mouseX<=450 && mouseY<=425 &&mouseY;>=375)
  {
    if (click==false)
    {
      background(0);
      click=true;
    }
  }
  if (gameOver==true) 
  {
    fill(255);
    textSize(15);
    textAlign(CENTER);
    text("GAME OVER: Press the mouse to restart.", 400, 200);
  }
  else //can only play if game is not over
  {
    if (click==true)
    {
      human();
      comp();
    }
  }
}


void human()
{
  if (get(x, y) !=color(0))
  {
    gameOver= true;
  }
  stroke(245, 10, 10);
  point (x, y);
  if ( dir==RIGHT)
  {
    if(x>798)
    {
      x=-2;
      x++;
    }
    x++;
  }
  if (dir==LEFT)
  {
    if(x<1)
    {
      x=801;
      x--;
    }
    x--;
  }
  if (dir==UP)
  {
    if(y<1)
    {
      y=801;
      y--;
    }
    y--;
  }
  if (dir==DOWN)
  {
    if(y>798)
    {
      y=-2;
      y++;
    }
    y++;
  }
}


void keyPressed()// controls for the player
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
}


void comp()
{
  {
    if (get(compx, compy) !=color(0)) // to check if computer player has crashed
    {
      gameOver= true;
    }

    stroke(70, 162, 240);
    point (compx, compy);

    if (compdir==RIGHT)//computer is going right
    {
      compx++;
      if (get(compx+1, compy) !=color(0))//check one space right for line
      {
        if (get(compx, compy+1) ==color(0))//check one space down for opening
        {
          compdir = DOWN;
        }
      }
      if (get(compx, compy+1)!=color(0) &&get;(compx+1, compy) !=color(0))//if space down is blocked and space right go up
      {
        compdir = UP;
      }
    }
    if (compdir==LEFT)//computer is going left
    {
      compx--;
      if (get(compx-1, compy) !=color(0))//check one space left for line
      {
        if (get(compx, compy-1) ==color(0))//check one space up for opening
        {
          compdir = UP;
        }
      }
      if (get(compx-1, compy)!=color(0) &&get;(compx, compy-1) !=color(0))//if space left is blocked and space up go down
      {
        compdir = DOWN;
      }
    }
    if (compdir==UP)//computer is going up
    {
      compy--;
      if (get(compx, compy-1) !=color(0))//check one space up for line
      {
        if (get(compx-1, compy) ==color(0))//check one space left for opening
        {
          compdir = LEFT;
        }
      }
      if (get(compx-1, compy)!=color(0) &&get;(compx, compy-1) !=color(0))//if space left is blocked and space up go right
      {
        compdir = RIGHT;
      }
    }
    if (compdir==DOWN)//computer is going down
    {
      compy++;
      if (get(compx, compy+1) !=color(0))//check one space down for line
      {
        if (get(compx+1, compy) ==color(0))//check one space right for opening
        {
          compdir = RIGHT;
        }
      }
      if (get(compx+1, compy)!=color(0) &&get;(compx, compy+1) !=color(0))//if space right is blocked and space down go left
      {
        compdir = LEFT;
      }
    }
  }
}
void mousePressed() //for restarting the game
{
  if ( gameOver==true && mousePressed==true)
  {
    background(0);
    x=50;
    y=400;
    compx=750;
    compy=400;
    compdir=LEFT;
    dir=RIGHT;
    gameOver= false;
  }
}

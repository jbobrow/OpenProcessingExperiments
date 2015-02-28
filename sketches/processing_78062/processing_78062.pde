
//Montana Cruz, CP1 4/5

//crashes
int x=240;
int y=250;
int c=250;
int d=250;
int e=1;
int a=UP;
int b=UP;

//colors
int l=0;
int m=0;
int n=0;

//computer
int computer=250;
int compd=250;
int compb=UP;

//extras
boolean Gameover=false;
int z=0;

//

void setup()
{
  size(500, 500);
  background(0);
  if (z==0)
  {
    draw();
  }
}
void draw ()
{
  if (z==0)
  {
    textAlign(CENTER);
    textSize(175);
    text("TRON", 250, 175);

    textSize(25);
    fill(255);
    text("For 2 Players Hit 2", 250, 300);
    text("To Play the Computer Hit 3", 250, 325);
    fill (255);
    text("Loser Mode - PRESS 1", 250, 400);
  }
  stroke(255, 0, 0);
  l=int(random(255));
  m=int(random(255));
  n=int(random(255));
  fill(l, m, n);
  frameRate(120);

  if (get(x, y) != color(0, 0, 0))
  {
    a=5;
  }
  if (get(c, d) != color(0, 0, 0))
  {
    b=5;
  }
  if (z==1)
  {
    playerVsPlayer();
  }
  if (z==2)
  {
    computerVsPlayer();
  }
  if (z==5)
  {
    singlePlayer();
  }
}
void gameOver()
{
  noFill();
  stroke(255, 0, 0);
  rect(0, 0, 499, 499);
  if (Gameover==false)
  {
    singlePlayer();
  }
  if (Gameover==false)
  {
    computerVsPlayer();
  }
  if (keyPressed == true && key == 'r')
  {
    background (0);
    Gameover=false;
  }
}

void singlePlayer()

{
  if (get(x, y) != color (0))
  {
    Gameover=true;
    background(255);
    fill(0);
    textSize(24);
    text("YOU LOST IN LOSER MODE. CONGRATS.", 250, 250);
    text("Press 'r' to restart the game", 250, 275);
      if (keyPressed == true && key == 'r')
  {
    background (0);
    Gameover=false;
  }
  }

  while (e<2)

  {
    e++;
    background(0);
  }
  stroke(247, 122, 0);
  point (x, y);
  if (a==RIGHT)
  {
    x++;
  }
  if (a==LEFT)
  {
    x--;
  }
  if (a==UP)
  {
    y--;
  }
  if (a==DOWN)
  {
    y++;
  }
}
void playerVsPlayer()
{
  while (e<2)
  {
    e++;
    background(0);
  }
  stroke(247, 122, 0);
  point (x, y);
  stroke(7, 240, 63);
  point (c, d);
  if (a==RIGHT)
  {
    x++;
  }
  if (a==LEFT)
  {
    x--;
  }
  if (a==UP)
  {
    y--;
  }
  if (a==DOWN)
  {
    y++;
  }
  if (b==RIGHT)
  {
    c++;
  }
  if (b==LEFT)
  {
    c--;
  }
  if (b==UP)
  {
    d--;
  }
  if (b==DOWN)
  {
    d++;
  }
}
void computerVsPlayer()
{

  while (e<2)
  {
    e++;
    background(0);
  }
  stroke(247, 122, 0);
  point (x, y);
  //  }
  if (a==RIGHT)
  {
    x++;
  }
  if (a==LEFT)
  {
    x--;
  }
  if (a==UP)
  {
    y--;
  }
  if (a==DOWN)
  {
    y++;
  }
  stroke(7, 240, 63);
  point (computer, compd);
  if (compb==RIGHT)
  {
    computer++;
    if (get(computer+2, compd) !=color(0, 0, 0))
    {
      compb=DOWN;
    }
  }
  if (compb==LEFT)
  {
    computer--;
    if (get(computer-2, compd) !=color(0, 0, 0))
    {
      compb=UP;
    }
  }
  if (compb==UP)
  {
    compd--;
    if (get(computer, compd-2) !=color(0, 0, 0))
    {
      compb=RIGHT;
    }
  }
  if (compb==DOWN)
  {
    compd++;
    if (get(computer, compd+2) !=color(0, 0, 0))
    {
      compb=LEFT;
    }
  }
}



void keyPressed()
{

  if (key == 'w')
  {
    a=UP;
  }
  if (key == 'a')
  {
    a=LEFT;
  }
  if (key == 's')
  {
    a=DOWN;
  }
  if (key == 'd')
  {
    a=RIGHT;
  }
  if (key == 'i')
  {
    b=UP;
  }
  if (key == 'j')
  {
    b=LEFT;
  }
  if (key == 'k')
  {
    b=DOWN;
  }
  if (key == 'l')
  {
    b=RIGHT;
  }


  if (key== '2')
  {
    z=1;
  }
  if (key =='3')
  {
    z=2;
  }
  if (key =='1')
  {
    z=5;
  }
}

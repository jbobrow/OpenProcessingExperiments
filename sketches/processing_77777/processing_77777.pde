
//Eli Newbrun-Mintz, CP1 4-5, TRON
int x=400;
int y=250;
int cx=100;
int cy=250;
int cdir=RIGHT;
int dir=LEFT;
boolean gameOver=false;
void setup()
{
  size(500, 500);
  background(0);
  frameRate(100);
  stroke(255, 255, 255);
}

void draw()
{

  if (gameOver==false)
  {
    human();
    computer();
  }
}

void human()
{
  stroke(0, 255, 0);
  point(x, y);

  if (dir==RIGHT)
  {
    x++;
  }
  else if (dir==LEFT)
  {
    x--;
  }
  else if (dir==DOWN)
  {
    y++;
  }
  else if (dir==UP)
  {
    y--;
  }
}

void keyPressed()
{
  if (key=='w')
  {
    dir=UP;
  }
  else if (key=='d')
  {
    dir=RIGHT;
  }
  else if (key=='s')
  {
    dir=DOWN;
  }
  else if (key=='a')
  {
    dir=LEFT;
  }


  if (keyCode==ENTER)
  {
    gameOver=false;
    background(0, 0, 0);
    x=400;
    y=250;
    cx=100;
    cy=250;
    cdir=RIGHT;
    dir=LEFT;
  }
}


void computer()
{
  stroke(245, 129, 129);
  point(cx, cy);

  if (cdir==RIGHT)
  {
    cx++;
    if (get(cx+2, cy) !=color(0, 0, 0))
    {
      cdir=UP;
    }
  }

  else if (cdir==LEFT)
  {
    cx--;
    if (get(cx-2, cy) !=color(0, 0, 0))
    {
      cdir=DOWN;
    }
  }

  else if (cdir==UP)
  {
    cy--;
    if (get(cx, cy-2) !=color(0, 0, 0))
    {
      cdir=LEFT;
    }
  }

  else if (cdir==DOWN)
  {
    cy++;
    if (get(cx, cy+2) !=color(0, 0, 0))
    {
      cdir=RIGHT;
    }
  }
  if (gameOver==true)
  {
    cdir=0;
    dir=0;
    textSize(30);
    fill(49, 131, 55);
    text("GAME OVER", 255, 400);
  }


  if (get(cx, cy) !=color(0, 0, 0))
  {

    noStroke();
    fill(255, 0, 0);
    ellipse(cx, cy, 50, 50);
    textSize(50);
    fill(232, 129, 49);
    smooth();
    textAlign(CENTER);
    text("KA-BOOM!!!!", 250, 250);
    gameOver=true;
    textSize(20);
    fill(49, 131, 55);
    text("Human Wins!", 255, 300);
  }

  else if (get(x, y) !=color(0, 0, 0))
  {
    dir=0;
    noStroke();
    fill(255, 0, 0);
    ellipse(x, y, 50, 50);
    textSize(50);
    fill(232, 129, 49);
    smooth();
    textAlign(CENTER);
    text("KA-BOOM!!!!", 250, 250);
    gameOver=true;
    textSize(20);
    fill(49, 131, 55);
    text("Computer Wins :-(", 255, 300);
  }
}

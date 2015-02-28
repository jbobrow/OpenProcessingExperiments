
int x=250;
int y=250;
int compX=300;
int compY=250;
int direction=UP;
int compDir=UP;
int compX1=200;
int compY1=250;
int compDir1=UP;
boolean game=false;
boolean game1=false;
boolean gameover= false;
void setup()
{
  size(500, 500);
  background(0);
}
void draw()
{
  fill(255, 0, 0);
  if (get(compX, compY)!= color(0))
  {
    game= true;
  }
  if (get(compX1, compY1)!=color(0))
  {
    game1=true;
  }
  if (game==true && game1==true)
  {
    textSize(50);
    textAlign(CENTER);
    text("You Won!", 250, 250);
    gameover=true;
  }
  if (get(x, y) != color(0))
  { 
    textSize(50);
    textAlign(CENTER);
    text("You Lost...punk!", 250, 250);
    gameover=true;
  }
    if (gameover==false)
    {
      human();
    computer();
    computer1();
  }
}
void human()
{
  stroke(255, 0, 0);
  point(x, y);
  if (direction== RIGHT)
  {
    x++;
  }
  if (direction== LEFT)
  {
    x--;
  }
  if (direction==UP)
  {
    y--;
  }
  if (direction== DOWN)
  {
    y++;
  }
}
void computer()
{
  stroke(0, 255, 255);
  point(compX, compY);
  if (compDir==UP)
  {
    compY--;
    if (get(compX, compY-1) !=color(0, 0, 0))
    {
      compDir= RIGHT;
    }
  }
  else if (compDir== RIGHT)
  {
    compX++;
    if (get(compX+1, compY) !=color(0, 0, 0))
    {
      compDir=DOWN;
    }
  }
  else if (compDir==DOWN)
  {
    compY++;
    if (get(compX, compY+1) !=color(0, 0, 0))
    {
      compDir=LEFT;
    }
  }
  else if (compDir== LEFT)
  {
    compX--;
    if (get(compX-1, compY) !=color(0, 0, 0))
    {
      compDir=UP;
    }
  }
}
void computer1()
{
  stroke(0, 255, 255);
  point(compX1, compY1);
  if (compDir1==UP)
  {
    compY1--;
    if (get(compX1, compY1-1) !=color(0, 0, 0))
    {
      compDir1= RIGHT;
    }
  }
  else if (compDir1== RIGHT)
  {
    compX1++;
    if (get(compX1+1, compY1) !=color(0, 0, 0))
    {
      compDir1=DOWN;
    }
  }
  else if (compDir1==DOWN)
  {
    compY1++;
    if (get(compX1, compY1+1) !=color(0, 0, 0))
    {
      compDir1=LEFT;
    }
  }
  else if (compDir1== LEFT)
  {
    compX1--;
    if (get(compX1-1, compY1) !=color(0, 0, 0))
    {
      compDir1=UP;
    }
  }
}
void keyPressed()
{
  if (key=='w')
  {
    direction=UP;
  }
  if (key=='s')
  {
    direction=DOWN;
  }
  if (key=='a')
  {
    direction=LEFT;
  }
  if (key=='d')
  {
    direction=RIGHT;
  }
}
void mousePressed()
{
  if (mouseButton==LEFT)
  { 
    fill(0);
    noStroke();
    rect(0, 0, 600, 600);
    x=250;
    y=250;
    compX=300;
    compY=250;
    direction=UP;
    compDir=UP;
    compX1=200;
    compY1=250;
    compDir1=UP;
    game1=false;
    game=false;
    gameover=false;
  }
}



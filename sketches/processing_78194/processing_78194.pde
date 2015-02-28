
// Lucky Lui computer prog 1 mods 14-15

int x=350;
int y=400;
int compx=450;
int compy=400;
int direction=UP;
int compDirection=UP;
boolean gameOver=false;

void setup()
{
  size(800, 800);
  background(0);
  frameRate(40);
}
void draw()
{
  noFill();
  stroke(255);
  strokeWeight(3);
  rect(100, 100, 100, 100);
  rect(100, 600, 100, 100);
  rect(600, 100, 100, 100);
  rect(600, 600, 100, 100);
  rect(0, 0, 800, 800);
  rect(10, 10, 780, 780);
  
  if (gameOver==false)
  {
  human();
  computer();
  }
}


void human()
{


  if (get(x, y) != color(0))
  {
    gameOver=true;
  }

  fill(50, 128, 227);
  stroke(50, 128, 227);
  strokeWeight(3);
  point(x, y);

  if (gameOver==true)
  {
    fill(255);
    textSize(100);
    text ("You Lose", 150, 400);
  }


  //up
  else if (direction==UP)

  {
    y-=3;
  }

  //down
  else if (direction==LEFT)
  {
    x-=3;
  }

  //right
  else if (direction==RIGHT)
  {
    x+=3;
  }

  //downn
  else if (direction==DOWN)
  {
    y+=3;
  }
}


void keyPressed()
{
  if ( key=='a')
  {
    direction=LEFT;
  }
  if (key=='d')
  {
    direction=RIGHT;
  }
  if (key=='w')
  {
    direction=UP;
  }
  if (key=='s')
  {
    direction=DOWN;
  }
}

void computer()
{
  if (get (compx, compy) != color(0))
  {
    gameOver=true;
    textSize(100);
    fill(255);
    text("You Win",150,400);
  }
//  if (gameOver==true)
//  {
//    textSize(100);
//    fill(255);
//    text("You Win",150,400);
//  }
else
{
  fill(16, 232, 82);
  stroke(16, 232, 82);
  strokeWeight(3);
  point(compx, compy);

  if (compDirection==UP)
  {
    compy=compy-3;
 
  if (get(compx, compy-3) != color(0))
  {
    compDirection=RIGHT;
  }
  }
  else  if (compDirection==RIGHT)
  {
    compx=compx+3;
  if (get(compx+3, compy) != color(0))
  {
    compDirection=DOWN;
  }
  }
  else if (compDirection==LEFT)
  {
    compx=compx-3;
  if (get(compx-3, compy) != color(0))
  {
    compDirection=UP;
  }
  }
  else if (compDirection==DOWN)
  {
    compy=compy+3;

  if (get(compx,compy+3) != color(0))
  {
    compDirection=LEFT;
  }
  }
}
}


// Wendy Chuyi Liu, Tron, Mods 16/17
// http://besttoshow.webs.com/


int direction = RIGHT;
int x = 50;
int y = 150;
int comX = 200;
int comY = 250;
int compDir = LEFT;
boolean gameOver = false;
void setup()
{
  size (500, 500);
  background(0);
  strokeWeight(10);
  stroke(39, 67, 203);
  fill(0);
  rect(0, 0, 500, 500);
  stroke(39, 203, 89);
  fill(0);
  rect(10, 10, 480, 480);
}


void human()
{
  strokeWeight(1);
  stroke(35, 54, 216);


  if (get(x, y)!= color(0, 0, 0))
  {
    gameOver = true;
 
    fill (180, 130, 53);
    ellipse(250, 250, 200, 200);
    fill(180, 53, 180);
    textSize(50);
    text ("GAME OVER", 100, 250);
  }

  else if (gameOver == false)

  {

    stroke(35, 54, 216);
    point(x, y);

    if (direction == RIGHT)
    {
      x ++;
    }
    else if ( direction == LEFT)
    {
      x --;
    }
    else if ( direction == DOWN)
    {
      y ++;
    }
    else if ( direction == UP)
    {
      y --;
    }
  }
}


void keyPressed()
{
  if (key == 'a')
  {
    direction = LEFT;
  }
  else if ( key == 'd')
  {
    direction = RIGHT;
  }
  else if ( key == 'w')
  {
    direction = UP;
  }
  else if ( key == 's')
  {
    direction = DOWN;
  }
}

void comp()
{
  strokeWeight(1);
  stroke(53, 234, 52);
  if ( get(comX, comY)!= color(0, 0, 0))
  {
    gameOver = true;

    fill (180, 130, 53);
    ellipse(250, 250, 200, 200);
    fill(180, 53, 180);
    textSize(50);
    text ("WINNER", 100, 250);
  }
  stroke(255,255,0);
  point(comX, comY);

  if (compDir == RIGHT)
  {
    comX ++;
    if (get(comX +3, comY)!= color(0, 0, 0))
    {
      compDir = UP;
    }
  }
  else if ( compDir == LEFT)
  {
    comX --;
    if (get(comX -3, comY)!= color(0, 0, 0))
    {
      compDir = DOWN;
    }
  }
  else if ( compDir == UP)
  {
    comY --;
    if (get (comX, comY -3) != color(0, 0, 0))
    {
      compDir = LEFT;
    }
  }
  else if ( compDir == DOWN)
  {
    comY ++;
    if ( get (comX, comY +3)!= color(0, 0, 0))
    {
      compDir = RIGHT;
    }
  }
}

void draw()
{
  if (gameOver == false)
  {
    human();
  }
  if (gameOver == false)
  {
    comp();
  }
}

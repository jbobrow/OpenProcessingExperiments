
//Keana Moezzi, CP1, mods 4-5, Tron

int x = 10;
int y = 250; 
int direction = RIGHT;
int compX = 490;
int compY = 250;
int compDir = LEFT;
boolean gameOver = false;
void setup()
{
  size(500, 500);
  background(0);
}
void draw()
{
  if (gameOver == true)
  {  
    
    smooth();
    fill(255, 0, 0);   
    textSize(25);
    text ("Game Over", 180, 190);
   
  }
  else
  {
    human();
    if (gameOver == false)
    {
      computer();
    }
  }
}
void keyPressed()
{ 
  if (key == 'f')
  {
    direction = LEFT;
  }
  else if (key == 'h')
  {
    direction = RIGHT;
  }
  else if (key == 't')
  {
    direction = UP;
  }
  else if (key == 'g')
  {
    direction = DOWN;
  }
 else if (key == 'c')
  {
    background(0);
    x = 10;
    y = 250; 
    direction = RIGHT;
    compX = 490;
    compY = 250;
    compDir = LEFT;
    gameOver = false;
  }
}



void human()
{
 if (get(x, y) != color(0))
  {
        fill(255);
        textSize(20);
       text("  Human Loses!\n Computer Wins!", 170, 220);
      gameOver = true;
  }

  stroke(255, 255, 255);
  point(x, y);




  if (direction == RIGHT)
  {
    x++;
  }
  else if (direction == LEFT)
  {
    x--;
  }
  else if (direction == UP)
  {
    y--;
  }
  else if (direction == DOWN)
  {
    y++;
  }
}



void computer()
{

if (get(compX, compY) != color(0))
  {
        fill(255);
        textSize(20);
       text("Computer Loses!\n  Human Wins!", 170, 220);
        gameOver = true;
  }
  stroke(255, 0, 0);
  point(compX, compY);
  println(compX);
  if (compDir == RIGHT)
  {
    compX++;
    if (get(compX+1, compY) != color(0, 0, 0))
    {
      compDir = UP;
    }
  }
  else if (compDir == LEFT)
  {
    compX--;
    if (get(compX-1, compY) != color(0, 0, 0))
    {
      compDir = DOWN;
    }
  }
  else if (compDir == UP)
  {
    compY--;
    if (get(compX, compY-1) != color(0, 0, 0))
    {
      compDir = RIGHT;
    }
  }
  else if (compDir == DOWN)
  {
    compY++;
    if (get(compX, compY+1) != color(0, 0, 0))
    {
      compDir = LEFT;
    }
  }
}

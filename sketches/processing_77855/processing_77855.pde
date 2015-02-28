
//Eric Trinh, Tron, CP1 mods 16-17

int lineX = 0;
int lineY = 0;
int x = 150;
int y = 225;
int direction = RIGHT;
int compX = 300;
int compY = 225;
int compDirection = LEFT;
boolean gameOver = false;
void setup()
{
  size(400, 400);
  background(0);
  smooth();
}
void draw()
{
  tronBackground();
  keyPressed();
  if (get(x, y) != color(0, 0, 0) && get(x, y) != color(255, 247, 82))
  {
    fill(201, 41, 41);
    textAlign(CENTER);
    textSize(30);
    text("GG! HUE HUE HUE!", 200, 200);
    gameOver = true;
  }
  else
  {
    if (gameOver == false)
    {
      human();
    }
    if (gameOver == false)
    {
      computer();
    }
  }
}
void human()
{
  stroke(21, 40, 234);
  point(x, y);
  if (direction == LEFT)
  {
    x--;
  }
  else if (direction == RIGHT)
  {
    x++;
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
  if (get(compX, compY) != color(0, 0, 0) && get(compX, compY) != color(255, 247, 82))
  {
    fill(201, 41, 41);
    textAlign(CENTER);
    textSize(30);
    text("GG! HUE HUE HUE!", 200, 200);
    gameOver = true;
  }
  stroke(56, 222, 43);
  point(compX, compY);
  if (compDirection == LEFT)
  {
    compX--;
    if (get(compX-1, compY) != color(0, 0, 0) && get(compX-1, compY) != color(255, 247, 82))
    {
      compDirection = UP;
    }
  }
  else if (compDirection == RIGHT)
  {
    compX++;
    if (get(compX+1, compY) != color(0, 0, 0) && get(compX+1, compY) != color(255, 247, 82))
    {
      compDirection = DOWN;
    }
  }
  else if (compDirection == UP)
  {
    compY--;
    if (get(compX, compY-1) != color(0, 0, 0) && get(compX, compY-1) != color(255, 247, 82))
    {
      compDirection = RIGHT;
    }
  }
  else if (compDirection == DOWN)
  {
    compY++;
    if (get(compX, compY+1) != color(0, 0, 0) && get(compX, compY+1) != color(255, 247, 82))
    {
      compDirection = LEFT;
    }
  }
}
void tronBackground()
{
  while (lineX < 401)
  {
    stroke(255, 247, 82);
    line(lineX, 0, lineX, 400);
    lineX+=40;
  }
  while (lineY < 401)
  {
    stroke(255, 247, 82);
    line(0, lineY, 400, lineY);
    lineY+=40;
  }
}
void keyPressed()
{
  if (keyPressed == true && key == 'w')
  {
    direction = UP;
  }
  else if (key == 's')
  {
    direction = DOWN;
  }
  else if (key == 'a')
  {
    direction = LEFT;
  }
  else if (key == 'd')
  {
    direction = RIGHT;
  }
}

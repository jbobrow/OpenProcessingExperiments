
//Eric K, CP1 mods 4-5, Tron
//url: http://ericsprogrammingsite.webs.com/Tron.html

/* @pjs globalKeyEvents="true"; */

boolean gameStarted = false;
boolean gameOver = false;
int mode = 0;
int x;
int y;
int dir;
int score;
int x2;
int y2;
int dir2;
int compX;
int compY;
int compDir;
boolean comp1Crashed = false;
int comp2X;
int comp2Y;
int comp2Dir;
boolean comp2Crashed = false;
int crowdedness = 2;
void setup()
{
  size(500, 500);
  background(0);
  textSize(50);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  frameRate(100);
}
void draw()
{
  if (gameStarted)
  {
    if (mode == 0)
    {
      if (!gameOver)
      {
        computer();
      }
      if (!gameOver)
      {
        human();
      }
    }
    if (mode == 1)
    {
      if (!gameOver)
      {
        human();
      }
      if (!gameOver)
      {
        human2();
      }
    }
    if (mode == 2)
    {
      if (!gameOver)
      {
        if (!comp1Crashed)
        {
          computer();
        }
        if (!comp2Crashed)
        {
          computer2();
        }
        if (comp1Crashed && comp2Crashed)
        {
          gameOver = true;
          fill(255, 255, 255, 191);
          textSize(50);
          text("You Win.", 250, 100);
          textSize(20);
          text("Press the spacebar to play again.\nPress \"m\" to return to the menu.", 250, 300);
        }
        else
        {
          human();
        }
      }
    }
    if (mode == 3)
    {
      if (!gameOver)
      {
        human();
        score++;
      }
    }
  }
  else
  {
    menu();
  }
}
void human()
{
  if (get(x, y) != color(0))
  {
    gameOver = true;
    fill(255, 255, 255, 191);
    textSize(50);
    if (mode == 0 || mode == 2)
    {
      text("You Lose.", 250, 100);
    }
    if (mode == 1)
    {
      text("Player 2 Wins.", 250, 100);
    }
    if (mode == 3)
    {
      text("Game Over.\nScore: " + score, 250, 100);
    }
    textSize(20);
    text("Press the spacebar to play again.\nPress \"m\" to return to the menu.", 250, 300);
  }
  stroke(255, 0, 255);
  point(x, y);
  if (dir == RIGHT)
  {
    x++;
  }
  else if (dir == LEFT)
  {
    x--;
  }
  else if (dir == UP)
  {
    y--;
  }
  else if (dir == DOWN)
  {
    y++;
  }
}
void human2()
{
  if (get(x2, y2) != color(0))
  {
    gameOver = true;
    fill(255, 255, 255, 191);
    textSize(50);
    text("Player 1 Wins.", 250, 100);
    textSize(20);
    text("Press the spacebar to play again.\nPress \"m\" to return to the menu.", 250, 300);
  }
  stroke(0, 255, 255);
  point(x2, y2);
  if (dir2 == RIGHT)
  {
    x2++;
  }
  else if (dir2 == LEFT)
  {
    x2--;
  }
  else if (dir2 == UP)
  {
    y2--;
  }
  else if (dir2 == DOWN)
  {
    y2++;
  }
}
void computer()
{
  if (get(compX, compY) != color(0, 0, 0))
  {
    if (mode == 0)
    {
      gameOver = true;
      fill(255, 255, 255, 191);
      textSize(50);
      text("You Win.", 250, 100);
      textSize(20);
      text("Press the spacebar to play again.\nPress \"m\" to return to the menu.", 250, 300);
    }
    if (mode == 2)
    {
      comp1Crashed = true;
    }
  }
  stroke(0, 255, 255);
  point(compX, compY);
  if (compDir == LEFT)
  {
    compX--;
    if (get(compX-2, compY) != color(0, 0, 0))
    {
      yTurn();
    }
  }
  else if (compDir == DOWN)
  {
    compY++;
    if (get(compX, compY+2) != color(0, 0, 0))
    {
      xTurn();
    }
  }
  else if (compDir == RIGHT)
  {
    compX++;
    if (get(compX+2, compY) != color(0, 0, 0))
    {
      yTurn();
    }
  }
  else if (compDir == UP)
  {
    compY--;
    if (get(compX, compY-2) != color(0, 0, 0))
    {
      xTurn();
    }
  }
}
void xTurn()
{
  if (get(compX-1, compY) != color(0, 0, 0))
  {
    compDir = RIGHT;
  }
  else if (get(compX+1, compY) != color(0, 0, 0))
  {
    compDir = LEFT;
  }
  else if (get(compX-2, compY) != color(0, 0, 0))
  {
    compDir = RIGHT;
  }  
  else if (get(compX+2, compY) != color(0, 0, 0))
  {
    compDir = LEFT;
  }
  else if (int(random(2)) == 0)
  {
    compDir = RIGHT;
  }
  else
  {
    compDir = LEFT;
  }
}
void yTurn()
{
  if (get(compX, compY-1) != color(0, 0, 0))
  {
    compDir = DOWN;
  }
  else if (get(compX, compY+1) != color(0, 0, 0))
  {
    compDir = UP;
  }
  else if (get(compX, compY-2) != color(0, 0, 0))
  {
    compDir = DOWN;
  }
  else if (get(compX, compY+2) != color(0, 0, 0))
  {
    compDir = UP;
  }
  else if (int(random(2)) == 0)
  {
    compDir = DOWN;
  }
  else
  {
    compDir = UP;
  }
}
void computer2()
{
  if (get(comp2X, comp2Y) != color(0, 0, 0))
  {
    comp2Crashed = true;
  }
  stroke(0, 255, 255);
  point(comp2X, comp2Y);
  if (comp2Dir == LEFT)
  {
    comp2X--;
    if (get(comp2X-2, comp2Y) != color(0, 0, 0))
    {
      yTurn2();
    }
  }
  else if (comp2Dir == DOWN)
  {
    comp2Y++;
    if (get(comp2X, comp2Y+2) != color(0, 0, 0))
    {
      xTurn2();
    }
  }
  else if (comp2Dir == RIGHT)
  {
    comp2X++;
    if (get(comp2X+2, comp2Y) != color(0, 0, 0))
    {
      yTurn2();
    }
  }
  else if (comp2Dir == UP)
  {
    comp2Y--;
    if (get(comp2X, comp2Y-2) != color(0, 0, 0))
    {
      xTurn2();
    }
  }
}
void xTurn2()
{
  if (get(comp2X-1, comp2Y) != color(0, 0, 0))
  {
    comp2Dir = RIGHT;
  }
  else if (get(comp2X+1, comp2Y) != color(0, 0, 0))
  {
    comp2Dir = LEFT;
  }
  else if (get(comp2X-2, comp2Y) != color(0, 0, 0))
  {
    comp2Dir = RIGHT;
  }  
  else if (get(comp2X+2, comp2Y) != color(0, 0, 0))
  {
    comp2Dir = LEFT;
  }
  else if (int(random(2)) == 0)
  {
    comp2Dir = RIGHT;
  }
  else
  {
    comp2Dir = LEFT;
  }
}
void yTurn2()
{
  if (get(comp2X, comp2Y-1) != color(0, 0, 0))
  {
    comp2Dir = DOWN;
  }
  else if (get(comp2X, comp2Y+1) != color(0, 0, 0))
  {
    comp2Dir = UP;
  }
  else if (get(comp2X, comp2Y-2) != color(0, 0, 0))
  {
    comp2Dir = DOWN;
  }
  else if (get(comp2X, comp2Y+2) != color(0, 0, 0))
  {
    comp2Dir = UP;
  }
  else if (int(random(2)) == 0)
  {
    comp2Dir = DOWN;
  }
  else
  {
    comp2Dir = UP;
  }
}
void menu()
{
  gameStarted = false;
  background(0);
  fill(255);
  textSize(50);
  text("TRON", 250, 100);
  textSize(20);
  text("Press the spacebar to begin.", 250, 300); 
  textSize(10);
  text("by Eric K, 2012", 250, 150);
  if (mode == 0)
  {
    text("Single-Player Mode\nUse W for up, A for left, S for down, and D for right.\nPress \"x\" to change mode.", 250, 350);
  }
  else if (mode == 1)
  {
    text("Double-Player Mode\nPlayer 1: Use W for up, A for left, S for down, and D for right.\nPlayer 2: Use I for up, J for left, K for down, and L for right.\nPress \"x\" to change mode.", 250, 350);
  }
  else if (mode == 2)
  {
    text("Single-Player Mode with Two Computers\nUse W for up, A for left, S for down, and D for right.\nPress \"x\" to change mode.", 250, 350);
  }
  else if (mode == 3)
  {
    text("Single-Player Survival Mode\nUse W for up, A for left, S for down, and D for right.\nPress \"x\" to change mode.", 250, 350);
  }
  if (crowdedness == 0)
  {
    text("Crowdedness: None", 250, 450);
  }
  else if (crowdedness == 1)
  {
    text("Crowdedness: Sparsely Crowded", 250, 450);
  }
  else if (crowdedness == 2)
  {
    text("Crowdedness: Moderately Crowded", 250, 450);
  }
  else if (crowdedness == 3)
  {
    text("Crowdedness: Crowded", 250, 450);
  }
  else if (crowdedness == 4)
  {
    text("Crowdedness: Very Crowded", 250, 450);
  }
  else if (crowdedness == 5)
  {
    text("Crowdedness: Insanely Crowded", 250, 450);
  }
  text("Press \"c\" to change the degree of crowdedness", 250, 470);
}
void begin()
{
  gameOver = false;
  background(0);
  stroke(255, 255, 0);
  noFill();
  rectMode(CORNER);
  rect(0, 0, width-1, height-1);
  rectMode(CENTER);
  obstacles();
  noStroke();
  fill(0);
  if (mode == 0)
  {
    x = 100;
    y = 250;
    dir = RIGHT;
    rect(x, y, 30, 30);
    compX = 400;
    compY = 250;
    compDir = LEFT;
    rect(compX, compY, 30, 30);
  }
  if (mode == 1)
  {
    x = 100;
    y = 250;
    dir = RIGHT;
    rect(x, y, 30, 30);
    x2 = 400;
    y2 = 250;
    dir2 = LEFT;
    rect(x2, y2, 30, 30);
  }
  if (mode == 2)
  {
    x = 250;
    y = 250;
    dir = int(random(37, 41));
    rect(x, y, 30, 30);
    compX = int(random(50, 450));
    compY = int(random(50, 450));
    compDir = int(random(37, 41));
    comp1Crashed = false;
    rect(compX, compY, 30, 30);
    comp2X = int(random(50, 450));

    comp2Y = int(random(50, 450));
    comp2Dir = int(random(37, 41));
    rect(comp2X, comp2Y, 30, 30);
    comp2Crashed = false;
  }
  if (mode == 3)
  {
    x = 250;
    y = 250;
    dir = int(random(37, 41));
    rect(x, y, 30, 30);
    score = 0;
  }
}
void obstacles()
{
  int numberOfObstacles = 0;
  if (crowdedness == 0)
  {
    numberOfObstacles = 0;
  }
  else if (crowdedness == 1)
  {
    numberOfObstacles = int(random(1, 10));
  }
  else if (crowdedness == 2)
  {
    numberOfObstacles = int(random(10, 30));
  }
  else if (crowdedness == 3)
  {
    numberOfObstacles = int(random(30, 60));
  }
  else if (crowdedness == 4)
  {
    numberOfObstacles = int(random(60, 100));
  }
  else if (crowdedness == 5)
  {
    numberOfObstacles = int(random(100, 150));
  }
  for (int i = 1; i <= numberOfObstacles; i++)
  {
    if (random(1) < 0.9)
    {
      rect(int(random(width)), int(random(height)), int(random(5, 11)), int(random(5, 11)));
    }
    else if (random(1) < 0.5)
    {
      int lx = int(random(width));
      int ly = int(random(height));
      int ls = int(random(10, 30));
      line(lx - ls, ly - 5, lx + ls, ly - 5);
      line(lx - ls, ly + 5, lx + ls, ly + 5);
    }
    else
    {
      int lx = int(random(width));
      int ly = int(random(height));
      int ls = int(random(10, 30));
      line(lx - 5, ly - ls, lx - 5, ly + ls);
      line(lx + 5, ly - ls, lx + 5, ly + ls);
    }
  }
}
void keyPressed()
{
  if (key == 'd' &&  dir != LEFT)
  {
    dir = RIGHT;
  }
  else if (key == 'a' &&  dir != RIGHT)
  {
    dir = LEFT;
  }
  else if (key == 'w' &&  dir != DOWN)
  {
    dir = UP;
  }
  else if (key == 's' &&  dir != UP)
  {
    dir = DOWN;
  }
  else if (key == ' ' && (!gameStarted || gameOver))
  {
    begin();
    gameStarted = true;
  }
  else if (!gameStarted)
  {
    if (key == 'x')
    {
      mode++;
      if (mode == 4)
      {
        mode = 0;
      }
    }
    else if (key == 'c')
    {
      crowdedness++;
      if (crowdedness == 6)
      {
        crowdedness = 0;
      }
    }
  }
  else if (key == 'm' && gameOver)
  {
    menu();
  }
  if (mode == 1)
  {
    if (key == 'l' &&  dir2 != LEFT)
    {
      dir2 = RIGHT;
    }
    else if (key == 'j' &&  dir2 != RIGHT)
    {
      dir2 = LEFT;
    }
    else if (key == 'i' &&  dir2 != DOWN)
    {
      dir2 = UP;
    }
    else if (key == 'k' &&  dir2 != UP)
    {
      dir2 = DOWN;
    }
  }
}

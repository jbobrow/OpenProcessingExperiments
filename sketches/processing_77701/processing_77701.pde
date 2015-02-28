
//Benson L, CP1 mods 14-15, Tron
//Click the mouse, then press "r" to swich between a one-player game to a two-player game
//Keys for Player 1: wasd
//Keys for Player 2: 8456 (use the number pad)
int x = 150;
int y = 200;
int compx = 250;
int compy = 200;
int a = 250;
int b = 200;
int direct = UP;
int compdirect = UP;
int playerdirect = UP;
boolean gameOver = false;
boolean mode = true;
void setup()
{
  size(400, 400);
  background(0);
  textSize(25);
}
void draw()
{
  if (gameOver == false)
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
  if (key == 'w')
  {
    direct = UP;
  }
  else if (key == 'a')
  {
    direct = LEFT;
  }
  else if (key == 's')
  {
    direct = DOWN;
  }
  else if (key == 'd')
  {
    direct = RIGHT;
  }
  if (key == 'r')
  {
    background(0);
    x = 150;
    y = 200;
    a = 250;
    b = 200;
    compx = 250;
    compy = 200;
    direct = UP;
    playerdirect = UP;
    compdirect = UP;
    gameOver = false;
  }
  if (key == '8')
  {
    playerdirect = UP;
  }
  else if (key == '6')
  {
    playerdirect = RIGHT;
  }
  else if (key == '5')
  {
    playerdirect = DOWN;
  }
  else if (key == '4')
  {
    playerdirect = LEFT;
  }
}
void human()
{
  if (mode == true)
  {
    if (get(x, y) != color(0))
    {
      gameOver = true;
    }
    else
    {
      stroke(255, 0, 0);
      point(x, y);
      if (direct == RIGHT)
      {
        x++;
      }
      else if (direct == LEFT)
      {
        x--;
      }
      else if (direct == UP)
      {
        y--;
      }
      else if (direct == DOWN)
      {
        y++;
      }
    }
    if (gameOver == true)
    {
      smooth();
      stroke(255);
      textAlign(CENTER);
      text("GAME OVER", 200, 185);
      text("COMPUTER WINS", 200, 215);
    }
  }
  else if (mode == false)
  {
    if (get(x, y) != color(0))
    {
      gameOver = true;
    }
    else
    {
      stroke(255, 0, 0);
      point(x, y);
      if (direct == RIGHT)
      {
        x++;
      }
      else if (direct == LEFT)
      {
        x--;
      }
      else if (direct == UP)
      {
        y--;
      }
      else if (direct == DOWN)
      {
        y++;
      }
    }
    if (gameOver == true)
    {
      smooth();
      stroke(255);
      textAlign(CENTER);
      text("GAME OVER", 200, 185);
      text("PLAYER 2 WINS", 200, 215);
    }
  }
}
void computer()
{
  if (mode == true)
  {
    if (get(compx, compy) != color(0))
    {
      gameOver = true;
    }
    else
    {
      stroke(0, 255, 0);
      point(compx, compy);
      if (compdirect == RIGHT)
      {
        compx++;
        if (get(compx+1, compy) != color(0))
        {
          if (get(compx, compy-1) != color(0))
          {
            compdirect = DOWN;
          }
          else if (get(compx, compy+1) != color(0))
          {
            compdirect = UP;
          }
          else
          {
            if (random(1) < .5)
            {
              compdirect = DOWN;
            }
            else
            {
              compdirect = UP;
            }
          }
        }
      }
      else if (compdirect == LEFT)
      {
        compx--;
        if (get(compx-1, compy) != color(0))
        {
          if (get(compx, compy+1) != color(0))
          {
            compdirect = UP;
          }
          else if (get(compx, compy-1) != color(0))
          {
            compdirect = DOWN;
          }
          else
          {
            if (random(1) < .5)
            {
              compdirect = UP;
            }
            else
            {
              compdirect = DOWN;
            }
          }
        }
      }
      else if (compdirect == UP)
      {
        compy--;
        if (get(compx, compy-1) != color(0))
        {
          if (get(compx-1, compy) != color(0))
          {
            compdirect = RIGHT;
          }
          else if (get(compx+1, compy) != color(0))
          {
            compdirect = LEFT;
          }
          else
          {
            if (random(1) < .5)
            {
              compdirect = RIGHT;
            }
            else
            {
              compdirect = LEFT;
            }
          }
        }
      }
      else if (compdirect == DOWN)
      {
        compy++;
        if (get(compx, compy+1) != color(0))
        {
          if (get(compx+1, compy) != color(0))
          {
            compdirect = LEFT;
          }
          else if (get(compx-1, compy) != color(0))
          {
            compdirect = RIGHT;
          }
          else
          {
            if (random(1) < .5)
            {
              compdirect = LEFT;
            }
            else
            {
              compdirect = RIGHT;
            }
          }
        }
      }
    }
    if (gameOver==true)
    {
      smooth();
      stroke(255);
      textAlign(CENTER);
      text("GAME OVER", 200, 185);
      text("HUMAN WINS", 200, 215);
    }
  }
  else if (mode == false)
  {
    if (get(a, b) != color(0))
    {
      gameOver = true;
    }
    else
    {
      stroke(0, 255, 0);
      point(a, b);
      if (playerdirect == RIGHT)
      {
        a++;
      }
      else if (playerdirect == LEFT)
      {
        a--;
      }
      else if (playerdirect == UP)
      {
        b--;
      }
      else if (playerdirect == DOWN)
      {
        b++;
      }
    }
    if (gameOver==true)
    {
      smooth();
      stroke(255);
      textAlign(CENTER);
      text("GAME OVER", 200, 185);
      text("PLAYER 1 WINS", 200, 215);
    }
  }
}
void mouseClicked()
{
  background(0);
  mode = !mode;
}

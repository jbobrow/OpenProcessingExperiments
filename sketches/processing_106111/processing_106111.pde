
//food
int foodx = (int)random(0, 59)*10;
int foody = (int)random(0, 59)*10;
//snake
int snakex = 300;
int snakey = 300;
int dx = 10;
int dy = 0;
int score = 0;
Boolean gameover = false;
Boolean startgame = false;
//Boolean restartgame = false;

Snake snake = new Snake();



void setup()
{
  frameRate(15);
  size(600, 600);
  background(0);
  fill(255);
  fill(0,255,0);
  text("SNAKE", 275, 100);
  fill(255);
  text("W= Go Up", width/2-20, height/2-15);
  text("S= Go Down", width/2-20, height/2);
  text("A= Go Left", width/2-20, height/2+15);
  text("D= Go Right", width/2-20, height/2+30);
}

void draw()
{
  if (startgame == true) {
    background(0);
    fill(255);
    text("Score: " + score, 25, 25);


    if (gameover)
    {
      text("GAME OVER", 270, 270);
      text("Press P to restart", 250, 250);
      snake.keyPressed();

      return;
    }
    //else if (restartgame == true)
    //{

    //food
    //fill(random(255), random(255), random(255));
    rect(foodx, foody, 10, 10);
    //snake
    fill(0, 255, 0);
    snakex = snakex + dx;
    snakey = snakey + dy;
    //rect(snakex, snakey, 10, 10);
    //making a list for the snake body
    //rect(snakebodyx, snakebodyy, 10,10);

    snake.drawsnake();
    snake.keyPressed();
    //if (removeplease = true)
    {
      //snake
    }
  }
  if (keyPressed == true) 
  {
    startgame = true;
  }
}

class Snake 
{

  int[] snakex = new int[5000];
  int[] snakey = new int[5000];

  int snakeSize = 5;


  Snake() 
  {

    for (int i = 0; i<snakeSize; i++)
    {
      println("loc=");

      snakex[i] = 50;
      snakey[i] = 50 + i * 15;
    }
  }



  void keyPressed()
  {
    println(key);
    if (gameover)
    {
      if (key == 'p')
      {
        score =0;
        snakeSize = 5;
        for (int i = 0; i<snakeSize; i++)
        {
          println("loc=");

          snakex[i] = 50;
          snakey[i] = 50 + i * 15;
          gameover = false;
        }
        return;
      }
    }

    //else if (restartgame == true)
    //{
    if (key == 'w') 
    {
      if (dy == 10 && dx == 0) {

        //do nothing
      } else {
        dy = -10;
        dx = 0;
      }
    }
    if (key== 's') 
    {
      if (dy == -10 && dx == 0)
      {
      }

      else
      {
        dy = +10;
        dx = 0;
      }
    }
    if (key== 'a') 
    {
      if (dy == 0 && dx == 10)
      {
      }
      else
      {

        dx = -10;
        dy = 0;
      }
    }
    if (key== 'd') 
    {
      if (dy == 0 && dx == -10)
      {
      } else 
      {
        dx = +10;
        dy = 0;
      }
    }
  }

  void drawsnake()
  {
    for (int i =snakeSize - 1; i>= 0; i--)
    {
      if (snakeSize > 30)
      {
        fill(255,204,0);
      }
      if (snakeSize > 50)
      {
        fill(0,0,255);
      }
      if (snakeSize > 80)
      {
        fill(0,0,255);
      }
      //fill(0,255,0);
      rect(snakex[i], snakey[i], 10, 10);
      println("loc=" + snakex[i]);
      if (i == 0)
      {
        snakex[i] += dx;
        snakey[i] += dy;
      }
      else
      {
        snakex[i] = snakex[i-1];
        snakey[i] = snakey[i-1];
      }
      if (snakex[i] < 0) 
      {
        snakex[i] = 600;
      } else if (snakex[i] > 600)
      {
        snakex[i] = 0;
      } else if (snakey[i] < 0)
      {
        snakey[i] = 600;
      } else if  (snakey[i] > 600)
      {
        snakey[i] = 0;
      }
    }
    if (snakex[0]+10 >= foodx && snakey[0]+10 >= foody && 
      snakex[0]-10 <= foodx && snakey[0]-10 <= foody)
    {
      foodx = (int)random(0, 59)*10;
      foody = (int)random(0, 59)*10;
      score += 100;
      snakex[snakeSize] = snakex[snakeSize - 1];
      snakey[snakeSize] = snakey[snakeSize - 1];
      snakeSize+=1;
    }

    for (int i =snakeSize - 1; i> 0; i--)
      if (snakex[0]+9 >= snakex[i] && snakey[0]+9 >= snakey[i] && 
        snakex[0]-9 <= snakex[i] && snakey[0]-9 <= snakey[i]) 
      {
        dx = 0;
        dy = 0;
        gameover = true;
      }
  }
}



int shipY;
int thisBullet;
int score;
int difficulty;
int[] enemyX;
int[] enemyY;
int[] bulletX;
int[] bulletY;
boolean upPressed;
boolean downPressed;
boolean shotReleased;
boolean gameOver;
PFont font;

void setup()
{
  size(500, 500);
  shipY = 250;
  score = 0;
  difficulty = 0;
  enemyX = new int[10];
  enemyY = new int[10];
  bulletX = new int[6];
  bulletY = new int[6];
  gameOver = false;
  font = loadFont("AgencyFB-Reg-48.vlw");
  frameRate(60);

  for (int i = 0; i < 6; i++)
  {
    bulletX[i] = -1000;
    bulletY[i] = -1000;
  }

  for (int i = 0; i < enemyX.length; i++)
  {
    enemyX[i] = (int)random(200, 500);
    enemyY[i] = (int)random(50, 450);
  }
}

void draw()
{
  if (gameOver == false)
  {
    background(0);
    text(score, 480, 10);
    fill(255);
    triangle(2, (shipY+7), 30, shipY, 2, (shipY-7));
    difficulty = 2 - ((score + 1) / 100);

    if (upPressed == true)
    {
      shipY -=6;
    }
    if (downPressed == true)
    {
      shipY +=6;
    }

    if (shotReleased == true)
    {
      CreateBullet();
    }

    for (int i = 0; i < 6; i++)
    {
      ellipse(bulletX[i], bulletY[i], 5, 5);
      bulletX[i] += 10;
    }

    fill(100);
    for (int i = 0; i < enemyX.length; i++)
    {
      rect(enemyX[i], enemyY[i], 25, 25);
      enemyX[i] = enemyX[i] + (int)random(-3, difficulty);
      enemyY[i] = enemyY[i] + (int)random(-3, 3);
    }

    for (int i = 0; i < enemyX.length; i++)
      if (enemyX[i] < 35 && enemyY[i] > (shipY-10) && (enemyY[i] < (shipY+10)))
      {
        gameOver = true;
        score = 0;
      }

    HitEnemyLogic();

    for (int i = 0; i < enemyX.length; i++)
    {
      if (enemyX[i] < 0)
      {
        enemyX[i] = 500;
        enemyY[i] = (250 + (int)random(-150, 150));
      }
    }

    upPressed = false;
    downPressed = false;
    shotReleased = false;
  }
  else
  {
    background(0);
    text ("GAME OVER.  Press ENTER to restart.", 130, 250);
  }
}

void keyPressed()
{
  if (keyCode == UP)
  {
    upPressed = true;
  }
  if (keyCode == DOWN)
  {
    downPressed = true;
  }
}

void keyReleased()
{
  if (keyCode == 32)
  {
    shotReleased = true;
  }
  if (keyCode == ENTER)
  {
    gameOver = false;
    fill(100);
    for (int i = 0; i < enemyX.length; i++)
    {
      enemyX[i] = (int)random(200, 500);
      enemyY[i] = (int)random(50, 450);
    }
  }
}


void CreateBullet()
{
  bulletX[thisBullet] = 30;
  bulletY[thisBullet] = shipY;

  if (thisBullet < 5)
  {
    thisBullet++;
  }
  else
  {
    thisBullet = 0;
  }
}

void HitEnemyLogic()
{
  for (int i = 0; i < bulletX.length; i++)
  {
    for (int j = 0; j < enemyX.length; j++)
    {
      if (bulletX[i] > enemyX[j] && 
        bulletX[i] < (enemyX[j] + 25) && 
        bulletY[i] > enemyY[j] &&
        bulletY[i] < (enemyY[j] + 25))  
      {
        bulletY[i] = -1000;   
        enemyX[j] = 500;
        enemyY[j] = (250 + (int)random(-150, 150));
        score += 10;
      }
    }
  }
}


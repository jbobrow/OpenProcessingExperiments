
PImage cloudbg;
PImage gameover;
PImage invader1;
PImage invader2;
PImage invader3;
PImage invader4;
PImage invader5;
PImage splatter1;
PImage splatter2;
PImage splatter3;
PImage splatter4;
PImage splatter5;
PImage arrowshooter;
boolean trigger = false;
int enemyD = 50;

///////////////////////////////////////////////////////////////

int rand()
{
  return int(random(1024));
}

///////////////////////////////////////////////////////////////

int colorRand()
{
  return int(random(255));
}

///////////////////////////////////////////////////////////////

int[] enemyX = { rand(), rand(), rand(), rand(), rand(), rand(), rand(), rand(), rand(), rand() }; 
int[] enemyY = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

///////////////////////////////////////////////////////////////

void setup()
{
  smooth();
  size(1024, 786);
  cloudbg = loadImage("cloudbg.png");
  gameover = loadImage("gameover.png");
  invader1 = loadImage("invader1.png");
  invader2 = loadImage("invader2.png");
  invader3 = loadImage("invader3.png");
  invader4 = loadImage("invader4.png");
  invader5 = loadImage("invader5.png");
  
  splatter1 = loadImage("splatter1.png");
  splatter2 = loadImage("splatter2.png");
  splatter3 = loadImage("splatter3.png");
  splatter4 = loadImage("splatter4.png");
  splatter5 = loadImage("splatter5.png");
  
  arrowshooter = loadImage("arrowshooter.png");
}

///////////////////////////////////////////////////////////////

void draw()
{
  background(cloudbg);
  fill(47, 45, 129);
  stroke(47, 45, 129);
  image(arrowshooter, mouseX-35, 700, 70, 70);
  fill(252, 44, 225);
  stroke(252, 44, 225);
  
  if(trigger==true)
  {
    blam(mouseX);
    trigger = false;
  }
  
  enemySpawn();
  gameOver();
}

///////////////////////////////////////////////////////////////

void mousePressed()
{
  trigger = true;
}

///////////////////////////////////////////////////////////////

void enemySpawn()
{
  for (int i = 0; i < 10; i++)
  {
    noFill();
    noStroke();
    if ( i == 0 || i == 5)
    {
      image(invader1, enemyX[i], enemyY[i]++, enemyD, 35);
    }
    else if ( i == 1 || i == 6)
    {
      image(invader2, enemyX[i], enemyY[i]++, enemyD, 35);
    }
    else if ( i == 2 || i == 7)
    {
      image(invader3, enemyX[i], enemyY[i]++, enemyD, 35);
    }
    else if ( i == 3 || i == 8)
    {
      image(invader4, enemyX[i], enemyY[i]++, enemyD, 35);
    }
    else if ( i == 4 || i == 9)
    {
      image(invader5, enemyX[i], enemyY[i]++, enemyD, 35);
    }
  }
}

///////////////////////////////////////////////////////////////

void blam(int hitX)
{
  boolean hit = false;
  for (int i = 0; i < 10; i++)
  {
    if((hitX >= (enemyX[i] - enemyD/2)) && (hitX <= (enemyX[i] + enemyD/2)))
    {
      hit = true;
      fill(255, 0, 0);
      stroke(255, 0, 0);
      line(mouseX, 755, mouseX, enemyY[i]);
      
      if ( i == 0 || i == 5)
      {
        image(splatter1, enemyX[i], enemyY[i]++, 130, 150);
      }
      else if ( i == 1 || i == 6)
      {
        image(splatter2, enemyX[i], enemyY[i]++, 130, 150);
      }
      else if ( i == 2 || i == 7)
      {
        image(splatter3, enemyX[i], enemyY[i]++, 130, 150);
      }
      else if ( i == 3 || i == 8)
      {
        image(splatter4, enemyX[i], enemyY[i]++, 130, 150);
      }
      else if ( i == 4 || i == 9)
      {
        image(splatter5, enemyX[i], enemyY[i]++, 130, 150);
      }
      
      enemyX[i] = rand();
      enemyY[i] = 0;
    }
  }
  if(hit == false)
  {
    fill(47, 45, 129);
    stroke(47, 45, 129);
    line(mouseX, 755, mouseX, 0);
  }
}

///////////////////////////////////////////////////////////////

void gameOver()
{
  for(int i = 0; i < 10; i++)
  {
    if(enemyY[i] == 786)
    {
      background(gameover);
      noLoop();
    }
  }
}



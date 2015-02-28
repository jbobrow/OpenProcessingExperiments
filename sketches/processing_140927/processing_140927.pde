
PImage BGfloor;
PImage BGwin1;
PImage BGwin2;
PImage BGlose;

int gamePlay = 0;
int gamePause = 0;
int gameWin = 1;
int gameLose = 2;

float charStroke = 9;

float charHit = 0;
float timer = 0;

int pointsGood = 0;
int pointsBad = 0;

float[] x = new float[8];
float[] y = new float[8];
float segLength = 18;

class astro
{
  float aX;
  float aY;
  float aRadius = 20;
}
class king
{
  float bX;
  float bY;
  float bRadius = 20;
}

astro[] asteroid = new astro[60];
king[] levelup = new king[1];

void setup()
{
  size(800, 400);
  strokeWeight(charStroke);
  frameRate(30);
  
  BGfloor = requestImage("BG_FINAL.png");
  BGwin1 = requestImage("Victory_Snake.png");
  BGwin2 = requestImage("Victory_Food.png");
  BGlose = requestImage("Lose_Holl.png");

  for (int i = 0; i < asteroid.length; i++)
  {
    asteroid[i] = new astro();
    asteroid[i].aX = random(150, width-150);
    asteroid[i].aY = random(height);
  }
  for (int i = 0; i < levelup.length; i++)
  {
    levelup[i] = new king();
    levelup[i].bX = random(150, width-150);
    levelup[i].bY = random(height);
  }
}

void draw()
{
  background(#996600);  
  image(BGfloor, 0,0, width,height);

  timer += timer;
  if (charStroke <= 3)
  {
    charStroke = 3;
  }

  dragSegment(0, mouseX, mouseY);
  for (int i = 0; i < x.length - 1; i++)
  {
    dragSegment(i+1, x[i], y[i]);
  }

  if (gamePlay == gamePause)
  {
    for (int i = 0; i < asteroid.length; i++)
    {
      noStroke();
      fill(#000000);

      ellipseMode(CENTER);
      ellipse(asteroid[i].aX, asteroid[i].aY, asteroid[i].aRadius, asteroid[i].aRadius);

      for (int j = 0; j < x.length - 1; j++)
      {
        if (dist(x[j], y[j], asteroid[i].aX, asteroid[i].aY) < asteroid[i].aRadius)
        {
          asteroid[i].aX = -200;
          asteroid[i].aY = -200;

          charStroke += 2;
          strokeWeight(charStroke);
          
          charHit = 2;
          timer += (1.0 / 30.0);
          pointsBad += 1;
        }
      }
    }

    for (int i = 0; i < levelup.length; i++)
    {
      noStroke();
      fill(#FFFFFF);

      ellipseMode(CENTER);
      ellipse(levelup[i].bX, levelup[i].bY, levelup[i].bRadius, levelup[i].bRadius);

      for (int j = 0; j < x.length - 1; j++)
      {
        if (dist(x[j], y[j], levelup[i].bX, levelup[i].bY) < (levelup[i].bRadius + 12))
        {
          levelup[i].bX = random(150, width-150);
          levelup[i].bY = random(height);

          segLength += 1;
          charStroke -= 1;
          strokeWeight(charStroke);
          
          charHit = 1;
          timer += (1.0 / 30.0);
          pointsGood += 1;
        }
      }
    }

    if (timer >= 2)
    {
      charHit = 0;
      timer = 0;
    }

    if (pointsGood >= 10)
    {
      gamePlay = gameWin;
    }
    if (pointsBad >= 3)
    {
      gamePlay = gameLose;
    }

    //Good-side Rules
    textSize(18);
    textAlign(LEFT);
    fill(#00FF00);
    text("10 'Good Points' to win", 10, height-100, 110, 100);
    //Good Points and Score
    text("Good Points:", 10, 30);
    textSize(40);
    text(pointsGood, 10, 70);

    //Bad-side Rules
    textSize(18);
    textAlign(RIGHT);
    fill(#FF0000);
    text("3 'Bad Points' to lose", width-120, height-100, 110, 100);
    //Bad Points and Score
    text("Bad Points:", width-10, 30);
    textSize(40);
    text(pointsBad, width-10, 70);
  }

  if (gamePlay == gameLose)
  {
    fill(#000000);
    noStroke();
    rect(0,0, width,height);
    image(BGlose, width/3, height/3, 300,150);
    
    textSize(30);
    textAlign(CENTER);
    fill(#FF0000);
    text("YOU LOSE", width/2, height-300);
    text("Back in the hole with you!", width/2, height-100);
    text("Good luck next time.", width/2, height-50);
  }
  if (gamePlay == gameWin)
  {
    fill(#000000);
    noStroke();
    rect(0,0, width,height);
    image(BGwin1, 100,100, 150,200);
    image(BGwin2, 200,200, 150,150);
    
    textSize(30);
    textAlign(RIGHT);
    fill(#00FF00);
    text("YOU WIN", width-100, height-300);
    text("You are great at hunting!", width-100, height-200);
    text("You will be just fine.", width-100, height-150);
  }
}

void keyReleased()
{
  for (int i = 0; i < levelup.length; i++)
  {
    if (key == 'r' || key == 'R')
    {
      levelup[i] = new king();
      levelup[i].bX = random(150, width-150);
      levelup[i].bY = random(height);
      pointsGood -= 1;
      charStroke += 2;
      strokeWeight(charStroke);
      charHit = 2;
      timer += (1.0 / 30.0);
      
      if (pointsGood < 0)
      {
        gamePlay = gameLose;
      }
    }
  }

  if (keyCode == ENTER || keyCode == RETURN)
  {
    for (int i = 0; i < asteroid.length; i++)
    {
      asteroid[i] = new astro();
      asteroid[i].aX = random(150, width-150);
      asteroid[i].aY = random(height);
    }
    for (int i = 0; i < levelup.length; i++)
    {
      levelup[i] = new king();
      levelup[i].bX = random(150, width-150);
      levelup[i].bY = random(height);
    }
    
    pointsGood = 0;
    pointsBad = 0;
    charStroke = 9;
    charHit = 0;
    timer = 0;
    segLength = 18;
    strokeWeight(charStroke);
  }
}

void dragSegment(int i, float xin, float yin)
{
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
}

void segment(float x, float y, float a)
{
  pushMatrix();
    stroke(#009900);
    if (charHit == 1)
    {
      stroke(#00FF00);
    }
    if (charHit == 2)
    {
      stroke(#FF0000);
    }
    if (charHit == 0)
    {
      stroke(#009900);
    }
    
    noFill();
    translate(x, y);
    rotate(a);
    line(0, 0, segLength, 0);
  popMatrix();
}



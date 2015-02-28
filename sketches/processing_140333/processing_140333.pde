
int gamePlay = 0;
int gamePause = 0;
int gameWin = 1;
int gameLose = 2;

float counterGood = 0;
float counterBad = 0;
float charStroke = 9;

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

  for (int i = 0; i < asteroid.length; i++)
  {
    asteroid[i] = new astro();
    asteroid[i].aX = random(150, width-20);
    asteroid[i].aY = random(height);
  }
  for (int i = 0; i < levelup.length; i++)
  {
    levelup[i] = new king();
    levelup[i].bX = random(150, width-20);
    levelup[i].bY = random(height);
  }
}

void draw()
{
  background(#996600);  
  
  noStroke();
  fill(#CC9933);
  rect(0,0, 130,height);

  dragSegment(0, mouseX, mouseY);
  for (int i = 0; i < x.length - 1; i++)
  {
    stroke(#198719);
    noFill();
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
          counterBad += 1;
          asteroid[i].aX = -200;
          asteroid[i].aY = -200;

          charStroke += 4;
          strokeWeight(charStroke);
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
          counterGood += 1;
          levelup[i].bX = random(width-150);
          levelup[i].bY = random(height);

          segLength += 2;
          charStroke -= 2;
          strokeWeight(charStroke);
        }
      }
    }

    if (counterGood >= 5)
    {
      gamePlay = gameWin;
    }
    if (counterBad >= 3)
    {
      gamePlay = gameLose;
    }
  }

  if (gamePlay == gameLose)
  {
    fill(#FF0000);
    rect(0,0, width,height);
  }

  if (gamePlay == gameWin)
  {
    fill(#00FF00);
    rect(0,0, width,height);
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
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}




/*
Creates a class and utilizes arrays to model stars and orbits by planets (DOES NOT REPRESENT THE SOLAR SYSTEM)
 The program creates between one and three starsystems based upon the size of the window it runs
 If the program can't find room for any more starsystems, it will timeout and only display the ones it was able to place.
 Each starsystem has an area around it that another star system cannot be created in, to avoid collisions
 Each star comes with a random location, color, and size
 Each starsystem also creates a random number of planets (between 1 and 3 [0 if collision]), with random orbits, distances from the star, sizes, and colors
 The planet's distance from the star is what determines its speed, the closer it is, the faster it goes
 Most of the planets orbit clockwise, but some orbit counterclockwise, like in real life
 Colors are determined on the HSB color system
 The star distances are set up so that the planets from neighboring star systems never collide
 If planets within the same star system collide, the resulting explosion makes space light up and the planets slowly shrink out of existence
 
 FOR THE ARRAYS/CLASSES:
 Everything with a number after it within the class only has that number to denote which planet it corresponds to, otherwise they are all the same
 The boolean planet## holds true when there is not a collision with any other planet
 The ins and outs hold the values of the outermost edge of the planets, which are used in determining inital collisions
 The array planet# holds the values for drawing the planet: {color, distance, and size}
 The array motion# holds the values necessary to make the planet move; {angle, distance, speed, locX, locY, orbitalOffsetX, orbitalOffsetY, orbitDirection}
 The array oldXs holds the x locations of the previous stars
 The array oldYs holds the y locations of the previous stars
 
 VARIABLES:
 All of the variables in the program have descriptive names, except for the counter variables and temporary variables that store info for only one scope
 
 Insperation taken from this video: {https://www.youtube.com/watch?v=gvSUPFZp7Yo}
 Planetary_Motion  is all original code created by Dixon Layton March 2014
 */
int starsNumber = 3;
int cutoff = 650;
int timeCutoff = 1000;
int maxDist = 250;
int distance;
int i;
int colisionColor = 0;

StarSystem[] milkyWay = new StarSystem[starsNumber];

float[] oldXs = new float[starsNumber];
float[] oldYs = new float[starsNumber];

float starH;
float starS;
float starB;
float starSi;
float starX;
float starY;

boolean tooClose = false;

void setup()
{
  size(1265, 700);
  background(16, 100, colisionColor);
  smooth();
  colorMode(HSB, 100);
  ellipseMode(CENTER);
  for (i = 0; i < starsNumber; i++)
  {
    int timer = millis();
    starH = random(0, 100);
    starS = random(25, 75);
    starB = random(50, 90);
    starSi = random(100, 150);
    starX = random(starSi+10, width-250);
    starY = random(starSi+10, height);
    oldXs[i] = starX;
    oldYs[i] = starY;
    if (i == 1)
    {
      tooClose = cutoffTest(0, starX, starY);
      if (tooClose == true && timer > timeCutoff)
      {
        i = 500;
      }
    }
    else if (i == 2)
    {
      tooClose = cutoffTest(0, starX, starY);
      if (tooClose == false)
      {
        tooClose = cutoffTest(1, starX, starY);
        if (tooClose == true && timer > timeCutoff)
        {
          i = 100;
        }
      }
    }
    if (tooClose == false)
    {
      milkyWay[i] = new StarSystem(color(starH, starS, starB), starSi, starX, starY);
      milkyWay[i].display();
    }
    else
    {
      i--;
      tooClose = false;
    }
  }
  milkyWay[0].attemptPlanets();
  if (i < 400)
  {
    milkyWay[1].attemptPlanets();
  }
  if (i < 50)
  {
    milkyWay[2].attemptPlanets();
  }
}

void draw()
{
  background(16, 100, colisionColor);
  int timer = millis();
  if (timer > timeCutoff*5)
  {
    milkyWay[0].planetaryMotion();
    if (i < 400)
    {
      milkyWay[1].planetaryMotion();
    }
    if (i < 50)
    {
      milkyWay[2].planetaryMotion();
    }
  }
}

boolean cutoffTest(int a, float x, float y)
{
  distance = int(sqrt(sq(int(x)-int(oldXs[a]))+sq(int(y)-int(oldYs[a]))));
  if (distance < cutoff)
  {
    return true;
  }
  else
  {
    return false;
  }
}

int posNeg()
{
  int l = int(random(1, 2));
  if (l == 2)
  {
    return -1;
  }
  else
  {
    return 1;
  }
}

class StarSystem
{
  int starColor;
  int starSize;
  int starCenterX;
  int starCenterY;

  int numberOfPlanets;
  boolean planet00 = false;
  boolean planet11 = false;
  boolean planet22 = false;
  boolean planetColision01 = false;
  boolean planetColision02 = false;
  boolean planetColision12 = false;
  float[] motion0 = {
    0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] motion1 = {
    0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] motion2 = {
    0, 0, 0, 0, 0, 0, 0, 0
  };
  int[] planet0 = new int[3];
  int[] planet1 = new int[3];
  int[] planet2 = new int[3];
  int in2;
  int out2;
  int in1;
  int out1;
  int in0;
  int out0;

  StarSystem(int tempStarColor, float tempStarSize, float tempStarX, float tempStarY)
  {
    starColor = tempStarColor;
    starSize = int(tempStarSize);
    starCenterX = int(tempStarX);
    starCenterY = int(tempStarY);
    motion0[7] = posNeg();
    motion1[7] = posNeg();
    motion2[7] = posNeg();
  }

  void display()
  {
    noStroke();
    fill(starColor);
    ellipse(starCenterX, starCenterY, starSize, starSize);
  }

  void attemptPlanets()
  {
    int numberOfPlanets = int(random(1, 3.9))-1;
    int k = numberOfPlanets;
    while (numberOfPlanets != -1)
    {
      if (numberOfPlanets == 2)
      {
        planet2[0] = color(int(random(0, 100)), int(random(25, 75)), int(random(75, 95)));
        planet2[1] = int(random(starSize/10, starSize/5));
        planet2[2] = int(random(110+planet2[1], maxDist));
        planet22 = true;
        motion2[1] = planet2[2];
        motion2[5] = random(1, 1.3);
        motion2[6] = random(1, 1.3);
        in2 = planet2[2]-planet2[1];
        out2 = planet2[2]+planet2[1];
      }
      else if (numberOfPlanets == 1)
      {
        planet1[0] = color(int(random(0, 100)), int(random(25, 75)), int(random(75, 95)));
        planet1[1] = int(random(starSize/10, starSize/5));
        planet1[2] = int(random(110+planet1[1], maxDist));
        in1 = planet1[2]-planet1[1];
        out1 = planet1[2]+planet1[1];
        if (k == 2)
        {
          if (out2 < in1 || in2 > out1)
          {
            planet11 = true;
            motion1[1] = planet1[2];
            motion1[5] = random(1, 1.3);
            motion1[6] = random(1, 1.3);
          }
        }
        else
        {
          planet11 = true;
          motion1[1] = planet1[2];
          motion1[5] = random(1, 1.3);
          motion1[6] = random(1, 1.3);
        }
      }
      else if (numberOfPlanets == 0)
      {
        planet0[0] = color(int(random(0, 100)), int(random(25, 75)), int(random(75, 95)));
        planet0[1] = int(random(starSize/10, starSize/5));
        planet0[2] = int(random(110+planet0[1], maxDist));
        in0 = planet0[2]-planet0[1];
        out0 = planet0[2]+planet0[1];
        if (k != 0)
        {
          if (k == 2)
          {
            if ((out2 < in0 || in2 > out0) && (out1 < in0 || in1 > out0))
            {
              planet00 = true;
              motion0[1] = planet0[2];
              motion0[5] = random(1, 1.3);
              motion0[6] = random(1, 1.3);
            }
          }
          if (k == 1)
          {
            if (out1 < in0 || in1 > out0)
            {
              planet00 = true;
              motion0[1] = planet0[2];
              motion0[5] = random(1, 1.3);
              motion0[6] = random(1, 1.3);
            }
          }
        }
        if (k == 0)
        {
          planet00 = true;
          motion0[1] = planet0[2];
          motion0[5] = random(1, 1.3);
          motion0[6] = random(1, 1.3);
        }
      }
      if (numberOfPlanets == 0)
      {
        if (planet00 == true)
        {
          numberOfPlanets--;
        }
      }
      if (numberOfPlanets == 1)
      {
        if (planet11 == true)
        {
          numberOfPlanets--;
        }
      }
      if (numberOfPlanets == 2)
      {
        if (planet22 == true)
        {
          numberOfPlanets--;
        }
      }
    }
  }

  void planetaryMotion()
  {
    noStroke();
    fill(starColor);
    ellipse(starCenterX, starCenterY, starSize, starSize);
    if (planet00 == true)
    {
      pushMatrix();
      translate(starCenterX, starCenterY);
      motion0[3] = motion0[5]*cos(motion0[0])*motion0[1];
      motion0[4] = motion0[6]*sin(motion0[0])*motion0[1];
      noStroke();
      fill(starColor);
      ellipse(0, 0, starSize, starSize);
      fill(planet0[0]);
      ellipse(motion0[3], motion0[4], planet0[1], planet0[1]);
      stroke(planet0[0]);
      noFill();
      motion0[2] = motion0[7]*((maxDist+100)-(sqrt(sq(motion0[3])+sq(motion0[4]))))/6000;
      motion0[0] -= motion0[2];
      popMatrix();
    }
    if (planet11 == true)
    {
      pushMatrix();
      translate(starCenterX, starCenterY);
      motion1[3] = cos(motion1[0])*motion1[1];
      motion1[4] = sin(motion1[0])*motion1[1];
      noStroke();
      fill(starColor);
      ellipse(0, 0, starSize, starSize);
      fill(planet1[0]);
      ellipse(motion1[3], motion1[4], planet1[1], planet1[1]);
      stroke(planet1[0]);
      noFill();
      motion1[2] = motion1[7]*((maxDist+100)-(sqrt(sq(motion1[3])+sq(motion1[4]))))/6000;
      motion1[0] -= motion1[2];
      popMatrix();
      int distanceTo0 = int(sqrt(sq(motion1[3]-motion0[3])+sq(motion1[4]-motion0[4])));
      if (distanceTo0 < planet0[1]+planet1[1] && (planet11 == true && planet00 == true))
      {
        motion0[7] = 0;
        motion1[0] = 0;
        colisionColor = 100;
        planetColision01 = true;
      }
    }
    if (planet22 == true)
    {
      pushMatrix();
      translate(starCenterX, starCenterY);
      motion2[3] = cos(motion2[0])*motion2[1];
      motion2[4] = sin(motion2[0])*motion2[1];
      noStroke();
      fill(planet2[0]);
      ellipse(motion2[3], motion2[4], planet2[1], planet2[1]);
      stroke(planet2[0]);
      noFill();
      motion2[2] = motion2[7]*((maxDist+100)-(sqrt(sq(motion2[3])+sq(motion2[4]))))/6000;
      motion2[0] -= motion2[2];
      popMatrix();
      int distanceTo0 = int(sqrt(sq(motion2[3]-motion0[3])+sq(motion2[4]-motion0[4])));
      int distanceTo1 = int(sqrt(sq(motion2[3]-motion1[3])+sq(motion2[4]-motion1[4])));
      if (distanceTo0 < planet0[1]+planet2[1] && (planet22 == true && planet00 == true))
      {
        motion0[7] = 0;
        motion2[7] = 0;
        colisionColor = 100;
        planetColision02 = true;
      }
      if (distanceTo1 < planet1[1]+planet2[1] && (planet22 == true && planet11 == true))
      {
        motion1[7] = 0;
        motion2[7] = 0;
        colisionColor = 100;
        planetColision12 = true;
      }
    }
    if (planetColision01 == true)
    {
      pushMatrix();
      translate(starCenterX, starCenterY);
      noStroke();
      fill(starColor);
      ellipse(0, 0, starSize, starSize);
      fill(planet1[0]);
      ellipse(motion1[3], motion1[4], planet1[1], planet1[1]);
      fill(planet0[0]);
      ellipse(motion0[3], motion0[4], planet0[1], planet0[1]);
      popMatrix();
      if (planet0[1] != 0)
      {
        planet0[1] -= 0.125;
      }
      if (planet1[1] != 0)
      {
        planet1[1] -= 0.125;
      }
      if (colisionColor != 0)
      {
        colisionColor -= 1;
      }
    }
    if (planetColision02 == true)
    {
      pushMatrix();
      translate(starCenterX, starCenterY);
      noStroke();
      fill(starColor);
      ellipse(0, 0, starSize, starSize);
      fill(planet0[0]);
      ellipse(motion0[3], motion0[4], planet0[1], planet0[1]);
      fill(planet2[0]);
      ellipse(motion2[3], motion2[4], planet2[1], planet2[1]);
      popMatrix();
      if (planet0[1] != 0)
      {
        planet0[1] -= 0.125;
      }
      if (planet2[1] != 0)
      {
        planet2[1] -= 0.125;
      }
      if (colisionColor != 0)
      {
        colisionColor -= 1;
      }
    }
    if (planetColision12 == true)
    {
      pushMatrix();
      translate(starCenterX, starCenterY);
      noStroke();
      fill(starColor);
      ellipse(0, 0, starSize, starSize);
      fill(planet1[0]);
      ellipse(motion1[3], motion1[4], planet1[1], planet1[1]);
      fill(planet2[0]);
      ellipse(motion2[3], motion2[4], planet2[1], planet2[1]);
      popMatrix();
      if (planet2[1] != 0)
      {
        planet2[1] -= 0.125;
      }
      if (planet1[1] != 0)
      {
        planet1[1] -= 0.125;
      }
      if (colisionColor != 0)
      {
        colisionColor -= 1;
      }
    }
  }
}

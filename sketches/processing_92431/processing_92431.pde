

int numBalls = 60;
Ball [] balls = new Ball [numBalls];


void setup ()
{
  size (600, 400);
  //b1 = new Ball (); //creating b1 object using a blue print class Ball
  //b2 = new Ball ();

  for (int i = 0; i < balls.length; i++)
  {
    balls [i] = new Ball (color (255, 0, 0) ); //calls the first constructor and draws red balls
    //balls [i] = new Ball (); //calls the second constructor and draws multicolored balls
  }

  smooth (); //not in the class Ball as it will slow down the program
}

void draw ()
{
  // trace behind the balls
  fill (0, 30); //transperancy creates a layer wich partially covers a moving ball
  rect (0, 0, width, height); //a rectangle to cover the screen

  for (int i = 0; i < balls.length; i++)
  {
    for (int j = i+1; j < balls.length; j++)
    {
      balls [i].bounceBalls (balls [j]);
    }
    
    balls [i].bounceWalls ();
    balls [i].moveBall ();
    balls [i].drawMe ();
  } 

  /* 
   b2.bounceWalls ();
   b2.moveBall ();
   b2.drawMe (); //b2 object uses drawMe constructor
   */
}

class Ball
{
  float x, y, velX, velY, bSize;
  float wave, waveSpeed, amp;
  color bColor;

  Ball ( color c) //constructor to initialize parameters of a ball
  {
    x = random (width);
    y = random (height);
    velX = random (-2, 2);
    velY = random (-2, 2);
    bSize = random (15, 40);
    bColor = c;
  }

  Ball ( ) //constructor to initialize parameters of a ball
  {
    x = random (width);
    y = random (height);
    velX = random (-2, 2);
    velY = random (-2, 2);
    bSize = random (15, 40);
    bColor = color (random (255), random (255), random (255) );

    wave = random (TWO_PI);
    waveSpeed = random (0.1, 0.5);
    amp = random (1, 4);
  }
  void drawMe () //constructor to draw a ball
  {
    noStroke ();
    fill (bColor);
    pushMatrix ();
    translate (x, y);
    ellipse (0, 0, bSize, bSize);
    popMatrix ();
  }

  void moveBall () //constructor to move a ball - updates the position of hte ball using speed
  {
    wave =+ waveSpeed;
    x += velX;
    y += velY + sin (wave) * amp; // adds wavie movement
  }

  void bounceWalls ()
  {
    if (x > width || x < 0) 
    {
      velX *= -1;
    }

    if (y > height || y < 0) 
    {
      velY *= -1;
    }
  }

  void bounceBalls (Ball other) //collision between balls: comparing our ball with other balls
  {
    for (int i = 0; i < balls.length; i++)
    {
      if (dist (x, y, other.x, other.y) < (bSize/2 + other.bSize/2))
      {
        float angle = atan2 (y - other.y, x - other.x);

        velX = cos (angle);
        velY = sin (angle);

        other.velX = cos (angle - PI);
        other.velY = sin (angle - PI);
      }
    }
  }
}





int NUM_BALLS = 150;

Ball[] myBalls = new Ball[NUM_BALLS];

Ball myBall;
Ball myBall2;

void setup()
{
  size(500, 500);
  smooth();
  noStroke();
  //  myBall = new Ball();
  //  myBall2 = new Ball();
  //  myBall2.col = color (255, 0, 0);
  // myBall2.posX = 20;
  // myBall2.posY = 100;
  // myBall2.myDiameter = 80;
  // myBall2.speedX++; 
  for (int i = 0; i < NUM_BALLS; i++)
  { 
    myBalls[i] = new Ball();
    myBalls[i].posX = random(0, width);
    myBalls[i].posY = random(0, height);
    myBalls[i].speedX = random(0, 5);
    myBalls[i].myDiameter = random(1, 20);
  }
}

void draw()
{ fill(255, 15);
  rect(0, 0, width, height);
  //myBall.update();
  //myBall2.update();
  for (int i = 0; i < NUM_BALLS; i++)
  { 
    myBalls[i].update();
  }
}

class Ball {
  float posX = 250;
  float posY = 250;
  float myDiameter = 20;
  float speedX = cos(random(0.1, TWO_PI));
  float speedY = sin(random(0.1, TWO_PI));
  int col = color(random(0, 255), random(0, 255), random(0, 255));

  void update()
  { 
    fill(col);
    ellipse(posX, posY, myDiameter, myDiameter);

    posX = posX + speedX;
    posY = posY + speedY;

    if (posX > width+myDiameter/2)
    {
      posX = 0-myDiameter/2;
      speedX = -cos(random(0.1, TWO_PI*2));
      
    }
    if (posX < 0-myDiameter/2)
    {
      posX = width + myDiameter/2;
      speedX = cos(random(0.1, TWO_PI*2));
    }

    if (posY > height+myDiameter/2)
    {
      posY = 0-myDiameter/2;
      speedY = -sin(random(0.1, TWO_PI*2));
    }

    if (posY < 0 - myDiameter/2)
    { 
      posY = height + myDiameter/2;
      speedY = sin(random(0.1, TWO_PI*2));
    }
    
    if (mousePressed == true)
    { posX = mouseX;
    posY = mouseY;
    }
  }
}
                

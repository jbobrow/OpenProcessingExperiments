
Ball ball0;
Ball ball1;
Ball ball2;
Ball ball3;
Ball ball4;
Ball ball5;
Ball ball6;
Ball ball7;
Ball ball8;

int ballArrayX[];
int ballArrayY[];


void setup ()
{
  size(500, 500);
  ballArrayX = new int[9];
  ballArrayY = new int[9];
  ball0 = new Ball();
  ball1 = new Ball();
  ball2 = new Ball();
  ball3 = new Ball();
  ball4 = new Ball();
  ball5 = new Ball();
  ball6 = new Ball();
  ball7 = new Ball();
  ball8 = new Ball();
  
  ball0.initiate((int) random(0, 500), (int) random(0, 500), 0, (int) random(1, 3), (int) random(-3, 1));
  ball1.initiate((int) random(0, 500), (int) random(0, 500), 1, (int) random(1, 3), (int) random(-3, 1));
  ball2.initiate((int) random(0, 500), (int) random(0, 500), 2, (int) random(1, 3), (int) random(-3, 1));
  ball3.initiate((int) random(0, 500), (int) random(0, 500), 3, (int) random(1, 3), (int) random(-3, 1));
  ball4.initiate((int) random(0, 500), (int) random(0, 500), 4, (int) random(1, 3), (int) random(-3, 1));
  ball5.initiate((int) random(0, 500), (int) random(0, 500), 5, (int) random(-3, -1), (int) random(1, 3));
  ball6.initiate((int) random(0, 500), (int) random(0, 500), 6, (int) random(-3, -1), (int) random(1, 3));
  ball7.initiate((int) random(0, 500), (int) random(0, 500), 7, (int) random(-3, -1), (int) random(1, 3));
  ball8.initiate((int) random(0, 500), (int) random(0, 500), 8, (int) random(-3, -1), (int) random(1, 3));
  
}

void draw ()
{
  background(0);
  ball0.display();
  ball1.display();
  ball2.display();
  ball3.display();
  ball4.display();
  ball5.display();
  ball6.display();
  ball7.display();
  ball8.display(); 
}

class Ball
{
  int posX;
  int posY;
  int velocityX;
  int velocityY;
  int arrayPos;

  void initiate(int tempX, int tempY, int tempArray, int tempVelocityX, int tempVelocityY)
  {
    velocityX = tempVelocityX;
    velocityY = tempVelocityY;
    arrayPos = tempArray;
    ballArrayX[tempArray] = tempX;
    ballArrayY[tempArray] = tempY;
  }

  void display()
  {
    ellipse(ballArrayX[arrayPos], ballArrayY[arrayPos], 25, 25);
    ballArrayX[arrayPos] = ballArrayX[arrayPos] + velocityX;
    ballArrayY[arrayPos] = ballArrayY[arrayPos] + velocityY;

    if (ballArrayX[arrayPos] < 10)
    {
      velocityX = -velocityX;
    }

    if (ballArrayX[arrayPos] > 490)
    {
      velocityX = -velocityX;
    }

    if (ballArrayY[arrayPos] < 10)
    {
      velocityY = -velocityY;
    }

    if (ballArrayY[arrayPos] > 490)
    {
      velocityY = -velocityY;
    }

    for (int i = 0; i < 9; i++)
    {
      if (i == arrayPos)
      {
        //do nothing
      }
      else if (ballArrayX[arrayPos] > (ballArrayX[i] - 15) && ballArrayX[arrayPos] < (ballArrayX[i] + 15)
        && ballArrayY[arrayPos] > (ballArrayY[i] - 15) && ballArrayY[arrayPos] < (ballArrayY[i] + 15))
      {
        velocityX = (velocityX * -1);
        velocityY = (velocityY * -1);
      }
    }
  }
}

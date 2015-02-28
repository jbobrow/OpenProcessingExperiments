
//moving balls with oop

int NUM_BALLS = 30;
//create an empty array called myBalls that can contain NUM_BALLS objects of the class ball

Ball[] myBalls = new Ball[NUM_BALLS];

void setup()
{
  size(500, 500);
  smooth();
  noStroke();
  //population
  for (int i = 0; i<NUM_BALLS; i++)
  {myBalls[i] = new Ball();
    
    myBalls[i].posY = sin(-height);//(random((0),( height)));
    myBalls[i].speedX = random(-10, 10);
    myBalls[i].speedY = random(-10, 10);
    myBalls[i].fillBallr = random(255);
    myBalls[i].fillBallg = random(255);
    myBalls[i].fillBallb = random(255);
    //myBalls[i].myDiameter = random(10,25);
  
  }
  }

void draw()
{
  fill(0,0,0,60);
  rect(0,0,width,height);
  for (int i = 0; i<NUM_BALLS; i++)
  { 
    myBalls[i].update();
  }
}

class Ball
{
  //properties
  float myDiameter = 10;
  float posX = cos(250);
  float posY = sin(250);
  float speedX= 10;
  float speedY = 20;
  float fillBallr = 234;
  float fillBallg =23;
  float fillBallb = 56;


  //method
  void update()
  {frameRate(20);
    myDiameter = random(10,30);
    fill(fillBallr, 0, fillBallb);
    ellipse(posX, posY, myDiameter, myDiameter);
    //speedX = speedX;
    //speedY = speedY;
  
  posY+= speedY;
  posX+= speedX;
   if (posX <=0) 
    { 
      speedX = -speedX;
    }
    if (posX >=width)
    {
      speedX = -speedX;
    }
 if (posY <=0)
    { 
      speedY = -speedY;
    }
    if (posY >=height)
    {     
      speedY = -speedY;
    }
    
  }
}


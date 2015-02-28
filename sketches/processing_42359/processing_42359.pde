
//declaration object
//Ball myBall;

//moving balls with oop

int NUM_BALLS = 100;

//create an empty array
//called myBalls
//that can contain NUM_BALLS objects of the
//class Ball
Ball[] myBalls = new Ball[NUM_BALLS];

void setup()
{
  size(500,500);
  smooth();
  noStroke();
  
  //population
  for(int i = 0; i<NUM_BALLS; i++)
  {
    myBalls[i] = new Ball();
    
    myBalls[i].posX = random(0,width);
    myBalls[i].posY = random(0,height);
    myBalls[i].speedX = random(0,3);

  }
}

void draw()
{  
  background(0);

for(int i = 0; i<NUM_BALLS; i++)
{
  myBalls[i].update();
}
}

class Ball
{
 //properties
  int myDiameter = 3;
  float posX = 250;
  float posY = 250;
  float speedX = 0.3;
  float speedY = 0;
  float gravity = 0.1;
  
  //method
  void update()
  {  
  //ellipse(posX, posY, myDiameter, myDiameter);
  fill(#62B7FF,200);
  ellipse(posY, posX, myDiameter, myDiameter);

  posX += speedX + 0.01;
  speedX = speedX + gravity;

    
  if(posX > width)
  {
    posX = 0;
    speedX = speedX*-.45;
  }
  
  }
}


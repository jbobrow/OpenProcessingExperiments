

int NUM_BALLS = 30;

float angleObject = (TWO_PI/NUM_BALLS);
int centerX = 250;
int centerY = 250;
int distance = 100;
Ball[] myBalls = new Ball[NUM_BALLS];

void setup()
{
  background(0);
  size(500, 500);
  smooth();
  noStroke();

  for (int i = 0; i<NUM_BALLS; i++)
  {
    myBalls[i] = new Ball();
    myBalls[i].posX = random(0, width);
    myBalls[i].posY = random(0, height);

    myBalls[i].fillBallr = random(255);
    myBalls[i].fillBallg = random(255);
    myBalls[i].fillBallb = random(255);
    myBalls[i].direction = random(0, 360);
    if (myBalls[i].posX < 0 || myBalls[i].posX >width)
    {
      myBalls[i].posX = random(0, width);
    }
    if ( myBalls[i].posY <0 ||  myBalls[i].posY > height)
    {
      myBalls[i].posY = random(0, height);
    }
  }
}

void draw()
{
  fill(0, 0, 0, 60);
  rect(0, 0, width, height);
  /*for (int r = 0; r<26; r++)
   {
   for( int c = 0; c<41; c++)
   {
   if (r%3 ==0 && c%3 == 0)
   {rectMode(CENTER);
   fill(c%80*9, r%92*11, r%209*25);
   rect(c*20,r*20,20,20);
   }
   
   
   }
   }*/


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
  float speedX= 1;
  float speedY = 1;
  float fillBallr = 234;
  float fillBallg =23;
  float fillBallb = 56;
  float direction = 0;


  //method
  void update()
  {

    fill(fillBallr, 0, fillBallb,100);
    ellipse(abs(posX), abs(posY), myDiameter, myDiameter);

    float dx = cos(radians(direction))*speedX;
    float dy = sin(radians(direction))*speedY;

    posX = posX+dx;
    posY = posY+dy;

    posY+= speedY;
    posX+= speedX;
    //keeping the balls inside the window

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
 /*   if (speedY <= -50 )
    {
      speedY = 2;
    }
    if (speedY >= 50)
    {
      speedY = -2;
    }
    if (speedX <= -50)
    {
      speedX = 2;
    }
    if (speedX >=50) {
      speedX = -2;
    }*/
    for (int i = 0; i < NUM_BALLS; i++)
    {
      Ball other = myBalls[i];

      if (this != other)
      {
        
        
        if (dist(posX, posY, other.posX, other.posY)<75)
        {
          stroke(fillBallr, 0, fillBallb, 40);
          strokeWeight(random(1, 3));
          noFill();

          ellipse(posX, posY, random(myDiameter+60), random(myDiameter+60));
          noStroke();  
        
          

          posX -= abs(random(cos(radians(359))));
          posY -= abs(random(sin(radians(359))));

          if (posX <=0) 
          { 

            speedX = -speedX-.1;
            // posX -= random(cos(-1),cos(1));
          }
          if (posX >=width)
          {

            speedX = -speedX-.1;
            // posX -= random(cos(-1),cos(1));
          }
          if (posY <=0)
          { 

            speedY = -speedY-.1;
            // posY -= random(sin(-1),sin(1));
          }
          if (posY >=height)
          {    

            speedY = -speedY-.1;
            // posY -= random(sin(-1),sin(1));
          }
          if (dist(posX+(myDiameter/2), posY+(myDiameter/2), other.posX+(myDiameter/2), other.posY)<5)
        {

          myDiameter = myDiameter+ other.myDiameter*(.15);
          {
            noFill();
            noStroke();
            ellipse(posX, posY, myDiameter, myDiameter);
          }
        }
      }
    }
  }
}
}
                

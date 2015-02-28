
// Variables for the ball
float ball_x;
float ball_y;
float ball_dir = 1;
float ballSize = 100; // Radius
float dy = 2; // Direction

//Variables for ball 2
float ball2_x;
float ball2_y;
float ball2_dir = 1;
float ball2Size = 100;
float balldy2 = random(1,5);

// Variables for the square
float moveX;
float moveY;
float moveSpeed = 6.0;
float squareSize = 50;

//Variables for points
float randomX;
float randomY;
float scaleW;
float scaleH;

// Movement Variables
float up = 0;
float down = 0;
float left = 0;
float right = 0;

// Gui Variables
int score;
float counter;
float timeX = 0;
float timeY = 10;
float scoreTxTX = 430;
float scoreTxTY = 10;
float counterX = 30;
float counterY = 10;
float scoreX = 470;
float scoreY = 10;
float s;



void setup()
{
  size (500, 500);
  rectMode(CORNER);
  ellipseMode(CENTER);
  noStroke();
  smooth();
  ball_y = height/2;
  ball_x = width/2;
  ball2_y = 100;
  ball2_x = 100;
  
}

void draw()
{
  background(51);
  counter += 1 / 60.0;
  fill(0, 255, 0);
  s = second();
  

  if (s % 2 == 0 )
  {
    randomX = random(500);
    randomY = random(500);
    scaleW = 0;
    scaleH = 0;
  }
  else if (!(s % 2 ==0))
  {
    scaleW = 20;
    scaleH = 20;
  }

  
  ball_x += ball_dir * 1.0;
  ball_y += dy;
  
  ball2_x += ball2_dir * 1.0;
  ball2_y += balldy2;
  
  moveX += (right - left) * moveSpeed;
  moveY += (up - down) * moveSpeed;
  
  //Ball One Properties
  if (ball_x > width-(ballSize/2))
  {
    ball_dir *= -1;
    
    
    //ball_x = -width/2 - ballSize;
    //ball_y = random(0, height);
    //dy = 0;
  }
  
  if (ball_x < (ballSize/2))
  {
    ball_dir = ball_dir * -1;
  }
  
  if (ball_y > height-(ballSize/2))
  {
    dy = dy * -1;
    //ball_dir = ball_dir * -1;
  }
  
  if (ball_y < (ballSize/2))
  {
    dy = dy * -1;
    //ball_dir = ball_dir * -1;
  }
  
  // Ball 2 Properties 
  if (ball2_x > width-(ball2Size/2))
  {
    ball2_dir *= -1;
    
    
    //ball_x = -width/2 - ballSize;
    //ball_y = random(0, height);
    //dy = 0;
  }
  
  if (ball2_x < (ball2Size/2))
  {
    ball2_dir = ball2_dir * -1;
  }
  
  if (ball2_y > height-(ball2Size/2))
  {
    balldy2 = balldy2 * -1;
    //ball_dir = ball_dir * -1;
  }
  
  if (ball2_y < (ball2Size/2))
  {
    balldy2 = balldy2 * -1;
    //ball_dir = ball_dir * -1;
  }
  
  
  //Shapes
  fill(255, 0, 0);
  ellipse(ball_x, ball_y, ballSize, ballSize);
  ellipse(ball2_x, ball2_y, ball2Size, ball2Size);
  fill(0, 0, 255);
  rect(moveX, moveY, squareSize, squareSize);
  fill(0, 255, 0);
  ellipse(randomX, randomY, scaleW, scaleH);
  
  //GUI
  text("Time:", timeX, timeY);
  text(counter, counterX, counterY);
  text("Score:", scoreTxTX, scoreTxTY);
  text(score, scoreX, scoreY);
  
  if (counter > 10)
  {
    text("FINAL SCORE:", 150, 250);
    score = score; 
    text(score, 250, 250);
    squareSize = 0;
    ballSize = 0;
    scaleW = 0;
    scaleH = 0;
    ball2Size = 0;
    timeX = 600;
    counterX = 600;
    scoreTxTX = 600;
    scoreX = 600;
    randomX = 600;
  }
 
  
  
  // Collisions 
  boolean collisionDetected = isCollidingCircleRectangle(ball_x, ball_y, (ballSize/2), moveX, moveY, squareSize);
  
  if (collisionDetected == true)
  {
    score--;
  }
  else
  {
    fill (255);
  }
  
  boolean collisionDetected2 = isCollidingCircleRectangle(ball2_x, ball2_y, (ball2Size/2), moveX, moveY, squareSize);
  
  if (collisionDetected2 == true)
  {
    score--;
  }
  else
  {
    fill (255);
  }
  
  boolean collisionDetected3 = isCollidingCircleRectangle(randomX, randomY, (scaleW), moveX, moveY, squareSize);
  {
    if (collisionDetected3 == true)
    {
      score++;
    }
  }

}

// Movement
void keyReleased()
{
  if (key == 's' || key == 'S')
  {
    up = 0;
  }
  
  if (key == 'w' || key == 'W')
  {
    down = 0;
  }
  
  if (key == 'a' || key == 'A')
  {
    left = 0;
  }
  
  if (key == 'd' || key == 'D')
  {
    right = 0;
  }
}

void keyPressed()
{
  if (key == 's' || key == 'S')
  {
    up = 1;
  }
  if (key == 'w' || key == 'W')
  {
    down = 1;
  }
  if (key == 'a' || key == 'A')
  {
    left = 1;
  }
  if (key == 'd' || key == 'D')
  {
    right = 1;
  }
    
}


//Collision Expression
boolean isCollidingCircleRectangle(float circleX, float circleY, float radius, float rectX, float rectY, float rectS)
  {
   float circleDistanceX = abs(circleX - rectX - rectS/2);
   float circleDistanceY = abs(circleY - rectY - rectS/2);
   
   if (circleDistanceX > (rectS/2 + radius))
   {
     return false;
   }
   
   if (circleDistanceY > (rectS/2 + radius))
   {
     return false;
   }
   
   if (circleDistanceX <= (rectS/2))
   {
     return true;
   }
   
   if (circleDistanceY <= (rectS/2))
   {
     return true;
   }
   
   float cornderDistance_sq = pow(circleDistanceX - rectS/2, 2) + pow(circleDistanceY - rectS/2, 2);
   
   return (cornderDistance_sq <= pow(radius,2));
  }

boolean rectRectIntersect(float left, float top, float right, float bottom, float otherLeft, float otherTop, float otherRight, float otherBottom)
{
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}




ArrayList<Ball> balls;

void setup()
{
  size(500, 500);
  balls = new ArrayList<Ball>();
  balls.add(new Ball(250, 25));
  noStroke();
}

void draw()
{ 
  background(100);
  for (int i = balls.size()-1; i >=0; i--) 
  {
    Ball ball= balls.get(i);
    ball.update();
    if (ball.ballX > width+ball.ballW/2 || ball.ballX < 0-ball.ballW/2) {
      balls.remove(i);
    }
  }
}

void mousePressed() 
{
  /*for (int i = balls.size()-1; i >=0; i--) 
  {
    Ball ball= balls.get(i);
    if (ball.touch == false)
    {*/
      balls.add(new Ball(mouseX, mouseY));
    //}
  //}
}

class Ball { 
  float ballX, ballY; 
  float accelVal = 0;
  float dx = random(-1, 1);
  float dxOrig = dx;
  float ballW = random(10, 100);
  float ballH = ballW;
  float lastY;
  color c = color( random(255), random(255), random(255) ) ;
  boolean touch = false;
  boolean grab = false; 


  Ball (float xx, float yy) 
  {  
    ballX = xx; 
    ballY = yy;
  } 



  void update() 
  { 
    accelVal += .5;
    ballY += accelVal;
    ballX += dx;
    if (ballY > height-ballH/2)
    {
      ballY = height-ballH/2;
    }
    if (ballY == height-ballH/2)
    {
      accelVal -= accelVal/10;
      accelVal = -accelVal;
      //flattener += 1;
    }
    if (accelVal == 0 )
    {
      accelVal = -accelVal;
    }  
    fill(255); 
    if (lastY == ballY) 
    {
      if (dx > 0)
      {
        dx -= .1;
        if (dx <= 0)
        {
          dx = 0;
        }
      }   
      if (dx < 0)
      {
        dx += .1;
        if (dx >= 0)
        {
          dx = 0;
        }
      }
    }
    lastY = ballY;

    if (mouseX > ballX-ballW/2 && mouseX < ballX+ballW/2 && mouseY > ballY-ballH/2 && mouseY < ballY+ballH/2)
    {
      fill(255);
      touch = true;
    }
    else
    {
      fill(c);
      touch = false;
    }
    ellipse(ballX, ballY, ballW, ballH);

    if (touch == true)
    {
      if (mousePressed) {
        grab = true;
        ballX = mouseX;
        ballY = mouseY;
        
        //dx = dxOrig;
        accelVal = 0;
        //dx = 0;
        touch = false;
      }
    }
    else {grab = false; touch = false;}
  }
} 



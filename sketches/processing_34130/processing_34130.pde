
//movingLoops - allonestring - aug2011

int numLoops = 7;
int numBalls = 7; //must be at least 3
Ball[]balls = new Ball[numBalls];
int radius = 5;
float vel = 5;
int outsideStage = 200;

int displayBalls = 1;
int displayMidpoints = 1;
int displayLoops = numLoops;
int slowDown = 1;

void setup()
{
  size(600, 600);
  background(255);
  smooth();
  noFill();
  
  for(int b = 0; b < numBalls; b++)
  {
    float startX = random(-outsideStage, width + outsideStage);
    float startY = random(-outsideStage, height + outsideStage);
    balls[b] = new Ball(startX, startY, random(-vel, vel), random(-vel, vel), radius, 0);
  }
}

void draw()
{
  background(255);
  
  for(int b = 0; b < numBalls; b++)
  {
    balls[b].move();
    checkWalls(balls[b], -outsideStage, width + outsideStage, -outsideStage, height + outsideStage);
  }
  findMidpoints(balls);
}

void keyPressed()
{
  if(keyCode == 'b' || keyCode == 'B')
  {
    displayBalls *= -1;
  }
  if(keyCode == 'm' || keyCode == 'M')
  {
    displayMidpoints *= -1;
  }
  if(keyCode == 'v' || keyCode == 'V')
  {
    slowDown *= -1;
    float speedFactor;
    if(slowDown == -1) speedFactor = 0.2;
    else speedFactor = 5;
    for(int b = 0; b < numBalls; b++)
    {
      balls[b].vx *= speedFactor;
      balls[b].vy *= speedFactor;
    }
  }
  if(keyCode == 'a' || keyCode == 'A')
  {
    displayLoops++;
    int tempCount = min(10, displayLoops);
    displayLoops = tempCount;
  }
  if(keyCode == 's' || keyCode == 'S')
  {
    displayLoops--;
    int tempCount = max(1, displayLoops);
    displayLoops = tempCount;
  }
}

void findMidpoints(Ball[]balls)
{
  PVector[][]midPoints = new PVector[displayLoops][numBalls];
  for(int b = 0; b < numBalls; b++)
  {
    if(displayBalls == -1) 
    {
      noStroke();
      balls[b].display();
    }
    float tempx = (balls[b].x + balls[(b+1)%numBalls].x) / 2;
    float tempy = (balls[b].y + balls[(b+1)%numBalls].y) / 2;
    midPoints[0][b] = new PVector(tempx, tempy);
  }
  for(int p = 1; p < displayLoops; p++)
  {
    for(int b = 0; b < numBalls; b++)
    {
      float tempx = (midPoints[p-1][b].x + midPoints[p-1][(b+1)%numBalls].x) / 2;
      float tempy = (midPoints[p-1][b].y + midPoints[p-1][(b+1)%numBalls].y) / 2;
      midPoints[p][b] = new PVector(tempx, tempy);
    }
  }
  for(int p = displayLoops - 1; p >= 0; p--)
  {
    noFill();
    stroke(255 - (p * 255 / displayLoops), 0, 0);
    strokeWeight(p+1);
    drawLoops(midPoints[p]);
  }
}

void drawLoops(PVector[]mid)
{
  beginShape();
  for(int b = 0; b < numBalls; b++)
  {
    if(displayMidpoints == -1)
    {
      fill(0);
      ellipse(mid[b].x, mid[b].y, 5, 5);
      noFill();
    }
    curveVertex(mid[b].x, mid[b].y);
  }
  for(int b = 0; b < 3; b++)
  {
    curveVertex(mid[b].x, mid[b].y);
  }
  endShape();
}

class Ball
{
  float x, y;
  float vx, vy;
  float radius;
  color colour = color(0, 0, 255);
  float bounce = -1; 
  
  Ball(float x, float y, float vx, float vy, float radius, color colour) 
  {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.radius = radius;
    this.colour = colour;
  }
  
  void move()
  {
    y += vy;
    x += vx;
  }
  
  void display()
  {
    fill(colour);
    ellipse(x, y, radius * 2, radius * 2);
  } 
}

void checkWalls(Ball ball, float leftEdge, float rightEdge, float topEdge, float bottomEdge)
{
  if(ball.x + ball.radius > rightEdge)
  {
    ball.x = rightEdge - ball.radius;
    ball.vx *= ball.bounce;
  }
  else if(ball.x < leftEdge + ball.radius)
  {
    ball.x = leftEdge + ball.radius;
    ball.vx *= ball.bounce;
  }
  else if(ball.y > bottomEdge - ball.radius)
  {
    ball.y = bottomEdge - ball.radius;
    ball.vy *= ball.bounce;
  }
  else if(ball.y < topEdge + ball.radius)
  {
    ball.y = topEdge + ball.radius;
    ball.vy *= ball.bounce;
}
}  



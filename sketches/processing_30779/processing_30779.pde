
// nodeGarden using vectors
int numBalls = 53;
Ball[]balls = new Ball[numBalls];
color[]colours = new color[numBalls];
int minRadius = 2;
int maxRadius = 20;

void setup()
{
  size(600, 400);
  smooth();
  noStroke();
  for(int i = 0; i < numBalls; i++)
  {
    float radius = random(minRadius, maxRadius);
    colours[i] = color(0, map(radius, minRadius, maxRadius, 255, 50), map(radius, minRadius, maxRadius, 50, 255));
    PVector startPosition = new PVector(random(width), random(height));
    PVector startVelocity = new PVector(random(-4, 4), random(-4, 4));
    balls[i] = new Ball(startPosition, startVelocity, radius, colours[i]);
    balls[i].bounce = -1;
    balls[i].mass = radius;
  }
}
void draw()
{
  background(255);
  noStroke();
  for(int i = 0; i < numBalls; i++)
  {
    balls[i].move();
    balls[i].display();
    checkWalls(balls[i]);
    balls[i].velocity.limit(maxRadius - balls[i].radius);
  }
  for(int i = 0; i < numBalls - 1; i++)
  {
    for(int j = i + 1; j < numBalls; j++)
    {
      checkCollision(balls[i], balls[j]);
      spring(balls[i], balls[j]);
    }
  }
}

// Ball class
class Ball
{
  PVector position;
  PVector velocity;
  float radius;
  color colour = color(0, 0, 255);
  
  float mass = radius; //1.0;
  float gravity = 0.0;
  float bounce = -1; // default = -0.6
  
 
  // default constructor
/*  Ball() 
  {
  }*/

  Ball(PVector position, PVector velocity, float radius, color colour) 
  {
    this.position = position;
    this.velocity = velocity;
    this.radius = radius;
    this.colour = colour;
  }
  
  void move()
  {
    velocity.y = velocity.y + gravity;
    position.y += velocity.y;
    position.x += velocity.x;
  }
  
  void display()
  {
    fill(colour);
    ellipse(position.x, position.y, radius * 2, radius * 2);
  } 
}

void checkCollision(Ball ball0, Ball ball1)
{
  float dx = ball1.position.x - ball0.position.x;
  float dy = ball1.position.y - ball0.position.y;
  float dist = sqrt(dx*dx + dy*dy);
  
  if(dist < ball0.radius + ball1.radius)
  {
    //calculate angle, sine and cosine
    float angle = atan2(dy, dx);
    float sine = sin(angle);
    float cosine = cos(angle);
    
    //rotate ball0's position
    PVector pos0 = new PVector(0, 0);
    
    //rotate ball1's position
    PVector pos1 = rotateC(dx, dy, sine, cosine, true);
    
    //rotate ball0's velocity
    PVector vel0 = rotateC(ball0.velocity.x, ball0.velocity.y, sine, cosine, true);
    
    //rotate ball1's velocity
    PVector vel1 = rotateC(ball1.velocity.x, ball1.velocity.y, sine, cosine, true);
    
    //collision reaction
    float vxTotal = vel0.x - vel1.x;
    vel0.x = ((ball0.mass - ball1.mass) * vel0.x + 2 * ball1.mass * vel1.x) / (ball0.mass + ball1.mass);
    vel1.x = vxTotal + vel0.x;
    
    //update positions
    float absV = abs(vel0.x) + abs(vel1.x);
    float overlap = (ball0.radius + ball1.radius) - abs(pos0.x - pos1.x);
    pos0.x += vel0.x / absV * overlap;
    pos1.x += vel1.x / absV * overlap;
    
    //rotate positions back
    PVector pos0F = rotateC(pos0.x, pos0.y, sine, cosine, false);
    PVector pos1F = rotateC(pos1.x, pos1.y, sine, cosine, false);
    
    //adjust positions to actual screen positions
    ball1.position.x = ball0.position.x + pos1F.x;
    ball1.position.y = ball0.position.y + pos1F.y;
    ball0.position.x = ball0.position.x + pos0F.x;
    ball0.position.y = ball0.position.y + pos0F.y;
    
    //rotate velocties back
    PVector vel0F = rotateC(vel0.x, vel0.y, sine, cosine, false);
    PVector vel1F = rotateC(vel1.x, vel1.y, sine, cosine, false);
    
    ball0.velocity.x = vel0F.x;
    ball0.velocity.y = vel0F.y;
    ball1.velocity.x = vel1F.x;
    ball1.velocity.y = vel1F.y;
  }
}

PVector rotateC(float x, float y, float sine, float cosine, boolean anticlock)
{
  PVector result = new PVector(0, 0);
  
  if(anticlock)
  {
    result.x = x * cosine + y * sine;
    result.y = y * cosine - x * sine;
  }
  else
  {
    result.x = x * cosine - y * sine;
    result.y = y * cosine + x * sine;
  }
  return result;
}
    
void checkWalls(Ball ball)
{
  if(ball.position.x + ball.radius > width)
  {
    ball.position.x = width - ball.radius;
    ball.velocity.x *= ball.bounce;
  }
  else if(ball.position.x < ball.radius)
  {
    ball.position.x = ball.radius;
    ball.velocity.x *= ball.bounce;
  }
  else if(ball.position.y > height - ball.radius)
  {
    ball.position.y = height - ball.radius;
    ball.velocity.y *= ball.bounce;
  }
  else if(ball.position.y < ball.radius)
  {
    ball.position.y = ball.radius;
    ball.velocity.y *= ball.bounce;
  }
}  
float minDist = 100;
float springAmount = 0.0001;

void spring(Ball ballA, Ball ballB)
{
  float dx = ballA.position.x - ballB.position.x;
  float dy = ballA.position.y - ballB.position.y;
  float dist = sqrt(dx*dx + dy*dy);
  
  if(dist < minDist)
  {
    PVector a = new PVector(dx * springAmount, dy * springAmount);
//    float ax = dx * springAmount;
//    float ay = dy * springAmount;
    ballA.velocity.x += a.x / ballA.mass;
    ballA.velocity.y += a.y / ballA.mass;
    ballB.velocity.x -= a.x / ballB.mass;
    ballB.velocity.y -= a.y / ballB.mass;
    
    strokeWeight(1);
    stroke(0, 255, 128, 255 * (1 - dist / minDist));
    line(ballA.position.x, ballA.position.y, ballB.position.x, ballB.position.y);
    
  }
}
void wrapWalls(Ball ball)
{
  if(ball.position.x > width)
  {
    ball.position.x = 0;
  }
  else if(ball.position.x < 0)
  {
    ball.position.x = width;
  }
  if(ball.position.y > height)
  {
    ball.position.y = 0;
  }
  else if(ball.position.y < 0)
  {
    ball.position.y = height;
  }
}  



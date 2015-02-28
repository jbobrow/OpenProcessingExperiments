
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/105533*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
//multi-segment reach
//from Making things move by Keith Peters
//with stuff tidied into classes
//Sal Spring - august 2013
//allonestring

Arm[] arms;
int numArms = 3;
int numSegs = 4;

Ball[] balls;
int numBalls = 5;
float rad = 20;
float v = 2;


void setup()
{
  size(500, 500);
  background(255);
  smooth();

  arms = new Arm[numArms];
  PVector dim = new PVector(30, 15);
  for (int a = 0; a < numArms; a++)
  {
    float xpos = 20 + (width - 40) / (numArms - 1) * a; 
    PVector pos = new PVector(xpos, height - 20);
    arms[a] = new Arm(pos, dim, numSegs);
  }

  balls = new Ball[numBalls];
  float dia = rad * 2;
  for (int b = 0; b < numBalls; b++)
  {
    
    PVector bpos = new PVector(random(dia, width - dia), random(dia, height - dia));
    PVector bvel = new PVector(random(-v, v), random(-v, v));
    color colour = color(random(255), random(255), random(255));
    balls[b] = new Ball(bpos, bvel, rad, colour);
  }
}

void draw()
{
  background(255);

  for (int b = 0; b < numBalls; b++)
  {
    balls[b].update();
    balls[b].display();
  }
  for (int b = 0; b < numBalls - 1; b++)
  {
    for (int c = b + 1; c < numBalls; c++)
    {
      balls[b].checkCollision(balls[c]);
    }
  }


  for (int a = 0; a < numArms; a++)
  {
    Ball nearestBall = arms[a].findNearest(balls);
    arms[a].reach(nearestBall.pos);
    arms[a].playCatch(nearestBall);
    arms[a].display();
  }
}

void mousePressed()
{
  int oneBall = (int)random(numBalls);
  balls[oneBall].pos = new PVector(mouseX, mouseY);
}

class Arm
{
  Segment[] segments;
  int numSegs = 5;
  PVector pos, dim;
  
  Arm(PVector pos, PVector dim, int numSegs)
  {
    this.pos = pos;
    this.dim = dim;
    this.numSegs = numSegs;
    makeArm();
  }
    

  void makeArm()
  {
    segments = new Segment[numSegs];
    for (int s = numSegs - 1; s >= 0; s--)
    {
      color colour = color(random(128), random(128), random(128));
      segments[s] = new Segment(dim, colour);
      if (s == numSegs-1) segments[s].pos = pos;
      else segments[s].pos = segments[s+1].getPin();
    }
  }

  void display()
  {
    for (int s = 0; s < numSegs; s++)
    {
      segments[s].display();
      segments[s].getPin();
    }
  }
  
  void reach(PVector theTarget)
  {
    PVector target = segments[0].reachFor(theTarget);
    for (int s = 1; s < numSegs; s++)
    {
      target = segments[s].reachFor(target);
    }

    for (int s = numSegs - 1; s > 0; s--)
    {
      segments[s-1].setPos(segments[s]);
    }
  }
  void playCatch(Ball ball)
  {
    segments[0].playCatch(ball);
  }
  
  Ball findNearest(Ball[] balls)
  {
    float closest = width*width + height*height;
    int nearest = -1;
    for(int b = 0; b < balls.length; b++)
    {
      float thisDist = dist(pos.x, pos.y, balls[b].pos.x, balls[b].pos.y);
      if(thisDist < closest)
      {
        closest = thisDist;
        nearest = b;
      }
    }
    return balls[nearest];
  }
}
class Ball
{
  PVector pos, vel;
  float friction = 0.1;
  float rad;
  float mass;
  color colour;

  Ball(PVector pos, PVector vel, float rad, color colour)
  {
    this.pos = pos;
    this.vel = vel;
    this.rad = rad;
    this.mass = rad;
    this.colour = colour;
  }

  void display()
  {
    noStroke();
    fill(colour);

    ellipse(pos.x, pos.y, rad*2, rad*2);
  }

  void update()
  {
    vel.limit(5);
    if (pos.x + vel.x > width - rad || pos.x + vel.x < rad) vel.x *= -1;
    if (pos.y + vel.y > height - rad || pos.y + vel.y < rad) vel.y *= -1;

    pos.add(vel);
  }

  void checkCollision(Ball otherBall)
  {
    float dx = otherBall.pos.x - this.pos.x;
    float dy = otherBall.pos.y - this.pos.y;
    float dist = sqrt(dx*dx + dy*dy);

    if (dist < this.rad + otherBall.rad)
    {
      //calculate angle, sine and cosine
      float angle = atan2(dy, dx);
      float sine = sin(angle);
      float cosine = cos(angle);

      //rotate this's position
      PVector pos0 = new PVector(0, 0);

      //rotate otherBall's position
      PVector pos1 = rotateC(dx, dy, sine, cosine, true);

      //rotate this's velocity
      PVector vel0 = rotateC(this.vel.x, this.vel.y, sine, cosine, true);

      //rotate otherBall's velocity
      PVector vel1 = rotateC(otherBall.vel.x, otherBall.vel.y, sine, cosine, true);

      //collision reaction
      float vxTotal = vel0.x - vel1.x;
      vel0.x = ((this.mass - otherBall.mass) * vel0.x + 2 * otherBall.mass * vel1.x) / (this.mass + otherBall.mass);
      vel1.x = vxTotal + vel0.x;

      //update positions
      float absV = abs(vel0.x) + abs(vel1.x);
      float overlap = (this.rad + otherBall.rad) - abs(pos0.x - pos1.x);
      pos0.x += vel0.x / absV * overlap;
      pos1.x += vel1.x / absV * overlap;

      //rotate positions back
      PVector pos0F = rotateC(pos0.x, pos0.y, sine, cosine, false);
      PVector pos1F = rotateC(pos1.x, pos1.y, sine, cosine, false);

      //adjust positions to actual screen positions
      otherBall.pos.x = this.pos.x + pos1F.x;
      otherBall.pos.y = this.pos.y + pos1F.y;
      this.pos.x = this.pos.x + pos0F.x;
      this.pos.y = this.pos.y + pos0F.y;

      //rotate velocties back
      PVector vel0F = rotateC(vel0.x, vel0.y, sine, cosine, false);
      PVector vel1F = rotateC(vel1.x, vel1.y, sine, cosine, false);

      this.vel.x = vel0F.x;
      this.vel.y = vel0F.y;
      otherBall.vel.x = vel1F.x;
      otherBall.vel.y = vel1F.y;
    }
  }

  PVector rotateC(float x, float y, float sine, float cosine, boolean anticlock)
  {
    PVector result = new PVector(0, 0);

    if (anticlock)
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
}

class Segment
{
  PVector pos;
  PVector dim;
  float rot = 0;
  color colour;

  Segment(PVector dim, color colour)
  {
    this.dim = dim;
    this.colour = colour;
  }

  void display()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(rot);
    noStroke();
    fill(colour);
    rect(-dim.y/2, -dim.y/2, dim.x + dim.y, dim.y, dim.y/2, dim.y/2, dim.y/2, dim.y/2);

    fill(0);
    ellipse(0, 0, 5, 5);
    popMatrix();
  }

  PVector getPin()
  {
    float pinx = pos.x + cos(rot) * dim.x;
    float piny = pos.y + sin(rot) * dim.x;
    fill(255);
    ellipse(pinx, piny, 5, 5);
    return new PVector(pinx, piny);
  }

  void rotateTo(PVector target)
  {
    float dx = target.x - pos.x;
    float dy = target.y - pos.y;
    rot = atan2(dy, dx);
  }

  void drag(PVector target)
  {
    rotateTo(target);

    float w = getPin().x - pos.x;
    float h = getPin().y - pos.y;
    pos.x = target.x - w;
    pos.y = target.y - h;
  }
  
  PVector reachFor(PVector target)
  {
    rotateTo(target);

    float w = getPin().x - pos.x;
    float h = getPin().y - pos.y;
    float tx = target.x - w;
    float ty = target.y - h;
    return new PVector(tx, ty);
  }
  
  void setPos(Segment otherSeg)
  {
    this.pos = otherSeg.getPin();
  }
  
  void playCatch(Ball ball)
  {
    if(dist(getPin().x, getPin().y, ball.pos.x, ball.pos.y) < ball.rad)
    {
      ball.vel.x += random(-1, 1);
      ball.vel.y -= 1;
    }
  }
}




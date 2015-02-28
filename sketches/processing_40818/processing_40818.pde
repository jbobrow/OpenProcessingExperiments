
//ball bounce
//off other moving balls
//off (moving) lines (here created as vectorLines)
//off stationary balls (here called rings) by treating tangent at point of collision as a line
//off ends of lines by treating them as semi-rings
//Sal Spring - allonestring - sept 2011

//I found these two websites very useful
//http://sebleedelisle.com/2010/01/predicting-circle-line-collisions/
//http://www.tonypa.pri.ee/vectors/tut11.html

int numBalls = 7;
Ball[] balls;
float radius = 5;

Ball bigRing;
float bigRadius = 150;
int numRings = 4;
Ball[] smallRings;
float smallRadius = 35;
float smallRingDistance = 150;

int numLines = 4;
VectorLine[] lines;
float lineLength = 200;
float lineWidth = 20;
float lineDistance = 360;

int numWalls = 4;
VectorLine[] walls;

//BRILL!

void setup()
{
  size(600, 600);
//  frameRate(12);
  background(64);
  smooth();
  
  balls = new Ball[numBalls];
  for(int b = 0; b < numBalls; b++)
  {
    PVector position = new PVector(random(radius, width-radius), random(radius, height-radius));
    PVector velocity = new PVector(random(-5, 5), random(-5, 5));
    color colour = color(random(224, 255), random(206, 240), random(192, 224));
    balls[b] = new Ball(position, velocity, radius + random(5, 10), colour);
  }

  lines = new VectorLine[numLines];
  float lineOffset = lineLength + 2 * radius;
  for(int v = 0; v < numLines; v++)
  {
    float xbit = width/2 + lineDistance * cos(v * TWO_PI/numLines + QUARTER_PI);
    float ybit = height/2 + lineDistance * sin(v * TWO_PI/numLines + QUARTER_PI);
    PVector linePosition = new PVector(xbit, ybit);
    lines[v] = new VectorLine(linePosition, lineLength, lineWidth);
    lines[v].pivotType = "FLIPPER";
    lines[v].colour = color(random(32, 64), random(64, 96), random(64, 96));
    lines[v].rotation = (v*HALF_PI + 5*QUARTER_PI) % TWO_PI;
    if(v % 2 == 0) lines[v].rotationInc = 0.003;
    else lines[v].rotationInc = -0.003;
  }
  
  smallRings = new Ball[numRings];
  for(int r = 0; r < numRings; r++)
  {
    float xbit = width/2 + smallRingDistance * cos(r * TWO_PI/numRings);
    float ybit = height/ 2 + smallRingDistance * sin(r * TWO_PI/numRings);
    PVector smallRingPosition = new PVector(xbit, ybit);
    color colour = color(random(64, 96), random(64, 96), random(32, 64));
    smallRings[r] = new Ball(smallRingPosition, new PVector(0, 0), smallRadius, colour);
  }
  
  PVector ringPosition = new PVector(width / 2, height / 2);
  bigRing = new Ball(ringPosition, new PVector(0, 0), bigRadius, color(64, 64, 64));
  
  walls = new VectorLine[numWalls];
  walls[0] = new VectorLine(new PVector(width/2, 0), width, 0);
  walls[1] = new VectorLine(new PVector(width, height/2), height, 0);
  walls[2] = new VectorLine(new PVector(width/2, height), width, 0);
  walls[3] = new VectorLine(new PVector(0, height/2), height, 0);
  for(int w = 0; w < numWalls; w++)
  {
    walls[w].rotation = w * HALF_PI;
  }
}

void draw()
{
  fill(0, 12);
  noStroke();
  rect(0, 0, width, height);

  stroke(48, 80, 80);
  strokeWeight(2);
  noFill();
  ellipse(width/2, height/2, 2*bigRadius, 2*bigRadius);

  for(int r = 0; r < numRings; r++)
  {
    ellipse(smallRings[r].position.x, smallRings[r].position.y, 2*smallRadius, 2*smallRadius);
//    smallRings[r].display();
  }
  
  for(int b = 0; b < numBalls; b++)
  {
    balls[b].display();
    balls[b].move();
    doRingCollision(balls[b], bigRing);
    for(int v = 0; v < numLines; v++)
    {
      balls[b].lineBounce(lines[v]);
    }
    for(int w = 0; w < numWalls; w++)
    {
      balls[b].lineBounce(walls[w]);
    }
    for(int r = 0; r < numRings; r++)
    {
      doRingCollision(balls[b], smallRings[r]);
    }
  }
  for(int v = 0; v < numLines; v++)
  {
    lines[v].display();
    lines[v].rotation += lines[v].rotationInc;
    float maxRotation;
    if(v == 1) maxRotation = TWO_PI;
    else maxRotation = (3*PI/2 + v*HALF_PI) % TWO_PI;
    float minRotation = (PI + v*HALF_PI) % TWO_PI; 
    if((lines[v].rotation > maxRotation) || (lines[v].rotation < minRotation))
    {
      lines[v].rotationInc *= -1;
    }
  }
  if(numBalls > 1)
  {
    for(int b = 0; b < numBalls -1; b++)
    {
      for(int c = b + 1; c < numBalls; c++)
      {
        doBallCollision(balls[b], balls[c]);
      }
    }
  }
}

void mouseDragged()
{
  for(int b = 0; b < numBalls; b++)
  {
    if(dist(mouseX, mouseY, balls[b].position.x, balls[b].position.y) < balls[b].radius*2)
    {
      PVector newPosition = new PVector(mouseX, mouseY);
      //trap for dragging offstage
      if(newPosition.x < 0 || newPosition.x > width) newPosition.x = width/2;
      if(newPosition.y < 0 || newPosition.y > height) newPosition.y = height/2;
      balls[b].position = newPosition;
    }
  }
}
class Ball
{
  float radius;
  PVector position;
  PVector velocity;
  color colour;
  PVector gravity = new PVector(0, 0.1);
  float bounce = -1;//-0.6;
  float mass;
  
  Ball(PVector position, PVector velocity, float radius, color colour)
  {
    this.position = position;
    this.velocity = velocity;
    this.radius = radius;
    this.colour = colour;
    this.mass = radius;
  }
  
  void move()
  {
//    velocity.add(gravity);
    position.add(velocity);
    velocity.limit(5);
  }
  
  void display()
  {
    noStroke();
    fill(colour);
    ellipse(position.x, position.y, 2*radius, 2*radius);
  }

  void lineBounce(VectorLine vLine)
  {
    //line stuff
    PVector lineStart = vLine.getOneEnd();
    PVector lineEnd = vLine.getOtherEnd();
    PVector theLine = new PVector(lineStart.x - lineEnd.x, lineStart.y - lineEnd.y);
    //------lineStart
    PVector start2ball = new PVector(position.x - lineStart.x, position.y - lineStart.y);
    float dpStart = theLine.dot(start2ball);
    //------lineEnd    
    PVector end2ball = new PVector(lineEnd.x - position.x, lineEnd.y - position.y);
    float dpEnd = theLine.dot(end2ball);
    
    //------line middle
    //find normal to vectorLine and set in to unit length
    PVector lineNormal = new PVector(-(lineStart.y - lineEnd.y), lineStart.x - lineEnd.x);
    lineNormal.normalize();
    //we already have start2ball joining lineStart to ballCentre
    //find dot product of start2ball and normalised normal
    float ballDOTnormal = start2ball.dot(lineNormal);
    
    //------check collision with lineStart and lineEnd
    if(dpStart > 0) 
    {
      if(start2ball.mag() < radius + vLine.lineWidth/2)
      {
        Ball lineStartBall = new Ball(lineStart, new PVector(0, 0), vLine.lineWidth, color(0));
        doRingCollision(this, lineStartBall);
//        colour = color(255, 0, 0);
      }
    }
    else if(dpEnd > 0) 
    {
      if(end2ball.mag() < radius + vLine.lineWidth/2)
      {
        Ball lineEndBall = new Ball(lineEnd, new PVector(0, 0), vLine.lineWidth, color(0));
        doRingCollision(this, lineEndBall);
//        colour = color(0, 255, 0);
      }
    }
    //------check collision between the two ends    
    //if start2ball dot normalToLine < radius then collision
    else if(abs(ballDOTnormal) < radius + vLine.lineWidth/2)
    {
//      colour = color(0, 0, 255);
      doLineCollision(this, vLine);
    }
  }
}
//line in space centred on centre and drawn out to one end and the other end
class VectorLine
{
  PVector position;
  float lineLength;
  float lineWidth;
  float rotation = 0;
  float rotationInc;
  color colour = (255);
  String pivotType;
  
  VectorLine(PVector position, float lineLength, float lineWidth)
  {
    this.position = position;
    this.lineLength = lineLength;
    this.lineWidth = lineWidth;
    this.rotation = rotation;
    this.rotationInc = rotationInc;
    this.colour = colour;
  }
  
  void display()
  {
    fill(colour);
    noStroke();
    if(pivotType == "FLIPPER")
    {
      pushMatrix();
      translate(position.x, position.y);
      rotate(rotation);
      rect(0, -lineWidth/2, lineLength, lineWidth);
      ellipse(0, 0, lineWidth, lineWidth);
      ellipse(lineLength, 0, lineWidth, lineWidth);
      popMatrix(); 
    }
    else
    {
      pushMatrix();
      translate(position.x, position.y);
      rotate(rotation);
      rect(-lineLength/2, -lineWidth/2, lineLength, lineWidth);
      ellipse(-lineLength/2, 0, lineWidth, lineWidth);
      ellipse(lineLength/2, 0, lineWidth, lineWidth);
      popMatrix(); 
    }
  }
  void move()
  {
    position = new PVector(mouseX, mouseY);    
  }
  void rotateLine()
  {
    //can't use pvector as angleBetween() doesn't work as well as atan2
    float dx = position.x - mouseX;
    float dy = position.y - mouseY;
    float mouseAngle = atan2(dy, dx);
    rotation = mouseAngle;
  }
  float getRotation()
  {
    return rotation;
  }
  
  PVector getOneEnd()
  {
    if(pivotType == "FLIPPER")
    {
      return position;
    }
    else
    {
      float xbit = position.x - cos(rotation) * lineLength/2;
      float ybit = position.y - sin(rotation) * lineLength/2;
      return new PVector(xbit, ybit);
    }
  }
  PVector getOtherEnd()
  {
    if(pivotType == "FLIPPER")
    {
      float xbit = position.x + cos(rotation) * lineLength;
      float ybit = position.y + sin(rotation) * lineLength;
      return new PVector(xbit, ybit);
    }
    else
    {
      float xbit = position.x + cos(rotation) * lineLength/2;
      float ybit = position.y + sin(rotation) * lineLength/2;
      return new PVector(xbit, ybit);
    }
  }
}
void doBallCollision(Ball ballA, Ball ballB)
{
  //find vector joining the balls' centres and its normal
  //vjc and jcn respectively
  float xbit = ballA.position.x - ballB.position.x;
  float ybit = ballA.position.y - ballB.position.y;
  PVector vjc = new PVector(xbit, ybit);
  PVector jcn = new PVector(ybit, -xbit);
  
  float distance = vjc.mag();
  if(distance < ballA.radius + ballB.radius)
  {
    //find projections of balls' velocities onto vjc and jcn
    //projection = target * (vel DOT target)/target DOT target)
    //need a couple of dot products first
    float vjcDot = vjc.dot(vjc);
    float jcnDot = jcn.dot(jcn);
    
    float avelDOTvjc = ballA.velocity.dot(vjc);
    PVector aVel_vjc = PVector.mult(vjc, (avelDOTvjc / vjcDot));
    float bvelDOTvjc = ballB.velocity.dot(vjc);
    PVector bVel_vjc = PVector.mult(vjc, (bvelDOTvjc / vjcDot));
  
    float avelDOTjcn = ballA.velocity.dot(jcn);
    PVector aVel_jcn = PVector.mult(jcn, (avelDOTjcn / jcnDot));
    float bvelDOTjcn = ballB.velocity.dot(jcn);
    PVector bVel_jcn = PVector.mult(jcn, (bvelDOTjcn / jcnDot));
    
    //push balls away from each other 
    //so that they don't get stuck overlapping
    float absVel = aVel_vjc.mag() + bVel_vjc.mag();
    float overlap = (ballA.radius + ballB.radius) - distance;
    PVector aVel_overlap = PVector.mult(ballA.velocity, (overlap / absVel));
    PVector bVel_overlap = PVector.mult(ballB.velocity, (overlap / absVel));
    ballA.position.sub(aVel_overlap);
    ballB.position.sub(bVel_overlap);
  
    //collision using conservation of momentum 
    //and Newtons law of restitution 
    //(assume coefficient of restitution = 1)
    float sumMass = ballA.mass + ballB.mass;
    float dMass = ballA.mass - ballB.mass;
    
    //firstBit = (mass - other mass) * velocity
    //secondbit = (1 + coefficient of restitution) * other mass * other velocity
    //new velocity = (firstBit + secondBit) / sum of masses
    PVector firstBitA = PVector.mult(aVel_vjc, dMass);
    PVector secondBitA = PVector.mult(bVel_vjc, (2*ballB.mass));
    PVector topLineA = PVector.add(firstBitA, secondBitA);
    PVector newAvjc = PVector.div(topLineA, sumMass);
    PVector firstBitB = PVector.mult(bVel_vjc, -dMass);
    PVector secondBitB = PVector.mult(aVel_vjc, (2*ballA.mass));
    PVector topLineB = PVector.add(firstBitB, secondBitB);
    PVector newBvjc = PVector.div(topLineB, sumMass);
  
    //add (x, y) components of new velocity in direction of vjc
    //and existing velocity in direction of jcn
    ballA.velocity.x = newAvjc.x + aVel_jcn.x;
    ballA.velocity.y = newAvjc.y + aVel_jcn.y;
    ballB.velocity.x = newBvjc.x + bVel_jcn.x;
    ballB.velocity.y = newBvjc.y + bVel_jcn.y;
  }
}
  
void doLineCollision(Ball ball, VectorLine vLine)
{
  PVector lineStart = vLine.getOneEnd();
  PVector lineEnd = vLine.getOtherEnd();
  PVector start2ball = new PVector(ball.position.x - lineStart.x, ball.position.y - lineStart.y);
  
  //find normal to line and set it to unit length
  PVector normalToLine = new PVector(-(lineStart.y - lineEnd.y), lineStart.x - lineEnd.x);
  normalToLine.normalize();

  //to resolve overlap of ball and line
  //find vector representing the line
  PVector theLine = new PVector(lineStart.x - lineEnd.x, lineStart.y - lineEnd.y);
  //first: find dist from lineStart to ball along the line
  //project start2ball onto the line
  //need dot products
  float ballDOTline = start2ball.dot(theLine);
  float lineDOTline = theLine.dot(theLine);
  PVector ballProjectedOntoLine = PVector.mult(theLine, ballDOTline/lineDOTline);
  PVector projectionAddedToStart = PVector.add(lineStart, ballProjectedOntoLine);

  //second: find offset needed to negate overlap
  //to find out which side of the line the ball is
  //find dot product of start2ball and the normalised normal
  //it'll be negative or positive (one side of the line or the other)
  float ballDOTnormal = start2ball.dot(normalToLine);
  //normalised normalToLine multiplied by ballDOTnormal and normalised again
  PVector offsetFromLine = PVector.mult(normalToLine, ballDOTnormal);
  offsetFromLine.normalize();
  //normalised offsetFromLine multiplied by the radius
  offsetFromLine.mult(ball.radius + vLine.lineWidth/2);
  //set the ball's position to the distance from start plus the offset
  ball.position = PVector.add(projectionAddedToStart, offsetFromLine);
  
  PVector incidence = new PVector(-ball.velocity.x, -ball.velocity.y);
  //find dot product of incident vector and line normal 
  float incidenceDOTline = incidence.dot(normalToLine);
    
  //calculate reflection (assuming coefficient of restitution = 1)
  //reflection = (1 + coefficient of restitution) * normalToLine
  //             * (normalToLine DOT incidence) - incidence
  PVector temp = PVector.mult(normalToLine, (2*incidenceDOTline));
  ball.velocity = PVector.sub(temp, incidence);
//  velocity.limit(5);
}
void doRingCollision(Ball ball, Ball ring)
{
  //doLineCollsion with tangent to ring as the vectorLine 
  //no point in PVector as atan2 is better than PVector.angleBetween()
  float dx = ring.position.x - ball.position.x;
  float dy = ring.position.y - ball.position.y;
  float distance = sqrt(dx*dx + dy*dy);
  if((ring.radius < distance + ball.radius) && (distance < ring.radius + ball.radius))
  {
    float angle = atan2(dy, dx);
    float xbit = ring.position.x - ring.radius * cos(angle);
    float ybit = ring.position.y - ring.radius * sin(angle);

    PVector tangentPosition = new PVector(xbit, ybit);
    VectorLine tangent = new VectorLine(tangentPosition, 10, 1);
    tangent.rotation = angle + HALF_PI;

    doLineCollision(ball, tangent);
  }
}



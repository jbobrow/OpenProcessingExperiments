
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/96897*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
// kaleidoscope blobs
// Sal Spring
// allonestring.co.uk
// april 2013


//transformations made straightforward!
//translate to position
//scale to reflect
//rotate 
//draw the shape

Ball[][] balls;
int numShapes = 3;
int numBalls = 3;
color[] colours;
int v = 2;
int minShapes = 1;
int maxShapes = 7;
int minBalls = 3;
int maxBalls = 7;

VectorLine[] edges;
Ball outerRing;
float border = 10;
color bgcolour = 64;

boolean rotatingSystem = true;
float systemRotation = PI/10;
float systemRotOffset = 0;
float systemRotInc = PI/160;
float systemRotMultiplier = PI/320;

boolean reflect = true;
int numWedges = 5;
int minWedges = 3;
int maxWedges = 9;


void setup()
{
  size(500, 500);
  background(bgcolour);
  smooth();

  //blobs
  balls = new Ball[maxShapes][maxBalls];
  colours = new color[maxShapes];
  for (int s = 0; s < maxShapes; s++)
  {
    for (int b = 0; b < maxBalls; b++)
    {
      PVector pos = new PVector(50, 25);
      PVector vel = new PVector(random(-v, v), random(-v, v));
      balls[s][b] = new Ball(pos, vel, 6, 0);
    }
    colours[s] = color(random(96, 192), random(96, 192), random(96, 192));
  }
  
  //boundaries
  edges = new VectorLine[2];
  //top edge
  edges[0] = new VectorLine(new PVector(width/4, 0), width/2, 1);
  edges[0].rotation = 0;
  //angled wedge edge
  edges[1] = new VectorLine(new PVector(0, 0), width, 1);
  if (reflect) edges[1].rotation = TWO_PI / (2 * numWedges);
  else edges[1].rotation = TWO_PI / numWedges;

  outerRing = new Ball(new PVector(0, 0), new PVector(0, 0), width/2 - border, 192);
}

void draw()
{
  background(bgcolour);
  fill(255);
  ellipse(width/2, height/2, width - 2*border, height - 2*border);

  for (int s = 0; s < numShapes; s++)
  {
    for (int b = 0; b < numBalls; b++)
    {
      balls[s][b].update();
      for (int e = 0; e < 2; e++)
      {
        balls[s][b].lineBounce(edges[e]);
      }
      doRingCollision(balls[s][b], outerRing);
    }

    drawWedges(colours[s], balls[s]);
  }

  if (rotatingSystem)
  {
    systemRotOffset += systemRotInc;
    systemRotation += abs(sin(systemRotOffset)) * systemRotMultiplier;
    systemRotation %= TWO_PI;
  }
  
//  if(frameCount % 55 == 0) saveFrame("output/shape-####.gif");
}

void keyPressed()
{
  //shape count
  if (keyCode == 'm' || keyCode == 'M') numShapes = min(numShapes + 1, maxShapes);
  if (keyCode == 'f' || keyCode == 'F') numShapes = max(numShapes - 1, minShapes);

  //wedge count
  if(keyCode == 'w' || keyCode == 'W') //fewer wider wedges
  {
    numWedges = max(numWedges - 1, minWedges);
    correctBallPositions(edges[1].rotation);
  }
  if (keyCode == 'n' || keyCode == 'N') //more narrower wedges
  {
    numWedges = min(numWedges + 1, maxWedges);
    correctBallPositions(edges[1].rotation);
  }
  
  //reflect or not
  if(keyCode == 'r' || keyCode == 'R')
  {
    reflect = !reflect;
    correctBallPositions(edges[1].rotation);
  }
  
  //ball counr
  if(keyCode == 'c' || keyCode =='C') numBalls = min(numBalls + 1, maxBalls);
  if(keyCode == 'p' || keyCode =='P') numBalls = max(numBalls - 1, minBalls);
  
  //system rotation or not
  if(keyCode == 's' || keyCode == 'S') rotatingSystem = !rotatingSystem;
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
  
  void update()
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
void drawWedges(color colour, Ball[] balls)
{
  if (reflect)
  {
    fill(getColour(balls[0]), 128);
    noStroke();
    pushMatrix();
    translate(width/2, height/2);
    rotate(systemRotation);

    for (int w = 0; w < 2*numWedges; w++)
    {
      if (w % 2 == 0)
      {
        //rotate to new position
        pushMatrix();
        rotate(w * TWO_PI / (2*numWedges));
        drawShapes(balls);
        popMatrix();
      }
      else
      {
        pushMatrix();
        //flip over x-axis, then rotate to new position
        scale(1, -1);
        rotate((w+1) * TWO_PI / (2*numWedges));
        drawShapes(balls);
        popMatrix();
      }
    }
    popMatrix();
  }
  else //rotate
  {
    fill(getColour(balls[0]), 128);
    noStroke();
    pushMatrix();
    translate(width/2, height/2);
    rotate(systemRotation);

    for (int w = 0; w < numWedges; w++)
    {
      pushMatrix();
      //rotate to new position
      rotate(w * TWO_PI/numWedges);
      drawShapes(balls);
      popMatrix();
    }

    popMatrix();
  }
}

void drawShapes(Ball[] theseBalls)
{
  pushMatrix();
  beginShape();
  //cycle through balls[] twice to give enough vertices to draw curves properly
  //bit of overkill, but functional
  for (int b = 0; b < numBalls; b++)
  {
    curveVertex(theseBalls[b].position.x, theseBalls[b].position.y);
  }
  for (int b = 0; b < numBalls; b++)
  {
    curveVertex(theseBalls[b].position.x, theseBalls[b].position.y);
  }
  endShape(CLOSE);
  popMatrix();
}

color getColour(Ball thisBall)
{
  float greenbit = map(thisBall.position.x, 0, width/2, 0, 255);
  float bluebit = abs(map(thisBall.position.y, 0, height/4, -255, 255));
  float redbit = map(dist(0, 0, thisBall.position.x, thisBall.position.y), 0, width/2, 255, 0);
  return color(redbit, greenbit, bluebit);
}

//map ball positions to new wedge size
void correctBallPositions(float oldAngle)
{
  if (reflect) edges[1].rotation = TWO_PI / (2 * numWedges);
  else edges[1].rotation = TWO_PI / numWedges;
  float newAngle = edges[1].rotation;

  for (int s = 0; s < maxShapes; s++)
  {
    for (int b = 0; b < maxBalls; b++)
    {
      float distFromCentre = dist(0, 0, balls[s][b].position.x, balls[s][b].position.y);
      float ballAngle = atan2(balls[s][b].position.y, balls[s][b].position.x);
      float mappedAngle = map(ballAngle, 0, oldAngle, 0, newAngle);
      balls[s][b].position.x = distFromCentre * cos(mappedAngle);
      balls[s][b].position.y = distFromCentre * sin(mappedAngle);
    }
  }
}



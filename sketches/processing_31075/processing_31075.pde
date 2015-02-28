
// floating blobs
// allonestring
// july 2010

//pjs - july 2014

bezierBlob[] bezBlobs;
int numBlobs = 23;
String[] blobState;

int minNumPetals = 5;
int maxNumPetals = 8;
int[] numPetals;
color[] masterColours;
color[] colours;
float[] alphas;
Ball[] centreBalls;
Ball[][] innerBalls;
Ball[][] innerRings;
Ball[][] outerBalls;
Ball[][] outerRings;

float minInnerRadius = 5;
float maxInnerRadius = 10;
float minOuterRadius = 40;
float maxOuterRadius = 60;
float[] innerRadii;
float[] outerRadii;

float[] blobRotations;
float velRange = 0.2;
float angleInc = 0.0;

//PVector wouldn't work here :-(
float[] easeToXPos, easeToYPos;
float border = maxOuterRadius;

void setup()
{
  size(800, 500);
  background(255);
  //  cursor(CROSS);
  noStroke();
  smooth();

  masterColours = new color[8];
  masterColours[0] = color(#603912);
  masterColours[1] = color(#ae4901);
  masterColours[2] = color(#0c3f78);
  masterColours[3] = color(#58691b);
  masterColours[4] = color(#990033);
  masterColours[5] = color(#89250d);
  masterColours[6] = color(#344434);
  masterColours[7] = color(#878e85);

  bezBlobs = new bezierBlob[numBlobs];
  blobState = new String[numBlobs];
  centreBalls = new Ball[numBlobs];
  numPetals = new int[numBlobs];
  colours = new color[numBlobs];
  alphas = new float[numBlobs];

  innerRadii = new float[numBlobs];
  outerRadii = new float[numBlobs];
  blobRotations = new float[numBlobs];

  easeToXPos = new float[numBlobs];
  easeToYPos = new float[numBlobs];

  populateArrays();
}



void draw()
{
  background(255);

  for (int b = 0; b < numBlobs; b++)
  {
    // create blobs
    bezBlobs[b] = new bezierBlob(innerBalls[b], outerBalls[b], numPetals[b], colours[b], alphas[b]);
    // move their bezier balls
    for (int p = 0; p < numPetals[b]; p++)
    {
      innerBalls[b][p].move();
      checkCollision(innerRings[b][p], innerBalls[b][p], true);
      outerBalls[b][p].move();
      checkCollision(outerRings[b][p], outerBalls[b][p], true);
      outerBalls[b][p + numPetals[b]].move();
      checkCollision(outerRings[b][p + numPetals[b]], outerBalls[b][p + numPetals[b]], true);
    }
    // move blobs
    centreBalls[b].move();
    centreBalls[b].checkWalls();

    if (frameCount == 1)
    {
      blobState[b] = "DROPPING";
      alphas[b] = 255;
      centreBalls[b].friction = 0.9;
      centreBalls[b].gravity = 0.2;
      centreBalls[b].bounce = -0.6;
    }

    // reasonabl-ish check for changing the state
    if ((blobState[b] == "DROPPING") && (centreBalls[b].y > height - 2 * centreBalls[b].radius - border))
    {
      blobState[b] = "SNOOZING";
    }

    // display blobs if they're just floating
    // if they're dropping or snoozing display centreball instead
    pushMatrix();
    translate(centreBalls[b].x, centreBalls[b].y);
    bezBlobs[b].update();
    if (blobState[b] == "FLOATING")
    {
      bezBlobs[b].display();
    }
    //    showBehindTheScenes(b); //best with very small numBlobs!
    popMatrix();
    if (blobState[b] != "FLOATING")
    {
      float snoozeRadius = (sin(blobRotations[b] + angleInc)) * 3;
      centreBalls[b].radius = maxInnerRadius + snoozeRadius;
      centreBalls[b].display();
    }
    if (blobState[b] == "WAKINGUP")
    {
      centreBalls[b].x += (easeToXPos[b] - centreBalls[b].x) * 0.02;
      centreBalls[b].y += (easeToYPos[b] - centreBalls[b].y) * 0.02;
      if (abs(easeToYPos[b] - centreBalls[b].y) < 2)
      {
        blobState[b] = "FLOATING";
        alphas[b] = 128;
        centreBalls[b].vx = random(-velRange, velRange);
        centreBalls[b].vy = random(-velRange, velRange);
      }
    }
  }
  angleInc += 0.01;

  // if blobs are dropping||snoozing check collisions amongst them
  for (int b = 0; b < numBlobs - 1; b++)
  {
    if ((blobState[b] == "DROPPING") || (blobState[b] == "SNOOZING"))
    {
      for (int c = b + 1; c < numBlobs; c++)
      {
        if ((blobState[c] == "DROPPING") || (blobState[c] == "SNOOZING"))
        {
          checkCollision(centreBalls[b], centreBalls[c], false);
        }
      }
    }
  }
}


void mouseClicked()
{
  for (int b = 0; b < numBlobs; b++)
  {
    float dx = mouseX - centreBalls[b].x;
    float dy = mouseY - centreBalls[b].y;
    float tempDist = sqrt(dx*dx + dy*dy);

    if ((tempDist <= maxInnerRadius) && blobState[b] == "FLOATING")
    {
      blobState[b] = "DROPPING";
      alphas[b] = 255;
      centreBalls[b].friction = 0.9;
      centreBalls[b].gravity = 0.2;
      centreBalls[b].bounce = -0.6;
    }
    if ((tempDist <= maxInnerRadius) && blobState[b] == "SNOOZING")
    {
      blobState[b] = "WAKINGUP";
      alphas[b] = 255;
      centreBalls[b].friction = 0.0;
      centreBalls[b].gravity = 0.0;
      centreBalls[b].bounce = -1;      

      //find new positions for blobs
      //magic numbers just give nice results
      easeToXPos[b] = centreBalls[b].x + 5 * random(-centreBalls[b].radius, centreBalls[b].radius);
      easeToYPos[b] = random(centreBalls[b].radius, height / 2);
    }
  }
}

void showBehindTheScenes(int b)
{
  // to see balls acting as bezier control points 
  // and the rings restricting their motion
  for (int p = 0; p < numPetals[b]; p++)
  {
    innerRings[b][p].display();
    innerBalls[b][p].display();
    outerRings[b][p + numPetals[b]].display();
    outerRings[b][p].display();
    outerBalls[b][p + numPetals[b]].display();
    outerBalls[b][p].display();
  }
}




// Ball class
class Ball
{
  float x, y;
  float vx, vy;
  float radius;
  color colour = color(0, 0, 255);
  
  float mass;
  float friction = 1.0;
  float gravity = 0.0;
  float bounce = -1; 
  
  Ball(float x, float y, float vx, float vy, float radius, color colour) 
  {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.radius = radius;
    this.mass = radius;
    this.friction = friction;
    this.gravity = gravity;
    this.bounce = bounce;
    this.colour = colour;
  }
  
  void move()
  {
    vy = vy + gravity;
    y += vy;
    vx = vx * friction;
    x += vx;
  }
  
  void display()
  {
    fill(colour);
    ellipse(x, y, radius * 2, radius * 2);
  } 
  
  void checkWalls()
  {
    if(x - radius < border)
    {
      x = border + radius;
      vx *= bounce;
    }
    if(x + radius > width - border)
    {
      x = width - border - radius;
      vx *= bounce;
    }
    if(y - radius < border)
    {
      y = border + radius;
      vy *= bounce;
    }
    if(y + radius > height - border)
    {
      y = height - border - radius;
      vy *= bounce;
    }
  }
}

class bezierBlob
{
  Ball[] innerBalls;
  Ball[] outerBalls;
  int numPetals;
  color colour;
  float alfa;
  PVector[] midPoints;
  
  bezierBlob(Ball[] innerBalls, Ball[] outerBalls, int numPetals, color colour, float alfa)
  {
    this.innerBalls = innerBalls;
    this.outerBalls = outerBalls;
    this.numPetals = numPetals;
    this.colour = colour;
    this.alfa = alfa;
  }
  
  void update()
  {
    fill(colour, alfa);
    float blobAngle = PI / numPetals;
    
    midPoints = new PVector[2 * numPetals];
    for(int i = 0; i < numPetals; i++)
    {
      int minusOne = (2 * (i + numPetals) - 1) % (2 * numPetals);
      float midX = (innerBalls[i].x + outerBalls[minusOne].x) / 2;
      float midY = (innerBalls[i].y + outerBalls[minusOne].y) / 2;
      midPoints[minusOne] = new PVector(midX, midY);
      midX = (innerBalls[i].x + outerBalls[(2 * i)].x) / 2;
      midY = (innerBalls[i].y + outerBalls[(2 * i)].y) / 2;
      midPoints[(2 * i)] = new PVector(midX, midY);
    }    
  }
  
  void display()
  {
    int loopCount = numPetals * 2;
    
    fill(colour, alfa);
    noStroke();
    beginShape();
    vertex(midPoints[midPoints.length - 1].x, midPoints[midPoints.length - 1].y);
    for(int i = 0; i < numPetals; i++)
    {
      int minusOne = (2 * (i + numPetals) - 1) % (2 * numPetals);
      //outward loops
      //cp = control points, ep = end point
      float cp1x = outerBalls[minusOne].x;
      float cp1y = outerBalls[minusOne].y;
      float cp2x = outerBalls[2 * i].x;
      float cp2y = outerBalls[2 * i].y;
      float epx = midPoints[2 * i].x;
      float epy = midPoints[2 * i].y;
      bezierVertex(cp1x, cp1y, cp2x, cp2y, epx, epy);

      //inward loops
      cp1x = innerBalls[i].x;
      cp1y = innerBalls[i].y;
      cp2x = innerBalls[(i + 1) % numPetals].x;
      cp2y = innerBalls[(i + 1) % numPetals].y;
      epx = midPoints[2 * i + 1].x;
      epy = midPoints[2 * i + 1].y;
      bezierVertex(cp1x, cp1y, cp2x, cp2y, epx, epy);     
    }
    endShape();
  }
}

//this is from Keith Peters's Making things move
//internal collision test and reaction added later
//if internal, put ring first, then ball
float dx, dy, dist, overlap;

void checkCollision(Ball ball0, Ball ball1, Boolean internalCollision)
{
  dx = ball1.x - ball0.x;
  dy = ball1.y - ball0.y;
  dist = sqrt(dx*dx + dy*dy);
  
  if(internalCollision)
  {
    if(dist >= ball0.radius - ball1.radius)
    {
      doCollision(ball0, ball1, true);
    }
  }
  else
  {
    if(dist < ball0.radius + ball1.radius)
    {
      doCollision(ball0, ball1, false);
    }
  }    
}
    
void doCollision(Ball ball0, Ball ball1, Boolean internalCollision)  
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
  PVector vel0 = rotateC(ball0.vx, ball0.vy, sine, cosine, true);
  
  //rotate ball1's velocity
  PVector vel1 = rotateC(ball1.vx, ball1.vy, sine, cosine, true);
  
  //collision reaction
  float vxTotal = vel0.x - vel1.x;
  vel0.x = ((ball0.mass - ball1.mass) * vel0.x + 2 * ball1.mass * vel1.x) / (ball0.mass + ball1.mass);
  vel1.x = vxTotal + vel0.x;
  
  //update positions
  float absV = abs(vel0.x) + abs(vel1.x);
  if(internalCollision)
  {
    overlap = (ball1.radius - ball0.radius) + abs(pos0.x - pos1.x);
  }
  else
  {
    overlap = (ball1.radius + ball0.radius) - abs(pos0.x - pos1.x);
  }
  pos0.x += vel0.x / absV * overlap;
  pos1.x += vel1.x / absV * overlap;
  
  //rotate positions back
  PVector pos0F = rotateC(pos0.x, pos0.y, sine, cosine, false);
  PVector pos1F = rotateC(pos1.x, pos1.y, sine, cosine, false);
  
  //adjust positions to actual screen positions
  ball1.x = ball0.x + pos1F.x;
  ball1.y = ball0.y + pos1F.y;
  ball0.x = ball0.x + pos0F.x;
  ball0.y = ball0.y + pos0F.y;
  
  //rotate velocties back
  PVector vel0F = rotateC(vel0.x, vel0.y, sine, cosine, false);
  PVector vel1F = rotateC(vel1.x, vel1.y, sine, cosine, false);
  
  if(internalCollision) //keeping rings still
  {
    ball1.vx = vel1F.x - vel0F.x;
    ball1.vy = vel1F.y - vel0F.y;
  }
  else
  {
    ball0.vx = vel0F.x;
    ball0.vy = vel0F.y;
    ball1.vx = vel1F.x;
    ball1.vy = vel1F.y;
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

void populateArrays()
{
  createNonPetalStuff(); 
  createRingsAndBalls();
}

void createNonPetalStuff()
{
  int biggestNumPetals = 0;
  for(int b = 0; b < numBlobs; b++)
  {
    numPetals[b] = (int)random(minNumPetals, maxNumPetals);

    innerRadii[b] = random(minInnerRadius, maxInnerRadius);
    outerRadii[b] = random(minOuterRadius, maxOuterRadius);
    innerBalls = new Ball[numBlobs][maxNumPetals];
    innerRings = new Ball[numBlobs][maxNumPetals];
    outerBalls = new Ball[numBlobs][maxNumPetals * 2];
    outerRings = new Ball[numBlobs][maxNumPetals * 2];
    
    blobRotations[b] = random(0, TWO_PI);     
    blobState[b] = "FLOATING";

//    colours[b] = color(b * 255 / numBlobs); //greyshades for testing
    int c = (int)random(8);
    float redbit = red(masterColours[c]) + random(-10, 10);
    float greenbit = green(masterColours[c]) + random(-10, 10);
    float bluebit = blue(masterColours[c]) + random(-10, 10);
    colours[b] = color(redbit, greenbit, bluebit);
    alphas[b] = 128;

    float xpos = random(border, width - border);
    float ypos = random(border, height - border);
    float xvel = random(-velRange, velRange);
    float yvel = random(-velRange, velRange);
    centreBalls[b] = new Ball(xpos, ypos, xvel, yvel, minOuterRadius, colours[b]); 
  }
}

void createRingsAndBalls()
{
  for(int b = 0; b < numBlobs; b++)
  {
    float petalAngle = TWO_PI / numPetals[b];
    float ringRadius = innerRadii[b] * sin(petalAngle / 2);
    for(int p = 0; p < numPetals[b]; p++)
    {
      float xpos = innerRadii[b] * cos(p * petalAngle + blobRotations[b]);
      float ypos = innerRadii[b] * sin(p * petalAngle + blobRotations[b]);
      innerRings[b][p] = new Ball(xpos, ypos, 0, 0, ringRadius, color(192));
      innerBalls[b][p] = new Ball(xpos, ypos, random(-velRange, velRange), random(-velRange, velRange), ringRadius / 2, color(0));
    }
  }
  for(int b = 0; b < numBlobs; b++)
  {
    float petalAngle = PI / numPetals[b];
    float ringRadius = outerRadii[b] * sin(petalAngle / 2);
    for(int p = 0; p < 2 * numPetals[b]; p++)
      {
      float xpos = outerRadii[b] * cos((p + 0.5) * petalAngle + blobRotations[b]);
      float ypos = outerRadii[b] * sin((p + 0.5) * petalAngle + blobRotations[b]);
      outerRings[b][p] = new Ball(xpos, ypos, 0, 0, ringRadius, color(192));
      outerBalls[b][p] = new Ball(xpos, ypos, random(-velRange, velRange), random(-velRange, velRange), 5, color(0));  
    }
  }
}




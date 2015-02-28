
//triangleBlob09
//allonestring
//july 2011

//converted to pjs - july 2014

int numColumns = 8; 
int numRows = 10; 
float gridWidth, gridHeight;
//blobs movement determined by balls at vertices
Ball[][]balls = new Ball[numColumns][numRows];
float radius = 5;
float vel = 1; //0.2 calm, 1 less so
//balls movement constrained by invisible rings centred on each ball start point
Boolean ballCollision = true; //internal collision
Ball[][]rings = new Ball[numColumns][numRows];
Boolean ringCollision = false; //normal billiard ball collision

Blob[]blobs = new Blob[2*numColumns*numRows];
color[]colours = new color[2 * numRows];

int count = 0;

//
//NEXT
// change blob class to cope with offset < 1
//

void setup()
{
  size(400, 500);
  background(255);
  smooth();

  
  gridWidth = width / (numColumns - 3); //to allow for triangles overlapping edge of stage
  gridHeight = height / (numRows - 3);
  
  float ringRadius = min(gridWidth, gridHeight) / 2; 
  //populate balls array with triangles' vertices
  //and populate coresponding rings array
  for(int i = 0; i < numColumns; i++)
  {
    for(int j = 0; j < numRows; j++)
    {
      float xpos;
      if(j % 2 == 0) xpos = gridWidth * (i - 1);
      else xpos = gridWidth * (i - 1.5); //otherwise shunt row half a space to the left
      float ypos = gridHeight * (j - 1);
      balls[i][j] = new Ball(xpos, ypos, random(-vel, vel), random(-vel, vel), radius, 0);
      rings[i][j] = new Ball(xpos, ypos, 0, 0, ringRadius, 192);
    }
  }
}

void draw()
{
  background(255);
  noStroke();
  count = 0;
  
  for(int j = 0; j < numRows - 1; j++)
  {
    float colour;
    if(j % 2 == 0)
    {
      for(int i = 0; i < numColumns - 1; i++)
      {
        //triangle vertices
        float startX = balls[i][j].x;
        float startY = balls[i][j].y;
        float rightX = balls[i+1][j].x;
        float rightY = balls[i+1][j].y;
        float downRightX = balls[i+1][j+1].x;
        float downRightY = balls[i+1][j+1].y;
        float downLeftX = balls[i][j+1].x;
        float downLeftY = balls[i][j+1].y;
        //messy, Processing won't let me recyle array name
        float[]tXpos0 = {startX, downRightX, downLeftX};
        float[]tYpos0 = {startY, downRightY, downLeftY};
        blobs[count] = new Blob(tXpos0, tYpos0, color(makeColour((startY + downRightY + downLeftY) / 3)));
        count++;
        float[]tXpos1 = {startX, rightX, downRightX};
        float[]tYpos1 = {startY, rightY, downRightY};
        blobs[count] = new Blob(tXpos1, tYpos1, color(makeColour((startY + rightY + downRightY) / 3)));
        count++;
      }
    }
    else
    {
      for(int i = 1; i < numColumns; i++)
      {
        //triangle vertices
        float startX = balls[i][j].x;
        float startY = balls[i][j].y;
        float downRightX = balls[i][j+1].x;
        float downRightY = balls[i][j+1].y;
        float downLeftX = balls[i-1][j+1].x;
        float downLeftY = balls[i-1][j+1].y;
        float leftX = balls[i-1][j].x;
        float leftY = balls[i-1][j].y;
        
        float[]tXpos0 = {startX, downLeftX, leftX};
        float[]tYpos0 = {startY, downLeftY, leftY};
        blobs[count] = new Blob(tXpos0, tYpos0, color(makeColour((startY + downLeftY + leftY) / 3)));
        count++;
        float[]tXpos1 = {startX, downRightX, downLeftX};
        float[]tYpos1 = {startY, downRightY, downLeftY};
        
        blobs[count] = new Blob(tXpos1, tYpos1, color(makeColour((startY + downRightY + downLeftY) / 3)));
        count++;
      }
    }
  }
  //uncomment rings.display() and balls.display(), and comment out blobs.display() 
  //to see what's happening behind the scenes
  for(int j = 0; j < numRows; j++)
  {
    for(int i = 0; i < numColumns; i++)
    {
      balls[i][j].move();
//      rings[i][j].move();
      checkCollision(rings[i][j], balls[i][j], ballCollision);
 //     rings[i][j].display();
//      balls[i][j].display();
    }
  }
  for(int k = 0; k < count; k++)
  {
    blobs[k].display();
  }
}
  
color makeColour(float value)
{
  //tortuous mapping to get a nice colour change
  float tempRed0 = map(value, 0, height, 0, PI);
  float tempRed1 = map(cos(tempRed0), 1, -1, 255, -50);
  float redBit = max(tempRed1, 6);
  
  float tempGreen, greenBit;
  if(value <= height / 3)
  {
    tempGreen = map(value, 0, height/3, 0, QUARTER_PI);
    greenBit = map(sin(tempGreen), sin(0), sin(QUARTER_PI), 50, 225);
  }
  else
  {
    tempGreen = map(value, height/3, height, QUARTER_PI, HALF_PI);
    greenBit = map(sin(tempGreen), sin(QUARTER_PI), sin(HALF_PI), 225, 150);
  }
  
  float tempBlue = map(value, 0, height, HALF_PI, 2.7*PI);
  float blueBit = max(cos(tempBlue) * 140, 10);

  return color(redBit, greenBit, blueBit);
}

// Ball class
class Ball
{
  float x, y;
  float vx, vy;
  float radius;
  color colour = color(0, 0, 255);
  
  float mass = 1.0;
  float gravity = 0.0;
  float bounce = -0.6; // default = -0.6
  
  Ball(float x, float y, float vx, float vy, float radius, color colour) 
  {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.radius = radius;
    this.mass = radius;
    this.colour = colour;
  }
  
  void move()
  {
//    vy = vy + gravity;
    y += vy;
    x += vx;
  }
  
  void display()
  {
    fill(colour);
    ellipse(x, y, radius * 2, radius * 2);
  } 
}

class Blob //a shape with rounded corners
{
  float[] xpos, ypos; //vertices
  color colour;
  float[] xoffcw, yoffcw; //"clockwise" offsets from vertices
  int numPoints;
  float offset = 2.0; //2 or 3: fraction of each end of line converted to rounded corners
  
  Blob(float[] xpos, float[] ypos, color colour)
  {
    this.xpos = xpos;
    this.ypos = ypos;
    this.colour = colour;
    init();
  }
  
  void init()
  {
    noStroke();

    numPoints = xpos.length;
    xoffcw = new float[numPoints];
    yoffcw = new float[numPoints];
  }
  
  void display()
  {
    for(int i = 0; i < numPoints; i++)
    {
      float dx = xpos[i] - xpos[(i + 1) % numPoints];
      float dy = ypos[i] - ypos[(i + 1) % numPoints];
      xoffcw[i] = xpos[i] - dx / offset;
      yoffcw[i] = ypos[i] - dy / offset;
    }  
    
    fill(colour);
    beginShape();
    vertex(xoffcw[numPoints - 1], yoffcw[numPoints - 1]);
    for(int i = 0; i < numPoints; i++)
    {
      int j = (i + numPoints - 1) % numPoints;
      bezierVertex(xpos[i], ypos[i], xpos[i], ypos[i], xoffcw[i], yoffcw[i]);
    }
    endShape();
  }
}
    
//this is from Keith Peters's Making things move
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
  
  ball0.vx = vel0F.x;
  ball0.vy = vel0F.y;
  ball1.vx = vel1F.x;
  ball1.vy = vel1F.y;
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




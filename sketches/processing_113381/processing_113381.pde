
/**
    AC21010.2 Animation
    Authors: Todd Harding, Will Neal, Sondai Smith, Adam Brown 
    
    Description:
    Draws Animated bubbles in a repeating pattern, each bubble has velocity, and can collide with the 
    boundaries of the window.

    So the app doesn't slow to a crawl, the app is limited to 1000 bubbles.
**/

//////////////////////////////////
// shared variables and constants
//////////////////////////////////
boolean shouldDraw;
boolean hasDrawn;
int minSize = 5;
int maxSize = 20;
int radius = 10;
color startBG = color(51, 51, 51);
color endBG = color(255, 255, 255);
float velocityConstant = 2.0;
int screenResX = 600;
int screenResY = 600;
int currentXPos = 0;
int currentYPos = 0;
int jumpStep = 64;
int timeStepJump = 128;
int timeStepCounter = 0;
int maxArraySize = 1000;

///////////////////////
// Rectangle Struct
///////////////////////
class Rectangle
{
  PVector position;
  PVector rotation;
  PVector velocity;
  PVector scale;
  float w;
  float h;
  float r;
  color c;
}


ArrayList <Rectangle> rectangles;

/////////////////////////////////////////
//    Setup Function
//    Called On Startup
/////////////////////////////////////////
void setup()
{
  size(600, 600);
  background(startBG);
  frameRate(60);
  rectMode(CENTER);
  rectangles = new ArrayList<Rectangle>();
}

/////////////////////////////////////////////
//    Draw Function
//    Called once per frame
/////////////////////////////////////////////
void draw()
{
  if(timeStepCounter == 0)
  {
    update();
  }
  else
  {
    timeStepCounter++;
    if(timeStepCounter > timeStepJump)
    {
      timeStepCounter = 0;
    }
  }

  if(rectangles.size() > maxArraySize)
  {
    rectangles.remove(0);
  }
  background(lerpColor(startBG, endBG, (1 + sin(millis() * 0.0001)) / 2));
  noStroke();
  for(Rectangle r : rectangles)
  {
      noStroke();
      pushMatrix();
      translate(r.position.x, r.position.y);
      rotate(r.rotation.z);
      fill(r.c);
      rect(0, 0, r.w, r.h, r.r);
      popMatrix();
  }
}

/////////////////////////////////////
//    update function
//    Adds new bubbles
//    And runs collision check
/////////////////////////////////////
void update()
{
 
   drawBrushEffect();
  
  // update positions;
  for(Rectangle r : rectangles)
  {
    if(r.position.x < 0)
    {
      PVector normal;
      r.position.x = 1;
      normal = fromAngle(90);
      r.velocity = calcReflection(r.velocity, normal);

    }
    else if (r.position.y < 0)
    {
      PVector normal;
      r.position.y = 1;
      normal = fromAngle(360);
      r.velocity = calcReflection(r.velocity, normal);
    }
    else if (r.position.x > width)
    {
      PVector normal;
      r.position.x = width - 1;
      normal = fromAngle(270);
      r.velocity = calcReflection(r.velocity, normal);
    }
    else if (r.position.y > height)
    {
      PVector normal;
      r.position.y = height -1;
      normal = fromAngle(180);
      r.velocity = calcReflection(r.velocity, normal);
    }
    
    r.position.add(PVector.mult(r.velocity, velocityConstant));
  }
}

float getXVec(float angle, float velocity)
{
  return(sin(radians(angle)) * velocity);
}

float getYVec(float angle, float velocity)
{
  return(cos(radians(angle)) * velocity);
}

PVector fromAngle(float angle)
{
  return new PVector(cos(radians(angle)), sin(radians(angle)));
}

///////////////////////////////////////////////////////////////////////////////////////////////
//    Calculates the reflection 
//    across a plane or normal
//    Source:
//    http://en.wikipedia.org/wiki/Reflection_(mathematics)#Reflection_across_a_line_in_the_plane
////////////////////////////////////////////////////////////////////////////////////////////////
PVector calcReflection(PVector v, PVector n)
{ 
  /*
  // (v * n) / (n * n)
  float divisionComponent = PVector.dot(v,n)/PVector.dot(n, n);
  float f = 2 * divisionComponent;
  PVector leftComponent = PVector.mult(n, f);
  PVector solution = PVector.sub(leftComponent, v);
  return solution;
  */
  
  
  return PVector.sub(PVector.mult(n, ( 2 * PVector.dot(v,n)/PVector.dot(n, n))), v);
}


void mousePressed()
{
  shouldDraw = true;
}

void mouseReleased()
{
  shouldDraw = false;
}

void mouseMoved()
{
  hasDrawn = false;
}

void mouseDragged()
{
  hasDrawn = false;
}


///////////////////////////////////////////////////
//    Adds a rectangle to the rectangle list
///////////////////////////////////////////////////
void drawBrushEffect()
{
  currentXPos+= random(jumpStep);
  if(currentXPos > screenResX)
  {
    currentXPos = 0;
    currentYPos += random(jumpStep);
    if(currentYPos > screenResY)
    {
      currentYPos = 0;
    }
  }
  Rectangle r = new Rectangle(); 
  r.c = color(0, 183, 235, random(200));
  float randSize = minSize + random(maxSize);
  r.position = new PVector(currentXPos + random(maxSize), currentYPos + random(maxSize), 0);
  
  r.w = randSize;
  r.h = randSize;
  r.r = radius;

  r.rotation = new PVector(0.0, 0.0, radians(random(0,360)));
  float xvel = random(-1,1);
  float yvel = random(-1,1);
  r.velocity = fromAngle(random(0, 360));
  rectangles.add(r);
  hasDrawn = true;
  
  
}

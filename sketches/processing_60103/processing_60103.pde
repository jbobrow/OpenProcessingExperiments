

/* * *Controls * * *
z - Toggle automatic changing of variables (default on)

q - Toggle clearing of display every frame
w - Toggle Fading display every frame (not very visible unless 'q' is false)
e - Toggle shifting background color
a - Toggle dilate filter
s - Toggle erode filter

d - Change orbit direction

Up and Down arrows - change gravity
Left and Right arrows - Change rotation speed

Click - Toggle mouse following
 * * * * * * * * * */

boolean clearBack = true;
boolean fadeBack = true;
boolean staticBack = true;
boolean followMouse = false;
boolean useDilate = false;
boolean useErode = false;

boolean autoTransitions = true;

PImage transition;
int numPixels;
int transitionFrames;

int frame;

float back;
float direction;
float gravity;
float gravityIncrement;

PVector stageCenter;
PVector ballPos;
float ballRadius;
PVector ballVel;
int trailLength;

float speedModifier;
float sinAngle;

int numParticles;

SimpleParticle[] particles;
Trail[] trails;

void setup()
{
  size(400, 400);
  
  transition = createImage(width, height, ARGB);
  numPixels = width * height;
  transitionFrames = 30;
  
  frame = transitionFrames + 1;
  
  back = 0;
  
  direction = 1;
  gravity   = 10;
  gravityIncrement = 0.05;
  stageCenter = new PVector(width/2, height/2);
  ballPos     = new PVector(random(stageCenter.x - 40, stageCenter.x + 40),
                            random(stageCenter.y - 40, stageCenter.y + 40));
  ballRadius  = 6;  
  ballVel = new PVector(0,0);
  trailLength = 5;
  
  speedModifier = 1;
  sinAngle = 1;  
  
  numParticles = 50;
  
  particles = new SimpleParticle[numParticles];
  trails = new Trail[numParticles];
  AddParticles();
  
  background(255);
  frameRate(30);
}

void draw()
{
  if(autoTransitions)
  {
    frame++;
    
    gravity += gravityIncrement;
    if(gravity < 1 || gravity > 15)
      gravityIncrement *= -1;
      
    speedModifier = sin(sinAngle) * 1.5;
  }
  
  //variables change every 150 frames
  if(frame == 150)
  {
    staticBack = RandomBool();
    clearBack = RandomBool();
    fadeBack = RandomBool();
    useDilate = RandomBool();
    useErode = RandomBool();
    frame = 0;
    
    CopyDisplay(transition);
  }    
      
  sinAngle += 0.0025;
  if(sinAngle > TWO_PI)//if the value is past a full rotation, subtract a full rotation so it wraps
    sinAngle -= TWO_PI;
  
  if(!staticBack)
    back = 255 * ((sin(sinAngle) + 1)/2);
  else
    back = 200;
  
  if(clearBack)
  {
    background(back);
  }
  if(fadeBack)
  {
    fill(back, 5);
    rect(0, 0, width, height);
  }
  if(useDilate)
    filter(DILATE);
  if(useErode)
    filter(ERODE);
  
  //if the frame count is less than the 
  if(frame < transitionFrames)
  {
    FadeImage(transition);
    image(transition, 0, 0);
  }  
  
  if(followMouse)
  {
    ballPos.x = mouseX;
    ballPos.y = mouseY;
  }
  else
  {
    ballVel.add(CalcVelocityAdd(ballPos, stageCenter, 1, 1, 0.1));
    ballVel.mult(0.99);
    ballPos.add(ballVel);
  }
  fill(255, 255 - back, 0);
  noStroke();
  ellipse(ballPos.x, ballPos.y, ballRadius*2, ballRadius*2);
  
  for(int i = 0; i < numParticles; i++)
  {
    SimpleParticle particle = particles[i];
    
    PVector velAdd = CalcVelocityAdd(particle.GetPos(), ballPos, gravity, particle.mMass, particle.mSpeedMultiplier);

    particle.AddVelocity(velAdd);
    
    particle.Update();
    particle.Render();
    trails[i].Update(particle.GetPos());    
  }  
}

boolean RandomBool()
{
  if(random(-100, 100) < 0)
    return false;
  
  return true;
}

PVector CalcVelocityAdd(PVector pos1, PVector pos2, float aGravity, float aMass, float aSpeedMultiplier)
{
  float diffX = pos2.x - pos1.x;
  float diffY = pos2.y - pos1.y;
  float distance = sqrt(diffX * diffX + diffY * diffY);
  
  PVector gravVec    = new PVector((diffX/distance), (diffY/distance)); //points towards gravCenter. It is a unit vector at this point
  PVector lineNormal = new PVector(-gravVec.y, gravVec.x); //points perpendicular to gravVec
  
  //apply gravity value to the unit vector gravVec. increased by mass, and decreased by distance
  gravVec.mult((aGravity * aMass)/3.5);
  gravVec.div(max(1, distance) );
  
  //calculate the speed of the particle based on gravity and distance, and modify it with aSpeedMultiplier and the global speedModifier
  lineNormal.mult((aGravity/distance) * aSpeedMultiplier * speedModifier * direction);   
  
  //combline the two vectors and return
  gravVec.add(lineNormal);
  return gravVec;
}

void CopyDisplay(PImage aImage)
{
  //load pixel data into the pixel arrays
  loadPixels(); //stage pixels
  aImage.loadPixels(); //pixels in the PImage var
  for(int i = 0; i < numPixels; i++)
  {
    //copy the display by setting pixels in the PImage var (aImage.pixels[i]), to stage pixels (pixel[i])
    aImage.pixels[i] = pixels[i];
  }
  
  //apply the changes made to the PImage pixel array to the image 
  aImage.updatePixels();
}

void FadeImage(PImage aImage)
{
  //the amount of alpha to subtract every frame so it is 0 when the number of transition frames is reached
  int fadePerFrame = 255/transitionFrames;
  aImage.loadPixels();
  //loop through and subtract alpha from each pixel in the image
  for(int i = 0; i < numPixels; i++)
  {
    int pixColor = aImage.pixels[i];
    aImage.pixels[i] = (pixColor & 0xFFFFFF) | (max(0, ((pixColor >> 24) & 0xFF) - fadePerFrame) << 24);
    
    /*---Keeping these so the above makes sense---
    int pixAlpha = (pixColor >> 24) & 0xFF;         //isolate alpha value
    int pixRGB = pixColor & 0xFFFFFF;               //isolate RGB value
    int newAlpha = max(0, pixAlpha - fadePerFrame); //subtract alpha and keep it non-negative
    int newColor = pixRGB | (newAlpha << 24);       //combine rgb and alpha
    aImage.pixels[i] = newColor;
    */
  }
  aImage.updatePixels();
}

void mousePressed()
{
  followMouse = !followMouse;
}

void keyPressed()
{
  if(key == 'z' || key == 'Z')
  {
    autoTransitions = !autoTransitions;
    if(!autoTransitions)
      frame = transitionFrames + 1;
  }
  else if (key == 'q' || key == 'Q')
  {
    clearBack = !clearBack;
  }
  else if(key == 'w' || key == 'W')
  {
    fadeBack = !fadeBack;
  }
  else if(key == 'e' || key == 'E')
  {
    staticBack = !staticBack;
  }
  else if(key == 'a' || key == 'A')
  {
    useDilate = !useDilate;
  }
  else if(key == 's' || key == 'S')
  {
    useErode = !useErode;
  }
  else if(key == 'd' || key == 'D')
  {
    direction *= -1;
  }
  
  if(keyCode == DOWN)
  {
    gravity -= 0.5;
    gravity = max(1, gravity);
  }
  else if(keyCode == UP)
  {
    gravity += 0.5;
    gravity = min(15, gravity);
  }
  else if(keyCode == RIGHT)
  {
    speedModifier += 0.05;
    speedModifier = min(1.5, speedModifier);
  }
  else if(keyCode == LEFT)
  {
    speedModifier += 0.05;
    speedModifier = min(-1.5, speedModifier);
  }
}

void AddParticles()
{
  for(int i = 0; i < numParticles; i++)
  {
    PVector pos = new PVector(random(-width, width*2), random(-height, height*2));
    particles[i] = new SimpleParticle( pos );
    trails[i] = new Trail(trailLength, pos, particles[i].mMass);
    trails[i].mColor = particles[i].mColor;
  }
}


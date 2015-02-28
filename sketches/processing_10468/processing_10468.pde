
//Adapted from color tracking example from processing.org and James Alliban 
//Ribbons inspired by code from Erik Natzke 
//this is an example of a design pattern called ColorStalk
//it has a main behavior and a learning behavior with three modes:
//Learning mode home shows an unaugmented camera view and pauses all other behaviors
//Acquisition mode highlights pixels similar to the pixel under the mouse and on exit from the acquisition mode, sets the color under the mouse to the tracked color.
//Show Stalking mode draws ellipses over the closest match in realtime. 
//
//

int ribbonAmount = 2; 
int ribbonParticleAmount = 50;
float randomness = .2;
RibbonManager ribbonManager;

// Colorstalk Environment
boolean TESTING = false;
import processing.video.*; 
Capture video; 
color trackColor; 
boolean showImage;
boolean acquireColor;
boolean testColor;
boolean paused;
boolean p;
int wrX;
int wrY;
PFont font;
// /ColorStalk Environment 

void setup()
{
  size(1024, 768);

// ColorStalk Setup
  video = new Capture(this,width,height,15);
  trackColor = color(128,128,128);
  smooth();
// /ColorStalk Setup

  //frameRate(30);
  
  ribbonManager = new RibbonManager(ribbonAmount, ribbonParticleAmount, randomness, "ribbon.jpg");    //
  ribbonManager.setRadiusMax(12);                 // default = 8
  ribbonManager.setRadiusDivide(10);              // default = 10
  ribbonManager.setGravity(.07);                   // default = .03
  ribbonManager.setFriction(1);                  // default = 1.1
  ribbonManager.setMaxDistance(30);               // default = 40
  ribbonManager.setDrag(2.5);                      // default = 2
  ribbonManager.setDragFlare(.015);                 // default = .008
}                    
void draw()
{
// ColorStalk Camera Tracker
if (video.available()) {
video.read();
}

video.loadPixels();
pushMatrix();
scale(-1.0, 1.0);
image(video,-video.width,0);
popMatrix();

float worldRecord = 1500;

// XY coordinate of closest color
int closestX = 0;
int closestY = 0;

// Begin loop to stalk through every pixel
for (int x = 0; x < video.width; x ++ ) {
for (int y = 0; y < video.height; y ++ ) {
int loc = (video.width - x - 1) + y *video.width;

// What is current color
color currentColor = video.pixels[loc];
float r1 = red(currentColor);
float g1 = green(currentColor);
float b1 = blue(currentColor);
float r2 = red(trackColor);
float g2 = green(trackColor);
float b2 = blue(trackColor);

// Using euclidean distance to compare colors
float d = dist(r1,g1,b1,r2,g2,b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

// If current color is more similar to tracked color than
// closest color, save current location and current difference
if (d < worldRecord) {
worldRecord = d;
closestX = x;
closestY = y;
}
}
}

// We only consider the color found if its color distance is less than 10. 
// This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.

if (worldRecord < 10) { 
// Set Global Variables
  wrX = closestX;
  wrY = closestY;
  font = createFont("Copperplate", 35);
  text( "ColorStalk", closestX, closestY );
  fill(0, 255);
  rect(0, 0, width, height);

// /ColorStalk Camera Tracker

// Attach ColorStalk to the ribbon manager 
  ribbonManager.update(closestX, closestY);

// Colorstalk Modes  

  // Learning Mode
  // de-augment the camera view
  if(showImage) {
  pushMatrix();
  scale(-1.0, 1.0);
  image(video,-video.width,0);
  popMatrix();

  // draw an elliptical mouse pointer using current target color
  fill(trackColor);
  stroke(0);
  ellipse(mouseX,mouseY,8,8);
  textSize( 16 );
  fill(128);
  // draw instructions for teaching ColorStalk
  text( "'a' to acquire a color", 10, 270 );
  text( "'c' to test control color", 10, 260 );

  }
  // /Learning Mode

  // Acquisition Mode
  if(acquireColor) {

  // create an ellipse under the mouse
  fill(trackColor);
  ellipse(closestX,closestY,16,16);

  // assign the color of the pixel under the mouse to "loc"
  int loc = (video.width - mouseX - 1) + mouseY*video.width;
  // update the stalked color to the color under the mouse
  trackColor = video.pixels[loc];
  // draw instructions 
  textSize( 16 );
  fill(128);
  text( "Acqire an object by moving the mouse over it and pres 'a'", 10, 250 );
  }
  // /Acquisition Mode

  // Show Stalking Mode
  if(testColor) {
  fill(trackColor);
  // draw an ellipse over the stalked pixels in realtime 
  ellipse(closestX,closestY,16,16);
  // draw instructions
  text( "confirm read 'c' when done", 10, 240 );
  }
  // /Show Stalking Mode

 }
}

//ColorStalk Mode Selector
public void keyPressed(){
switch (key){
case 't': showImage = !showImage; break;
case 'a': acquireColor = !acquireColor; break;
case 'c': testColor = !testColor; break;
case 's': paused = !paused;


}
}

class Ribbon
{
  int ribbonAmount;
  float randomness;
  int ribbonParticleAmount;         // length of the Particle Array (max number of points)
  int particlesAssigned = 0;        // current amount of particles currently in the Particle array                                
  float radiusMax = 8;              // maximum width of ribbon
  float radiusDivide = 10;          // distance between current and next point / this = radius for first half of the ribbon
  float gravity = .03;              // gravity applied to each particle
  float friction = 1.1;             // friction applied to the gravity of each particle
  int maxDistance = 10;             // if the distance between particles is larger than this the drag comes into effect
  float drag = 2;                   // if distance goes above maxDistance - the points begin to grag. high numbers = less drag
  float dragFlare = .008;           // degree to which the drag makes the ribbon flare out
  RibbonParticle[] particles;       // particle array
  color ribbonColor;
  
  Ribbon(int ribbonParticleAmount, color ribbonColor, float randomness)
  {
    this.ribbonParticleAmount = ribbonParticleAmount;
    this.ribbonColor = ribbonColor;
    this.randomness = randomness;
    init();
  }
  
  void init()
  {
    particles = new RibbonParticle[ribbonParticleAmount];
  }
  
  void update(float randX, float randY)
  {
    addParticle(randX, randY);
    drawCurve();
  }
  
  void addParticle(float randX, float randY)
  {
    if(particlesAssigned == ribbonParticleAmount)
    {
      for (int i = 1; i < ribbonParticleAmount; i++)
      {
        particles[i-1] = particles[i];
      }
      particles[ribbonParticleAmount - 1] = new RibbonParticle(randomness, this);
      particles[ribbonParticleAmount - 1].px = randX;
      particles[ribbonParticleAmount - 1].py = randY;
      return;
    }
    else
    {
      particles[particlesAssigned] = new RibbonParticle(randomness, this);
      particles[particlesAssigned].px = randX;
      particles[particlesAssigned].py = randY;
      ++particlesAssigned;
    }
    if (particlesAssigned > ribbonParticleAmount) ++particlesAssigned;
  }
  
  void drawCurve()
  {
    smooth();
    for (int i = 1; i < particlesAssigned - 1; i++)
    {
      RibbonParticle p = particles[i];
      p.calculateParticles(particles[i-1], particles[i+1], ribbonParticleAmount, i);
    }

    fill(30);
    for (int i = particlesAssigned - 3; i > 1 - 1; i--)
    {
      RibbonParticle p = particles[i];
      RibbonParticle pm1 = particles[i-1];
      fill(ribbonColor, 255);
      if (i < particlesAssigned-3) 
      {
        noStroke();
        beginShape();
        vertex(p.lcx2, p.lcy2);
        bezierVertex(p.leftPX, p.leftPY, pm1.lcx2, pm1.lcy2, pm1.lcx2, pm1.lcy2);
        vertex(pm1.rcx2, pm1.rcy2);
        bezierVertex(p.rightPX, p.rightPY, p.rcx2, p.rcy2, p.rcx2, p.rcy2);
        vertex(p.lcx2, p.lcy2);
        endShape();
      }
    }
  }
}

class RibbonManager
{
  PImage img;
  int ribbonAmount;
  int ribbonParticleAmount;
  float randomness;
  String imgName;
  Ribbon[] ribbons;       // ribbon array
  
  RibbonManager(int ribbonAmount, int ribbonParticleAmount, float randomness, String imgName)
  {
    this.ribbonAmount = ribbonAmount;
    this.ribbonParticleAmount = ribbonParticleAmount;
    this.randomness = randomness;
    this.imgName = imgName;
    init();
  }
  
  void init()
  {
    img = loadImage(imgName);
    addRibbon();
  }

  void addRibbon()
  {
    ribbons = new Ribbon[ribbonAmount];
    for (int i = 0; i < ribbonAmount; i++)
    {
      int xpos = int(random(img.width));
      int ypos = int(random(img.height));
      color ribbonColor = img.get(xpos, ypos);
      ribbons[i] = new Ribbon(ribbonParticleAmount, ribbonColor, randomness);
    }
  }
  
  void update(int currX, int currY) 
  {
        pushMatrix();
scale(-1.0, 1.0);
image(video,-video.width,0);
popMatrix();
    for (int i = 0; i < ribbonAmount; i++)
    {
      //float randX = currX + (randomness / 2) - random(randomness);
      //float randY = currY + (randomness / 2) - random(randomness);
      
      float randX = currX;
      float randY = currY;
      
      ribbons[i].update(randX, randY);
    }

  }
  
  void setRadiusMax(float value) { for (int i = 0; i < ribbonAmount; i++) { ribbons[i].radiusMax = value; } }
  void setRadiusDivide(float value) { for (int i = 0; i < ribbonAmount; i++) { ribbons[i].radiusDivide = value; } }
  void setGravity(float value) { for (int i = 0; i < ribbonAmount; i++) { ribbons[i].gravity = value; } }
  void setFriction(float value) { for (int i = 0; i < ribbonAmount; i++) { ribbons[i].friction = value; } }
  void setMaxDistance(int value) { for (int i = 0; i < ribbonAmount; i++) { ribbons[i].maxDistance = value; } }
  void setDrag(float value) { for (int i = 0; i < ribbonAmount; i++) { ribbons[i].drag = value; } }
  void setDragFlare(float value) { for (int i = 0; i < ribbonAmount; i++) { ribbons[i].dragFlare = value; } }
}
class RibbonParticle
{
  float px, py;                                       // x and y position of particle (this is the bexier point)
  float xSpeed, ySpeed = 0;                           // speed of the x and y positions
  float cx1, cy1, cx2, cy2;                           // the avarage x and y positions between px and py and the points of the surrounding Particles
  float leftPX, leftPY, rightPX, rightPY;             // the x and y points of that determine the thickness of this segment
  float lpx, lpy, rpx, rpy;                           // the x and y points of the outer bezier points
  float lcx1, lcy1, lcx2, lcy2;                       // the avarage x and y positions between leftPX and leftPX and the left points of the surrounding Particles
  float rcx1, rcy1, rcx2, rcy2;                       // the avarage x and y positions between rightPX and rightPX and the right points of the surrounding Particles
  float radius;                                       // thickness of current particle
  float randomness;
  Ribbon ribbon;
  
  RibbonParticle(float randomness, Ribbon ribbon)
  {
    this.randomness = randomness;
    this.ribbon = ribbon;
  }
  
  void calculateParticles(RibbonParticle pMinus1, RibbonParticle pPlus1, int particleMax, int i)
  {
    float div = 2;
    cx1 = (pMinus1.px + px) / div;
    cy1 = (pMinus1.py + py) / div;
    cx2 = (pPlus1.px + px) / div;
    cy2 = (pPlus1.py + py) / div;

    // calculate radians (direction of next point)
    float dx = cx2 - cx1;
    float dy = cy2 - cy1;

    float pRadians = atan2(dy, dx);

    float distance = sqrt(dx*dx + dy*dy);

    if (distance > ribbon.maxDistance)   //  && i > 1 
    {
      float oldX = px;
      float oldY = py;
      px = px + ((ribbon.maxDistance/ribbon.drag) * cos(pRadians));
      py = py + ((ribbon.maxDistance/ribbon.drag) * sin(pRadians));
      xSpeed += (px - oldX) * ribbon.dragFlare;
      ySpeed += (py - oldY) * ribbon.dragFlare;
    }
    
    ySpeed += ribbon.gravity;
    xSpeed *= ribbon.friction;
    ySpeed *= ribbon.friction;
    px += xSpeed + random(.3);
    py += ySpeed + random(.3);
    
    float randX = ((randomness / 2) - random(randomness)) * distance;
    float randY = ((randomness / 2) - random(randomness)) * distance;
    px += randX;
    py += randY;
    
    //float radius = distance / 2;
    //if (radius > radiusMax) radius = ribbon.radiusMax;
    
    if (i > particleMax / 2) 
    {
      radius = distance / ribbon.radiusDivide;
    } 
    else 
    {
      radius = pPlus1.radius * .9;
    }
    
    if (radius > ribbon.radiusMax) radius = ribbon.radiusMax;
    if (i == particleMax - 2 || i == 1) 
    {
      if (radius > 1) radius = 1;
    }

    // calculate the positions of the particles relating to thickness
    leftPX = px + cos(pRadians + (HALF_PI * 3)) * radius;
    leftPY = py + sin(pRadians + (HALF_PI * 3)) * radius;
    rightPX = px + cos(pRadians + HALF_PI) * radius;
    rightPY = py + sin(pRadians + HALF_PI) * radius;

    // left and right points of current particle
    lpx = (pMinus1.lpx + lpx) / div;
    lpy = (pMinus1.lpy + lpy) / div;
    rpx = (pPlus1.rpx + rpx) / div;
    rpy = (pPlus1.rpy + rpy) / div;

    // left and right points of previous particle
    lcx1 = (pMinus1.leftPX + leftPX) / div;
    lcy1 = (pMinus1.leftPY + leftPY) / div;
    rcx1 = (pMinus1.rightPX + rightPX) / div;
    rcy1 = (pMinus1.rightPY + rightPY) / div;

    // left and right points of next particle
    lcx2 = (pPlus1.leftPX + leftPX) / div;
    lcy2 = (pPlus1.leftPY + leftPY) / div;
    rcx2 = (pPlus1.rightPX + rightPX) / div;
    rcy2 = (pPlus1.rightPY + rightPY) / div;
  }
  
}


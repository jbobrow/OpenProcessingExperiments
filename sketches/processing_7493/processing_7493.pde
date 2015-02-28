
/*  
 *  Hungry Boids -- A Flocking Simulation
 *
 *  Wally Glutton 2010
 *  http://stungeye.com
 *
 *  License: This is free and unencumbered software released into the public domain.
 *
 *
 *  Sorry, no comments. This was an experimental sketch. :)
 *
 *  Play with the various sliders and buttons to change the flocking behaviour.
 *  Recommend screen-dimensions: size(1280,960);
 *
 *  Boid Algo:
 *  http://www.vergenet.net/~conrad/boids/pseudocode.html
 * 
 *  For a cleaner implementation see my refactored Ruby boids:
 *  http://the-shoebox.org/apps/45
 *
 *  There is also a Lua port:
 *  http://github.com/iamwilhelm/frock#readme
 *
 */

import controlP5.*;
ControlP5 controlP5;

int boidVisibility = 250;
int numBoids = 300;
int visibleBoids = 80;
int maxSpeed = 23;
boolean debug = false;
int numFood = 8;

float meshDiv = 1;
float meshMult = .3;
int meshShade = 255;

boolean meshDraw = false;
boolean vectorDraw = true;
boolean mouseFollow = false;
boolean mouseScary = false;
boolean smooth = true;
boolean foodPresent = true;

int cmfFactor = 8;
int avoidFactor = 12;
int allignFactor = 7;

boid[] myBoids;
food[] myFood;
PFont fontA;

void setup()
{
  size(900,500);
  frameRate(45);
  smooth();
  ellipseMode(CENTER);
  
  fontA =  loadFont("CourierNew36.vlw");
  textFont(fontA, 18);

  controlP5 = new ControlP5(this);
  //controlP5.setColorLabel(50);
  controlP5.addToggle("toggleVectorDraw",true, 15,15,20,20).setLabel("Draw Vectors   ");
  controlP5.addToggle("toggleMeshDraw",false, 15,50,20,20).setLabel("Draw Mesh   ");
  controlP5.addToggle("toggleSmooth",true,15,85,20,20).setLabel("Smooth Graphics   ");
  controlP5.addToggle("toggleMouseFollow",false,15,120,20,20).setLabel("Follow Mouse   ");
  controlP5.addToggle("toggleMouseScary",false,15,155,20,20).setLabel("Scary Mouse    ");
  controlP5.addToggle("toggleFoodPresent",true,15,190,20,20).setLabel("Food Present   ");
  controlP5.addBang("scatterBoids",15,225,20,20).setLabel("Scatter Boids  ");
  controlP5.addSlider("setCmfFactor",0,20,cmfFactor,15,height-220,20,200).setLabel("Attraction");
  controlP5.addSlider("setAvoidFactor",0,20,avoidFactor,65,height-220,20,200).setLabel("Avoidance");
  controlP5.addSlider("setAllignFactor",  0,20,allignFactor,115,height-220,20,200).setLabel("Alignment");
  controlP5.addSlider("setBoidVisibility",90,800,boidVisibility,165,height-220,20,200).setLabel("Visibility");
  controlP5.addSlider("setFrameRate",  1,100,45,215,height-220,20,200).setLabel("Framerate");
  controlP5.addSlider("setVisibleBoids",  1,300,visibleBoids,265,height-220,20,200).setLabel("Boids");
  
  
  myBoids = new boid[numBoids];
  myFood  = new food[numFood];
  for(int i = 0; i < numBoids; i++) {
    myBoids[i] = new boid(random(width),random(height),random(-1,1),random(-1,1));
  }
  for(int i = 0; i < numFood; i++) {
    myFood[i] = new food();
  }
  
  background(0);
}


void setFrameRate(int rate) {
    frameRate(rate);
}

void setVisibleBoids(int boids) {
  visibleBoids = boids;
}

void setBoidVisibility(int visibility) {
  boidVisibility = visibility;
}

void setAllignFactor(int factor) {
  allignFactor = factor;
}

void setAvoidFactor(int factor) {
  avoidFactor = factor;
}

void setCmfFactor(int factor) {
  cmfFactor = factor;
}

void toggleVectorDraw() {
  vectorDraw = !vectorDraw;
}

void toggleMeshDraw() {
  meshDraw = !meshDraw;
}

void toggleMouseFollow() {
  mouseFollow = !mouseFollow;
}

void toggleFoodPresent() {
  foodPresent = !foodPresent;
}

void toggleMouseScary() {
  mouseScary = !mouseScary;
}

void toggleSmooth() {
  if (smooth == true) {
    smooth = false;
    noSmooth();
  } else {
    smooth = true;
    smooth();
  }
}

float scale(int factor) {
  float scaled = (float)(factor) / 10;
  return scaled;
}

void scatterBoids() {
  for(int i = 0; i < visibleBoids; i++)
  {
    myBoids[i].xPos = random(width);
    myBoids[i].yPos = random(height);
    myBoids[i].velocity = new vector(random(-1,1),random(-1,1));
  }
}

PImage img;

void draw()
{
// background(255);
 background(0);
  /*img=get(); 
  img.resize(round(width*0.5),round(height*0.5)); 
  img.resize(width-1,height-1); 
  image(img,0,0); 
  */
  //fill(0,50); rect(0,0,width,height); 
  if (meshDraw)
    for(int i = 0; i < visibleBoids; i++)
      myBoids[i].mesh();

  for(int i = 0; i < visibleBoids; i++) {
    myBoids[i].drawit();
  }
  
  if (foodPresent)
    for(int i = 0; i < numFood; i++) {
      myFood[i].drawit();
    }
    
  vector v1, v2, v3, v4, v5;
  for(int i = 0; i < visibleBoids; i++)
  {
    
    for(int j = 0; j < numFood; j++) {
      myFood[j].eaten(myBoids[i]);
    }
    
    v1 = centerMass(i);
    v2 = avoidOthers(i);
    v3 = matchVelocity(i);
    
    if (mouseFollow) {
      v4 = followMouse(i);
      v4.div(100);
    } else if (mouseScary) {
      v4 = scaryMouse(i);     
      v4.div(12);
    } else {
      v4 = new vector(0,0);
    }
    
    if (foodPresent) {
      v5 = hunt_foodstuff(i);
      v5.div(40);
    } else {
      v5 = new vector(0,0);
    }

    float multCmfFactor = scale(cmfFactor);
    float multAvoidFactor = scale(avoidFactor);
    float multAllignFactor = scale(allignFactor);

    
    v1.mult(multCmfFactor);
    v2.mult(multAvoidFactor);
    v3.mult(multAllignFactor);
    

    
    myBoids[i].velocity.add(v1);
    myBoids[i].velocity.add(v2);
    myBoids[i].velocity.add(v3);
    myBoids[i].velocity.add(v4);
    myBoids[i].velocity.add(v5);
    myBoids[i].bindSpeed();
    myBoids[i].move();
    myBoids[i].bindPos();
  }

}

vector followMouse(int boidNum)
{
  vector followVector = new vector(mouseX-myBoids[boidNum].xPos,mouseY-myBoids[boidNum].yPos);
  return followVector;
}

vector scaryMouse(int boidNum)
{
  float dist = sqrt(sq(myBoids[boidNum].xPos - mouseX) + sq(myBoids[boidNum].yPos - mouseY));
  //println(dist);
  if (dist > 125) return new vector(0,0);
  vector followVector = new vector(mouseX-myBoids[boidNum].xPos,mouseY-myBoids[boidNum].yPos);
  followVector.mult(-1);
  if (dist < 100) {
    followVector.mult(1.5);
  } else if (dist < 50) {
    followVector.mult(2);
  } else if (dist < 25) {
    followVector.mult(2);
  }
  return followVector;
}

vector centerMass(int boidNum)
{
  vector massVector = new vector(0,0);
  int count = 0;
  for(int i = 0; i < visibleBoids; i++)
  {
    if (i != boidNum)
      if (myBoids[boidNum].close(boidVisibility*1.5,myBoids[i]))
      {
        massVector.add(myBoids[i].xPos,myBoids[i].yPos);
        count++;
      }
  }
  
  massVector.div(count);
  massVector.add(-myBoids[boidNum].xPos,-myBoids[boidNum].yPos);
  massVector.div(100);
  
  return massVector;
}

vector avoidOthers(int boidNum)
{
  vector avoidVector = new vector(0,0);
  
  for(int i = 0; i < visibleBoids; i++)
  {
    if (i != boidNum)
      if (myBoids[boidNum].close(45,myBoids[i])) {
        vector current_avoid = new vector(myBoids[boidNum].xPos-myBoids[i].xPos,myBoids[boidNum].yPos-myBoids[i].yPos);
        float avoid_multiplier = 25 / current_avoid.magnitude();
        current_avoid.bindVector(avoid_multiplier);
        avoidVector.add(current_avoid);
      }
  }
  
  return avoidVector;
}

vector matchVelocity(int boidNum)
{
  vector velocityVector = new vector(0,0);
  int count = 0;
  
  for(int i = 0; i < visibleBoids; i++)
  {
    if (i != boidNum)
      if (myBoids[boidNum].close(boidVisibility * .5,myBoids[i]))
      {
        velocityVector.add(myBoids[i].velocity);
        count++;
      }
  }
  
  velocityVector.div(count);
  velocityVector.sub(myBoids[boidNum].velocity);
  velocityVector.div(8);
  
  return velocityVector;
}

vector hunt_foodstuff(int boidNum) {
  vector velocityVector = new vector(0,0);
  for (int i = 0; i < numFood; i++) {
    if (myFood[i].close(myBoids[boidNum],150)) {
      velocityVector.add(myFood[i].position.x - myBoids[boidNum].xPos, myFood[i].position.y - myBoids[boidNum].yPos);
    }
  }  
  return velocityVector;
}
 
class food {
  vector position;
  int amount_left;
  int diameter = 30;
  
  food() {
   spawn();
  }
  
  void spawn() {
     position = new vector(random(width),random(height));
    amount_left = diameter;
  }
  
  boolean close(boid diner, int distance) {
    float dist = sqrt(sq(position.x - diner.xPos) + sq(position.y - diner.yPos));
    return (dist < distance);
  }
  
  void eaten(boid diner) {
    if (close(diner, diameter)) {
      amount_left--;
    }
    if (amount_left < 0) {
      spawn();
    }
  }
  
  void drawit() {
    stroke(color(150,30,150));
    fill(color(225,30,225,150));
    ellipse(position.x, position.y, amount_left, amount_left);
  }
 
}

class boid
{
  float xPos;
  float yPos;
  vector velocity;
  color race;
  
  boid(float _xPos, float _yPos, float _xV, float _yV)
  {
    this.xPos = _xPos;
    this.yPos = _yPos;
    velocity = new vector(_xV,_yV);
    race = color(random(255),random(255),random(255));
  }
  
  void move()
  {
    this.xPos += velocity.x;
    this.yPos += velocity.y;
  }
  
  boolean close(float friendly, boid other)
  {
    float dist = sqrt(sq(this.xPos - other.xPos) + sq(this.yPos - other.yPos));
    if (dist < friendly)
      return true;
    else
      return false;    
  }
  
  void bindPos()
  {
    int bounds = 20;
    if (this.xPos > (width+bounds))
      this.xPos = -bounds;
    if (this.yPos > (height+bounds))
      this.yPos = -bounds;
    if (this.xPos < -bounds)
      this.xPos = width+bounds;
    if (this.yPos < -bounds)
      this.yPos = height+bounds;
  }
  
  void bindSpeed()
  {
    if (this.velocity.magnitude() > maxSpeed)
    {
      this.velocity.bindVector(maxSpeed);
    }
  }

  void mesh()
  {
      
      int alpha = (visibleBoids < 80) ? 40 : 255;
      stroke(color(meshShade,meshShade,meshShade,alpha));
      for(int i = 0; i < visibleBoids/meshDiv; i++)
      {
        if (this.close(boidVisibility,myBoids[i]))
          line(this.xPos,this.yPos,myBoids[i].xPos,myBoids[i].yPos);
      }
  }  
      
  void drawit()
  {
    vector unit = new vector(this.velocity);
    unit.bindVector(20);
    stroke(220);
    if (vectorDraw == true) {
      line(this.xPos,this.yPos,this.xPos+unit.x/1.6,this.yPos+unit.y/1.6);
    }
    stroke(100);
    fill(this.race);
    float radius = 13.0 - 5.0 * ((float)visibleBoids/300);
    ellipse(this.xPos,this.yPos,radius,radius);
    
  }
}

class vector
{
  float x;
  float y;
  
  vector()
  {
    x = 0;
    y = 0;
  }
  
  vector(vector other)
  {
    this.x = other.x;
    this.y = other.y;
  }
  
  vector(float _x, float _y)
  {
    this.x = _x;
    this.y = _y;
  }
   
  void add(vector other)
  {
    this.x += other.x;
    this.y += other.y;
  }
  
  void add(float _x, float _y)
  {
    this.x += _x;
    this.y += _y;
  }
  
  void sub(vector other)
  {
    this.x -= other.x;
    this.y -= other.y;
  }
  
  
  void div(float divisor)
  {
    if (divisor != 0)
    {
      this.x /= divisor;
      this.y /= divisor;
    }
  }
  
  void mult(float term)
  {
    this.x *= term;
    this.y *= term;
  }
  
  float magnitude()
  {
    float dot = this.x * this.x + this.y * this.y;
    return sqrt(dot);
  }
  
  void bindVector(float scalar)
  {
    this.div(this.magnitude());
    this.mult(scalar);
  }
  
}


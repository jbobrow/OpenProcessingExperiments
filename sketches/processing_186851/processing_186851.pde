
// This project renders PBox2D objects in a Keystone-warped world. 

//-------------------------------------
// Adapted from CornerPin demo
//Adapted by projection Demo Provided by Golan Levin 2013

import deadpixel.keystone.*;

Keystone ks;
PGraphics offscreen;
CornerPinSurface pinSurface;
int offscreenW = 800; 
int offscreenH = 600; 

//-------------------------------------
// Adapted from Dan Shiffman's Basic example of falling rectangles
import pbox2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// A reference to our box2d world
PBox2D box2d;

int count = 0;
float gravityForcex = 0;
float gravityForcey = .05;
boolean didCatchBall = false;
float targetx, targety = 0;
int targetball = -1;
float nestX =710;
float nestY = offscreenH/2-200;
Bird bird = new Bird(nestX, nestY);
int bgColor = 0;

// Objects in our world
ArrayList<Particle> balls;
Surface surface;



//============================================================
void setup() {
  size(850, 650, P3D);
  //rect(850, 650);

  //--------------------------------
  // Initialize the Keystone offscreen buffer etc. 
  ks = new Keystone(this);
  pinSurface = ks.createCornerPinSurface(offscreenW, offscreenH, 20);
  offscreen = createGraphics(offscreenW, offscreenH, P3D);

  //--------------------------------
  // Initialize box2d physics and create a world with gravity.
  box2d = new PBox2D(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);
  balls = new ArrayList<Particle>();

  surface = new Surface();
  for (int eggs = 0; eggs<7; eggs+=1) {
    balls.add(new Particle(nestX, nestY-5, 6));
  }
}


void draw() {
  updateTheSimulation();
  // Draw the scene, offscreen
  offscreen.beginDraw();
  offscreen.background(bgColor);

  surface.display();

  for (Particle p: balls) {
    p.render();
  }

  fill(0);
  bird.bPeriodicBoundaries = true;
  bird.update();
  if ( didCatchBall) {
    addAttraction(bird, nestX, nestY, .05);
    balls.get(targetball).grabbed(bird.px, bird.py);
    placeBall();
  }
  else {
    if (targetball == -1) {
      getfurthestBall();
    }
    else {
      updateAttract();
    }
    addAttraction(bird, targetx, targety, .05);
  }

  bird.render();


  for (int i=0; i<balls.size(); i++) {
    Particle b = balls.get(i);
    if ( didCatchBall) {
      balls.get(targetball).px = bird.px;
      balls.get(targetball).py = bird.py+20;
    }
  }
  catchBall(bird.px, bird.py, targetx, targety);

  offscreen.endDraw();

  // Render the perspective-warped scene
  background(bgColor);
  pinSurface.render(offscreen);
}


void getfurthestBall()
{
  float furthestdh = 0;
  float furthestx= 0;
  float furthesty = 0;
  int target = 0;

  for (int i=0; i<balls.size(); i++) {
    Particle b = balls.get(i);
    float dx = bird.px - (b.px);
    float dy = bird.py - (b.py);
    float dh = sqrt(dx*dx + dy*dy);
    if (dh > furthestdh) {
      furthestdh = dh;
      furthestx = b.px;
      furthesty = b.py;
      target = i;
    }
  }

  targetx = furthestx;
  targety = furthesty;
  targetball = target;
}

void updateAttract() {
  targetx = balls.get(targetball).px;
  targety = balls.get(targetball).py;
}


void catchBall( float x, float y, float ballx, float bally)
{
  float dx = x - ballx;
  float dy = y - bally;
  float dh = sqrt(dx*dx + dy*dy);
  if (dh < 5.0 && targetball != -1) {
    didCatchBall = true;
    balls.get(targetball).birdgrabbed = true;
    balls.get(targetball).grabbed(bird.px, bird.py);
  }
}

void placeBall()
{   
  float x = bird.px;
  float y = bird.py;
  float dx = x - nestX;
  float dy = y - nestY;
  float dh = sqrt(dx*dx + dy*dy);
  if (dh < 5.0 && targetball != -1) {
    didCatchBall = false;
    balls.get(targetball).birdgrabbed = false;
    //balls.get(targetball).birdReleasedBall(bird.px, bird.py);
    balls.add(new Particle(bird.px, bird.py, 6));
    balls.remove(targetball);
    targetball = -1;
  }
}

void addRepulsion(Bird ithParticle, float repulseX, float repulseY, float force) {
  float mutualRepulsionAmount = force;
  if (mouseX!=0 && mouseY!= 0) {
    float px = ithParticle.px;
    float py = ithParticle.py;

    float dx = px - repulseX;
    float dy = py - repulseY;
    float dh = sqrt(dx*dx + dy*dy);
    if (dh > 1.0) {

      float componentInX = dx/dh;
      float componentInY = dy/dh;
      float proportionToDistanceSquared = 1.0/(dh*dh);

      float repulsionForcex = mutualRepulsionAmount * componentInX * proportionToDistanceSquared;
      float repulsionForcey = mutualRepulsionAmount * componentInY * proportionToDistanceSquared;
      if (px>offscreenW /2-50) {
        ithParticle.addForce( repulsionForcex, repulsionForcey); // add in forces
      }
    }
  }
}

void addAttraction(Bird particle, float attractX, float attractY, float force) {
  float mutualAttractionAmount = force;
  float px = particle.px;
  float py = particle.py;

  float dx = px - attractX;
  float dy = py - attractY;
  float dh = sqrt(dx*dx + dy*dy);
  if (dh > 1.0) {

    float componentInX = dx/dh;
    float componentInY = dy/dh;
    float proportionToDistanceSquared = 1.0/(dh*dh);

    float attractionForcex = mutualAttractionAmount * componentInX; //* proportionToDistanceSquared;
    float attractionForcey = mutualAttractionAmount * componentInY; //* proportionToDistanceSquared;
    particle.addAttractionForce( attractionForcex, attractionForcey); // add in forces
  }
}

void updateTheSimulation() {
  // We must always step through time!
  box2d.step();
}

//-------------------------------------

//-------------------------------------
void keyPressed() {
  if (key == 'r' || key=='R') {
    if (bgColor ==255) bgColor = 0;
    else bgColor = 255;
  } 
  ks.toggleCalibration();
}

//============================================================
// Modified code of Particles provided by Golan Levin
class Bird {
  boolean isBird = false;
  float dirEyeX;
  float dirEyeY;
  int num;
  float px;
  float py;
  float vx;
  float vy;
  float damping;
  float mass;
  boolean bLimitVelocities = true;
  boolean bPeriodicBoundaries = false;

  // Constructor for the Particle
  Bird (float x, float y) {
    px = x;
    py = y;
    vx = vy = 0;
    damping = 0.93;
    mass = .2;
  }

  // Add a force in. One step of Euler integration.
  void addForce (float fx, float fy) {
    float ax = fx / mass;
    float ay = fy / mass;
    vx += ax;
    vy += ay;

    handleBoundaries();
  }

  void addAttractionForce (float fx, float fy) {
    float ax = fx / mass;
    float ay = fy / mass;
    vx -= ax;
    vy -= ay;
    handleBoundaries();
  }


  // Update the position. Another step of Euler integration.
  void update() {
    vx *= damping;
    vy *= damping;
    limitVelocities();
    handleBoundaries();
    px += vx;
    py += vy;
  }


  void limitVelocities() {
    if (bLimitVelocities) {
      float speed = sqrt(vx*vx + vy*vy);
      float maxSpeed = 10.0;
      if (speed > maxSpeed) {
        vx *= maxSpeed/speed;
        vy *= maxSpeed/speed;
      }
    }
  }

  void handleBoundaries() {
    if (bPeriodicBoundaries) {
      if (px+10 > offscreenW ) px -= 1;
      if (px+10 < 0     ) px += 1;
      if (py+10 > offscreenH   ) py = offscreenH-10;
      if (py+10 < 0     ) py += 1;
    }

    else {
      if (px > offscreenW ) vx = vx;
      if (px < 0     ) vx = -vx;
      if (py > offscreenH   ) vy = +vy;
      if (py < 0     ) vy = -vy;
    }
  }

  void render() {
    count = int(py) %21;
    offscreen.rectMode(CENTER);
    offscreen.fill(200, 0, 0, 75);
    offscreen.stroke(255);
    offscreen.ellipse(px, py, 20, 20);
    //offscreen.stroke(200,0,0);
    offscreen.fill(255);
    offscreen.bezier(px+10, py, px+10, py, px+20, py, px+20, py-10+count);
    offscreen.bezier(px-10, py, px-10, py, px-20, py, px-20, py-10+count);
    offscreen.fill(0);
  }
}

// Code Modified from CollisionListening Demo

class Particle {

  // We need to keep track of a Body and a radius
  Body body;
  float r;
  float px;
  float py;
  float startx;
  float starty;
  boolean birdgrabbed = false;
  float birdx;
  float birdy;

  Particle(float x, float y, float r_) {
    r = r_;
    // This function puts the particle in the Box2d world
    makeBody(x, y, r);
    Vec2 pos = box2d.getBodyPixelCoord(body);
    startx = pos.x;
    starty = pos.y;
    birdx = birdy = 0;
  }



  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+r*2) {
      killBody();
      return true;
    }
    return false;
  }

  // 
  void render() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    px = pos.x;
    py = pos.y;

    // Get its angle of rotation
    if (birdgrabbed == false) {
      float a = body.getAngle();
      offscreen.rectMode(CENTER);
      offscreen.pushMatrix();
      offscreen.translate(px, py);
      offscreen.rotate(-a);
      offscreen.fill(255);
      offscreen.stroke(0);
      offscreen.strokeWeight(1);
      offscreen.ellipse(0, 0, r*2, r*2);
      // Let's add a line so we can see the rotation
      offscreen.noFill();
      offscreen.ellipse(2,2,4,4);
      offscreen.popMatrix();
    }
    else {
      float a = body.getAngle();
      offscreen.rectMode(CENTER);
      offscreen.pushMatrix();
      offscreen.translate(birdx, birdy);
      offscreen.rotate(-a);
      offscreen.fill(175);
      offscreen.stroke(0);
      offscreen.strokeWeight(1);
      offscreen.ellipse(0, 0, r*2, r*2);
      // Let's add a line so we can see the rotation
      //line(0, 0, r, 0);
      offscreen.popMatrix();
    }
  }
  
  void grabbed(float x, float y){
    birdx =x;
    birdy =y;
    birdgrabbed = true;
  }
  
  void birdReleasedBall(float x, float y)
  {
    makeBody(x, y, 6);
    killBody();
  }
  
  // Here's our function that adds the particle to the Box2D world
  void makeBody(float x, float y, float r) {
    // Define a body
    BodyDef bd = new BodyDef();
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.world.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.01;
    fd.restitution = 0.3;

    // Attach fixture to body
    body.createFixture(fd);

    // Give it a random initial velocity (and angular velocity)
    body.setLinearVelocity(new Vec2(random(-10f, 10f), random(5f, 10f)));
    body.setAngularVelocity(random(-10, 10));
  }
}


// Code Modified from PBox2D given example
// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010

// An uneven surface boundary

class Surface {
  // We'll keep track of all of the surface points
  ArrayList<Vec2> surface;
  ArrayList<Vec2> surface2;
  ArrayList<Vec2> nest;


  Surface() {
    surface = new ArrayList<Vec2>();
    surface2 = new ArrayList<Vec2>();
    nest = new ArrayList<Vec2>();

    // This is what box2d uses to put the surface in its world
    ChainShape chain = new ChainShape();
    ChainShape chain2 = new ChainShape();
    ChainShape chain3 = new ChainShape();

    // Perlin noise argument
    float xoff = 0.0;

    // This has to go backwards so that the objects  bounce off the top of the surface
    // This "edgechain" will only work in one direction!

      // Store the vertex in screen coordinates
      surface.add(new Vec2(offscreenW+200,offscreenH/2-190));
      surface.add(new Vec2(offscreenW-200,offscreenH/2-190));
      surface.add(new Vec2(offscreenW-200, offscreenH/2+80));
      surface.add(new Vec2(offscreenW+200, offscreenH/2+80));
      surface.add(new Vec2(offscreenW+00, offscreenH/2-190));
      
      nest.add(new Vec2(offscreenW-200, offscreenH/2-198));
      nest.add(new Vec2(offscreenW-100, offscreenH/2-190));
      nest.add(new Vec2(offscreenW, offscreenH/2-198));
      
      surface2.add(new Vec2(0,0));
      surface2.add(new Vec2(0,offscreenH));
      surface2.add(new Vec2(offscreenW,offscreenH));
      surface2.add(new Vec2(offscreenW,0));
      surface2.add(new Vec2(0,0));
      
      
      
      

      // Move through perlin noise
    
    // Build an array of vertices in Box2D coordinates
    // from the ArrayList we made
    Vec2[] vertices = new Vec2[surface.size()];
    Vec2[] vertices2 = new Vec2[surface2.size()];
    Vec2[] vertices3 = new Vec2[nest.size()];
    for (int i = 0; i < vertices.length; i++) {
      Vec2 edge = box2d.coordPixelsToWorld(surface.get(i));
      Vec2 edge2 = box2d.coordPixelsToWorld(surface2.get(i));
      vertices[i] = edge;
      vertices2[i] = edge2;
    }
    for (int i = 0; i < vertices3.length; i++) {
      Vec2 edge3 = box2d.coordPixelsToWorld(nest.get(i));
      vertices3[i] = edge3;
    }
    // Create the chain!
    chain.createChain(vertices,vertices.length);
    chain2.createChain(vertices2,vertices2.length);
    chain3.createChain(vertices3,vertices3.length);
    
    // The edge chain is now attached to a body via a fixture
    BodyDef bd = new BodyDef();
    bd.position.set(0.0f,0.0f);
    Body body = box2d.createBody(bd);
    Body body2 = box2d.createBody(bd);
    Body body3 = box2d.createBody(bd);
    // Shortcut, we could define a fixture if we
    // want to specify frictions, restitution, etc.
    body.createFixture(chain,1);
    body2.createFixture(chain2,1);
    body3.createFixture(chain3,1);

  }

  // A simple function to just draw the edge chain as a series of vertex points
  void display() {
    
    offscreen.rectMode(CENTER);
    offscreen.strokeWeight(2);
    offscreen.stroke(0);
    offscreen.noFill();
    offscreen.beginShape();
    for (Vec2 v: surface) {
      offscreen.vertex(v.x,v.y);
    }
    offscreen.endShape();
    offscreen.noStroke();
    offscreen.beginShape();
    for (Vec2 v: surface2) {
      offscreen.vertex(v.x,v.y);
    }
    offscreen.endShape();
    offscreen.beginShape();
    offscreen.stroke(255);
    for (Vec2 v: nest) {
      offscreen.vertex(v.x,v.y);
    }
    offscreen.stroke(255,0,0);
    offscreen.endShape();
  }

}



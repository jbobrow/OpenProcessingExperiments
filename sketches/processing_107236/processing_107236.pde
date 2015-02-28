
// BOOTCAMP FINAL: MFA DT 2013 

// Dedicated to the one and only person who made me love code. Thanks for being an awesome teacher Anthony. 

//"SLOPPY EATING" by:

//___________     ___.   .__       .__           ___________.__       .__                         
//\_   _____/____ \_ |__ |__| ____ |  | _____    \_   _____/|__| ____ |  |__   ___________  ____  
// |    __) \__  \ | __ \|  |/  _ \|  | \__  \    |    __)_ |  |/    \|  |  \ /  _ \_  __ \/    \ 
// |     \   / __ \| \_\ \  (  <_> )  |__/ __ \_  |        \|  |   |  \   Y  (  <_> )  | \/   |  \
// \___  /  (____  /___  /__|\____/|____(____  / /_______  /|__|___|  /___|  /\____/|__|  |___|  /
//     \/        \/    \/                    \/          \/         \/     \/                  \/ 


// Sketched based on:
// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// PBox2D example

// Basic example of controlling an object with our own motion (by attaching a MouseJoint)
// Also demonstrates how to know which object was hit

import pbox2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

boolean hitting = false;
boolean hittingR = false;

int state=0;

//Setting up rotating hand to hit burgers
int lastTime=0;
int hitLength=500;

int score=0;

// A reference to our box2d world
PBox2D box2d;

// Just a single box this time
Box box;
Box2 boxR;

//Images
//PImage[] junkFood;  //?

// An ArrayList of particles that will fall on the surface
ArrayList<Particle> particles;

// The Spring that will attach to the box from the mouse
Spring spring;

// Perlin noise values
float xoff = 0;
float yoff = 1000;

//Anthony's body
PImage leftHand;  
PImage rightHand;
PImage AnthonyBody;


void setup() {
  
   // junkFood images 
  //readImages(); //?

  // Make sure a image is selected
  //f = images[0]; //?
  
 
  
  leftHand = loadImage("leftHand.png");
  leftHand.resize(50, 0);

  rightHand = loadImage("rightHand.png");
  rightHand.resize(50, 0);

  AnthonyBody = loadImage("Anthony.png");
  AnthonyBody.resize(250, 550);


  size(300, 600);
  smooth();

  // Initialize box2d physics and create the world
  box2d = new PBox2D(this);
  box2d.createWorld();

  // Add a listener to listen for collisions!
  box2d.world.setContactListener(new CustomListener());

  // Make the box
  box = new Box(91, 440);  //setting object size 
  boxR = new Box2 (203, 440);


  // Make the spring (it doesn't really get initialized until the mouse is clicked)
  spring = new Spring();
  spring.bind(width/2, height/2, box);

  // Create the empty list
  particles = new ArrayList<Particle>();
}

void draw() {
  background(#B8E883);

  imageMode(PConstants.CENTER);
  image(AnthonyBody, 150, 300);     //Sets x and y pos

  println(mouseX+", "+ mouseY);
  
  text("Score:" + score, 5, 15);

  if (random(1) < 0.02) {
    float sz = 40;
    particles.add(new Particle(width/2 + random(-50,50), -20, sz));
  }
  //Setting velocity for burger after hitting hand

  if (millis()-lastTime<hitLength && box.count==2) {
    hitting = true;
  }
  else {
    hitting=false;
  }


  // We must always step through time!
  box2d.step();

  // Make an x,y coordinate out of perlin noise
  float x = noise(xoff)*width;
  float y = noise(yoff)*height;
  xoff += 0.01;
  yoff += 0.01;

  // This is tempting but will not work!
  // box.body.setXForm(box2d.screenToWorld(x,y),0);

  // Hand position

  spring.update(50, 400);  //Setting hand position

  //box.body.setAngularVelocity(0);

  // Look at all particles
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.display();
    // Particles that leave the screen, we delete them
    // (note they have to be deleted from both the box2d world and our list
    if (p.done()) {
      particles.remove(i);
    }
  }

  // Draw the box
  box.display();
  boxR.display();

  // Draw the spring
  // spring.display();
}






// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2012
// PBox2D example

// A rectangular box

class Box {

  // We need to keep track of a Body and a width and height
  Body body;
  float w;
  float h;

int count=0;

  // Constructor
  Box(float x_, float y_) {
    float x = x_;
    float y = y_;
    w = 24;
    h = 50;
    // Add the box to the box2d world
    makeBody(new Vec2(x, y), h, w);
    body.setUserData(this);
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  boolean contains(float x, float y) {
    Vec2 worldPoint = box2d.coordPixelsToWorld(x, y);
    Fixture f = body.getFixtureList();
    boolean inside = f.testPoint(worldPoint);
    return inside;
  }

  // Drawing the box
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle()-.5;


    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    //body.setTransform(body.getPosition(), .4);
    fill(175);
    stroke(0);
    imageMode(PConstants.CENTER);
    image(leftHand, 0, 0);   //Sets start point for rotation
    popMatrix();
    count=0;
    if (keyPressed==true) {
      if (key == CODED) {
        if (keyCode == LEFT){ 
          lastTime = millis();
          count=1;
          body.setTransform(body.getPosition(), .4);
        }
      }
      }
    else {
      count=2;
      body.setTransform(body.getPosition(), 0);
  }
  }
  // This function adds the rectangle to the box2d world
  void makeBody(Vec2 center, float w_, float h_) {
    // Define and create the body
    BodyDef bd = new BodyDef();
    bd.fixedRotation=true;
    bd.type = BodyType.STATIC;  // before we had DYNAMIC
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);

    // Define a polygon (this is what we use for a rectangle)
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    body.createFixture(fd);
    //body.setMassFromShapes();

    // Give it some initial random velocity
    // body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    //body.setAngularVelocity(random(-5, 5));
  }
}

// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2012
// PBox2D example

// A rectangular box

class Box2 {

  // We need to keep track of a Body and a width and height
  Body body;
  float w;
  float h;

int count=0;

  // Constructor
  Box2(float x_, float y_) {
    float x = x_;
    float y = y_;
    w = 24;  //setting box shape for particles to fall on
    h = 50;
    // Add the box to the box2d world
    makeBody(new Vec2(x, y), h, w);
    body.setUserData(this);
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  boolean contains(float x, float y) {
    Vec2 worldPoint = box2d.coordPixelsToWorld(x, y);
    Fixture f = body.getFixtureList();
    boolean inside = f.testPoint(worldPoint);
    return inside;
  }

  // Drawing the box
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle()-.5;


    pushMatrix();
    translate(pos.x, pos.y);
    rotate(+a);
    fill(175);
    stroke(0);
    imageMode(PConstants.CENTER);
    image(rightHand, 0, 0);     //Sets start point for rotation
    popMatrix();
    count=0;
    if (keyPressed==true) {
      if (key == CODED) {
        if (keyCode == RIGHT){ 
          lastTime = millis();
          count=1;
          body.setTransform(body.getPosition(), .4);
        }
      }
      }
    else {
      count=2;
      body.setTransform(body.getPosition(), 0);
  }
  }
  // This function adds the rectangle to the box2d world
  void makeBody(Vec2 center, float w_, float h_) {
    // Define and create the body
    BodyDef bd = new BodyDef();
    bd.fixedRotation=true;
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);

    // Define a polygon (this is what we use for a rectangle)
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    body.createFixture(fd);
    //body.setMassFromShapes();

    // Give it some initial random velocity
    // body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    //body.setAngularVelocity(random(-5, 5));
  }
}

// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// PBox2D example

// ContactListener to listen for collisions!

import org.jbox2d.callbacks.ContactImpulse;
import org.jbox2d.callbacks.ContactListener;
import org.jbox2d.collision.Manifold;
import org.jbox2d.dynamics.contacts.Contact;

 class CustomListener implements ContactListener {
  CustomListener() {
  }

  // This function is called when a new collision occurs
   void beginContact(Contact cp) {
    // Get both fixtures
    Fixture f1 = cp.getFixtureA();
    Fixture f2 = cp.getFixtureB();
    // Get both bodies
    Body b1 = f1.getBody();
    Body b2 = f2.getBody();
    // Get our objects that reference these bodies
    Object o1 = b1.getUserData();
    Object o2 = b2.getUserData();

    // If object 1 is a Box, then object 2 must be a particle
    // Note we are ignoring particle on particle collisions
    if (o1.getClass() == Box2.class) {
      Particle p = (Particle) o2;
      p.change();
      
    } 
    // If object 2 is a Box, then object 1 must be a particle
    else if (o1.getClass() == Box.class) {
      Particle p = (Particle) o2;
      p.change();
    }
  }

   void endContact(Contact contact) {
    // TODO Auto-generated method stub
  }

   void preSolve(Contact contact, Manifold oldManifold) {
    // TODO Auto-generated method stub
  }

   void postSolve(Contact contact, ContactImpulse impulse) {
    // TODO Auto-generated method stub
  }
}




// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// PBox2D example

// A circular particle

boolean eat = false;

class Particle {

  // We need to keep track of a Body and a radius
  Body body;
  float r;

  color col;

  PImage food;


  Particle(float x, float y, float r_) {
    r = r_;
    // This function puts the particle in the Box2d world
    makeBody(x, y, 15);
    body.setUserData(this); //body
    col = color(175);
    int temp = int(random(1, 5));
    food=loadImage(temp+".png");
    food.resize(40, 0); //image
    eat = false;
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
    eat = false;
  }

  // Change color when hit
  void change() {
    if (hitting) {
      body.setLinearVelocity(new Vec2(0, -100));
      col = color(255, 0, 0);
      eat=true;
    }
  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+r*2) {      
      //killBody();
      //score++; 
      return true;
    }
    return false;
  }


  // 
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    fill(col);
    stroke(0);
    strokeWeight(1);
    image(food, 0, 0);
    //ellipse(0, 0, r*2, r*2);
    // Let's add a line so we can see the rotation
    popMatrix();

    if ( dist(pos.x, pos.y, 150, 339)< 25 && eat == true) { ///= <122, 334 > 174, 332
      body.setTransform(new Vec2(0, 200), 0);
      eat=false;
      score++;
    }
  }

  // Here's our function that adds the particle to the Box2D world
  void makeBody(float x, float y, float r) {
    // Define a body
    BodyDef bd = new BodyDef();
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.createBody(bd);

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

    body.setAngularVelocity(random(-10, 10));
  }
}

// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// PBox2D example

// Class to describe the spring joint (displayed as a line)

class Spring {

  // This is the box2d object we need to create
  MouseJoint mouseJoint;

  Spring() {
    // At first it doesn't exist
    mouseJoint = null;
  }

  // If it exists we set its target to the mouse location 
  void update(float x, float y) {
    if (mouseJoint != null) {
      // Always convert to world coordinates!
      Vec2 mouseWorld = box2d.coordPixelsToWorld(x,y);
      mouseJoint.setTarget(mouseWorld);
    }
  }

  void display() {
    if (mouseJoint != null) {
      // We can get the two anchor points
      Vec2 v1 = null;
      mouseJoint.getAnchorA(v1);
      Vec2 v2 = null;
      mouseJoint.getAnchorB(v2);
      // Convert them to screen coordinates
      v1 = box2d.coordWorldToPixels(v1);
      v2 = box2d.coordWorldToPixels(v2);
      // And just draw a line
      stroke(0);
      strokeWeight(1);
      line(v1.x,v1.y,v2.x,v2.y);
    }
  }


  // This is the key function where
  // we attach the spring to an x,y location
  // and the Box object's location
  void bind(float x, float y, Box box) {
    // Define the joint
    MouseJointDef md = new MouseJointDef();
    
    // Body A is just a fake ground body for simplicity (there isn't anything at the mouse)
    md.bodyA = box2d.getGroundBody();
    // Body 2 is the box's boxy
    md.bodyB = box.body;
    // Get the mouse location in world coordinates
    Vec2 mp = box2d.coordPixelsToWorld(x,y);
    // And that's the target
    md.target.set(mp);
    // Some stuff about how strong and bouncy the spring should be
    md.maxForce = 1000.0f * box.body.m_mass;
    md.frequencyHz = 5.0f;
    md.dampingRatio = 0.9f;

    // Wake up body!
    //box.body.wakeUp();

    // Make the joint!
    mouseJoint = (MouseJoint) box2d.world.createJoint(md);
  }

  void destroy() {
    // We can get rid of the joint when the mouse is released
    if (mouseJoint != null) {
      box2d.world.destroyJoint(mouseJoint);
      mouseJoint = null;
    }
  }

}






// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A blob skeleton
// Could be used to create blobbly characters a la Nokia Friends
// http://postspectacular.com/work/nokia/friends/start

import pbox2d.*;

import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

// A reference to our box2d world
PBox2D box2d;
PShader blur;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;

// Our "blob" object
Skeleton blob;

// Just a single box this time
// The Spring that will attach to the box from the mouse
//Spring spring;

// Draw creature design or skeleton?
boolean skeleton;

void setup() {
  size(600, 600);
  // Initialize box2d physics and create the world
  box2d = new PBox2D(this);
  box2d.createWorld();

  // Add some boundaries
  boundaries = new ArrayList<Boundary>();
  boundaries.add(new Boundary(width/2, height+90, width, 10));
  boundaries.add(new Boundary(width/2, 5, width, 10));
  boundaries.add(new Boundary(width-5, height/2, 10, height));
  boundaries.add(new Boundary(5, height/2, 10, height));

  // Make a new blob
  blob = new Skeleton();

  // Make the box


  // Make the spring (it doesn't really get initialized until the mouse is clicked)
  // spring = new Spring();
}



// When the mouse is pressed we. . .
void mousePressed() {
  box2d.setGravity(0,10);
 // for (Skeleton bd: ) {
   // bd.attract(mouseX, mouseY);
  }
  // Check to see if the mouse was clicked on the box
  // if (Skeleton.Vec2.contains(mouseX, mouseY)) {
  // And if so, bind the mouse location to the box with a spring
  //spring.bind(mouseX, mouseY, Skeleton.joints);
//}
//}

// When the mouse is released we're done with the spring
void mouseReleased() {
  box2d.setGravity(0, -10);
  // spring.destroy();
}

void draw() {
  background(0);

  // We must always step through time!

  box2d.step();


  // Show the blob!
  if (skeleton) {
    blob.displaySkeleton();
  } 
  else {
    blob.displayCreature();
  }

  // Show the boundaries!
  for (Boundary wall: boundaries) {
    wall.display();
  }

  // Always alert the spring to the new mouse location
  // spring.update(mouseX, mouseY);

  // Draw the box
  // Draw the spring (it only appears when active)
  // spring.display();
}


void keyPressed() {
  if (key == ' ') {
    skeleton = !skeleton;
  }
}

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A blob skeleton
// Could be used to create blobbly characters a la Nokia Friends
// http://postspectacular.com/work/nokia/friends/start

class Skeleton {

  // A list to keep track of all the bodies and joints
  ArrayList<Body> bodies;
  ArrayList<Joint> joints;

  float bodyRadius;  // The radius of each body that makes up the skeleton
  float radius;      // The radius of the entire blob
  float totalPoints; // How many points make up the blob


  // We should modify this constructor to receive arguments
  // So that we can make many different types of blobs
  Skeleton() {

    // Create the empty ArrayLists
    bodies = new ArrayList<Body>();
    joints = new ArrayList<Joint>();

    // Where and how big is the blob
    Vec2 center = new Vec2(width/2, height/2);
    radius = 100;
    totalPoints = 110;
    bodyRadius = 11;

    // Initialize all the points in a circle
    for (int i = 0; i < totalPoints; i++) {
      // Look polar to cartesian coordinate transformation!
      float theta = PApplet.map(i, 0, totalPoints, 0, TWO_PI);
      float x = center.x + radius * sin(theta);
      float y = center.y + radius * cos(theta);

      // Make each individual body
      BodyDef bd = new BodyDef();
      bd.type = BodyType.DYNAMIC;

      bd.fixedRotation = true; // no rotation!
      bd.position.set(box2d.coordPixelsToWorld(x, y));
      Body body = box2d.createBody(bd);

      // The body is a circle
      CircleShape cs = new CircleShape();
      cs.m_radius = box2d.scalarPixelsToWorld(bodyRadius);

      // Define a fixture
      FixtureDef fd = new FixtureDef();
      fd.shape = cs;
      fd.density = 1;
      fd.friction = 0.5;
      fd.restitution = 0.3;

      // Finalize the body
      body.createFixture(fd);

      // Store our own copy for later rendering
      bodies.add(body);
    }

    // Now connect the outline of the shape all with joints
    for (int i = 0; i < bodies.size(); i++) {
      DistanceJointDef djd = new DistanceJointDef();
      Body a = bodies.get(i);
      int next = i+1;
      if (i == bodies.size()-1) {
        next = 0;
      }
      Body b = bodies.get(next);
      // Connection between previous particle and this one
      djd.bodyA = a;
      djd.bodyB = b;
      // Equilibrium length is distance between these bodies
      Vec2 apos = a.getWorldCenter();
      Vec2 bpos = b.getWorldCenter();
      float d = dist(apos.x, apos.y, bpos.x, bpos.y);
      djd.length = d;
      // These properties affect how springy the joint is 
      djd.frequencyHz = 10;
      djd.dampingRatio = 0.9;

      // Make the joint.  
      DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
      joints.add(dj);
    }


    // Make some joints that cross the center of the blob between bodies
    for (int i = 0; i < bodies.size(); i++) {
      for (int j = i+2; j < bodies.size(); j+=4) { 
        DistanceJointDef djd = new DistanceJointDef();
        Body a = bodies.get(i);
        Body b = bodies.get(j);
        // Connection between two bides
        djd.bodyA = a;
        djd.bodyB = b;
        // Equilibrium length is distance between these bodies
        Vec2 apos = a.getWorldCenter();
        Vec2 bpos = b.getWorldCenter();
        float d = dist(apos.x, apos.y, bpos.x, bpos.y);

        djd.length = d;
        // These properties affect how springy the joint is 
        djd.frequencyHz = 3;
        djd.dampingRatio = 0.1;

        // Make the joint.  
        DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
        joints.add(dj);
      }
    }
  }

  /*void attract(float x, float y) {
    // From BoxWrap2D example
    Vec2 worldTarget = box2d.coordPixelsToWorld(x, y);   
    Vec2 bodyVec = body.getWorldCenter();
    // First find the vector going from this body to the specified point
    worldTarget.subLocal(bodyVec);
    // Then, scale the vector to the specified force
    worldTarget.normalize();
    worldTarget.mulLocal((float) 50);
    // Now apply it to the body's center of mass.
    body.applyForce(worldTarget, bodyVec);
  }*/

  // Draw the skeleton as circles for bodies and lines for joints
  void displaySkeleton() {
    // Draw the outline
    stroke(0);
    strokeWeight(1);
    for (Joint j: joints) {
      Body a = j.getBodyA();
      Body b = j.getBodyB();
      Vec2 posa = box2d.getBodyPixelCoord(a);
      Vec2 posb = box2d.getBodyPixelCoord(b);
      line(posa.x, posa.y, posb.x, posb.y);
    }

    // Draw the individual circles
    for (Body b: bodies) {
      // We look at each body and get its screen position
      Vec2 pos = box2d.getBodyPixelCoord(b);
      // Get its angle of rotation
      float a = b.getAngle();
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(a);
      fill(80);
      stroke(0);
      strokeWeight(1);
      ellipse(0, 0, bodyRadius*2, bodyRadius*2);
      popMatrix();
    }
  }


  // Draw it as a creature
  void displayCreature() {
    // Let's compute the center!
    Vec2 center = new Vec2(0, 0);

    // Make a curvy polygon 
    beginShape();
    stroke(255);
    strokeWeight(bodyRadius*1.5);
    fill(255);
    for (Body b: bodies) {
      // We look at each body and get its screen position
      Vec2 pos = box2d.getBodyPixelCoord(b);
      curveVertex(pos.x, pos.y);
      center.addLocal(pos);
    }
    endShape(CLOSE);
    // Center is average of all points
    center.mulLocal(1.0/bodies.size());

    // Find angle between center and side body
    Vec2 pos = box2d.getBodyPixelCoord(bodies.get(0));
    float dx = pos.x - center.x;
    float dy = pos.y - center.y;
    float angle = atan2(dy, dx)-PI/2;
    int[] blink = {0,30,30,30,30,30,30,30,30,30,30};
    int blinkRando = blink[(int)random(0,10)];

    // Draw eyes and mouth relative to center
    pushMatrix();
    translate(center.x, center.y);
    filter(blur);
    rotate(angle);
    fill(0);
    stroke(100);
    strokeWeight(2);
    translate(mouseX/10-25, mouseY/10+10);
    ellipse(-40, -65, 30, blinkRando);
    ellipse(+40, -65, 30, blinkRando);
    popMatrix();
  }

  Body getFirstBody() {
    return bodies.get(0);
  }
}

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A fixed boundary class

class Boundary {

  // A boundary is a simple rectangle with x,y,width,and height
  float x;
  float y;
  float w;
  float h;
  
  // But we also have to make a body for box2d to know about it
  Body b;

  Boundary(float x_,float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;

    // Define the polygon
    PolygonShape sd = new PolygonShape();
    // Figure out the box2d coordinates
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    // We're just a box
    sd.setAsBox(box2dW, box2dH);


    // Create the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);
    
    // Attached the shape to the body using a Fixture
    b.createFixture(sd,1);
  }

  // Draw the boundary, if it were at an angle we'd have to do something fancier
  void display() {
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }

}


// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Class to describe the spring joint (displayed as a line)

/*class Spring {

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
      Vec2 v1 = new Vec2(0,0);
      mouseJoint.getAnchorA(v1);
      Vec2 v2 = new Vec2(0,0);
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
    md.bodyB = Skeleton.body;
    // Get the mouse location in world coordinates
    Vec2 mp = box2d.coordPixelsToWorld(x,y);
    // And that's the target
    md.target.set(mp);
    // Some stuff about how strong and bouncy the spring should be
    md.maxForce = 1000.0 * box.body.m_mass;
    md.frequencyHz = 5.0;
    md.dampingRatio = 0.9;

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
*/



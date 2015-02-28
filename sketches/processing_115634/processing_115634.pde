
import pbox2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

PBox2D box2d;

ArrayList<Particle> allParticles;

Surface surface;

boolean showOutline;
boolean showCircles;
float outerR;
float innerR;

void setup() {
  size (600, 600);
  showOutline = true;
  showCircles = true;
  outerR = 500;
  innerR = 80;

  smooth();

  box2d = new PBox2D(this);
  box2d.createWorld();
  //  box2d.setGravity(width/2, -height/2);

  allParticles = new ArrayList<Particle>();
  surface = new Surface(innerR/2);
}

void draw() {
  background(0);

  float make = random(0, 1.0);
  if (make<0.1) {
    float angle = random(0, TWO_PI);
    float x = width/2+cos(angle)*outerR/2;
    float y = height/2+sin(angle)*outerR/2;
    Particle p = new Particle(x, y, 5, angle);
    allParticles.add(p);
  }

  if (keyPressed) {
    if (key=='r' || key=='R') {
      for (Particle p: allParticles) {
        p.done();
      }
      allParticles.clear();
    }
    else if (key=='c' || key=='C') {
      if (showCircles) showCircles = false;
      else showCircles = true;
    }
    else if (key=='o' || key=='O') {
      if (showOutline) showOutline = false;
      else showOutline = true;
    }
    else if (key==CODED) {
      if (keyCode==UP) {
        innerR+=2;
      }
      else if (keyCode==DOWN) {
        innerR-=2;
      }
      else if (keyCode==LEFT) {
        outerR-=2;
      }
      else if (keyCode==RIGHT) {
        outerR+=2;
      }
    }
  }

  if (showCircles) {
    float r;  
    noFill();

    stroke(255);
    strokeWeight(3);
    r = innerR+0.95*(outerR-innerR);
    ellipse(width/2, height/2, r, r);

    stroke(245);
    strokeWeight(2.5);
    r = innerR+0.90*(outerR-innerR);
    ellipse(width/2, height/2, r, r);

    stroke(225);
    strokeWeight(2.2);
    r = innerR+0.82*(outerR-innerR);
    ellipse(width/2, height/2, r, r);

    stroke(195);
    strokeWeight(1.5);
    r = innerR+0.70*(outerR-innerR);
    ellipse(width/2, height/2, r, r);

    stroke(155);
    strokeWeight(1.0);
    r = innerR+0.55*(outerR-innerR);
    ellipse(width/2, height/2, r, r);

    stroke(105);
    strokeWeight(1.0);
    r = innerR+0.40*(outerR-innerR);
    ellipse(width/2, height/2, r, r);

    stroke(45);
    strokeWeight(0.8);
    r = innerR+0.20*(outerR-innerR);
    ellipse(width/2, height/2, r, r);
  }

  if (showOutline) {
    surface.display();

    noFill();
    stroke(0, 255, 0);
    strokeWeight(1);
    ellipse(width/2, height/2, outerR, outerR);
  }

  box2d.step();

  for (Particle p: allParticles) {
    Vec2 pos = new Vec2();
    pos = box2d.getBodyPixelCoord(p.body);
    //Find distance from center
    float dx = width/2-pos.x;
    float dy = -height/2+pos.y;
    Vec2 grav = new Vec2(dx, dy);
    float dfc = sqrt(dx*dx+dy*dy);
    float r0 = p.r0;
    float newR = map(dfc, 0, outerR/2, r0/5, r0);
    p.applyForce(grav);
    //    p.r = newR;
    if (dfc<outerR) {
      p.display();
    }
  }
}

class Particle {

  // We need to keep track of a Body and a radius
  Body body;
  float r0;
  float r;
  float a0;

  Particle(float x, float y, float r_, float angle) {
    r0 = r_;
    r = r0;
    a0 = angle;
    // This function puts the particle in the Box2d world
    makeBody(x,y,r);
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
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(100,140,200);
    noStroke();
    strokeWeight(1);
    ellipse(0,0,r*2,r*2);
    popMatrix();
  }

  // Here's our function that adds the particle to the Box2D world
  void makeBody(float x, float y, float r) {
    // Define a body
    BodyDef bd = new BodyDef();
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x,y);
    bd.type = BodyType.DYNAMIC;
    bd.linearDamping = 0.1f;
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
    body.setLinearVelocity(new Vec2((50*cos(PI/2-a0)),(50*sin(PI/2-a0))));
    body.setAngularVelocity(0);
  }
  
  void applyForce(Vec2 force) {
    Vec2 pos = body.getWorldCenter();
    body.applyForce(force, pos);
  }

}
class Surface {
  Body body;
  float r;
  
  Surface(float r_) {
    r = r_;
    makeBody(width/2,height/2,r);
    body.setUserData(this);
  }
  
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    pushMatrix();
    noFill();
    stroke(0,255,0);
    strokeWeight(1);
    ellipse(width/2, height/2, r*2, r*2);
    popMatrix();
  }
  
  // Here's our function that adds the particle to the Box2D world
  void makeBody(float x, float y, float r) {
    // Define a body
    BodyDef bd = new BodyDef();
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.STATIC;
    body = box2d.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;

    // Attach fixture to body
    body.createFixture(fd);
  }
}




// Class borrowed from:
// The Nature of Code
// <http://www.shiffman.net/teaching/nature>

class Box  {

  // We need to keep track of a Body and a width and height
  Body body;
  float w;
  float h;
  float s;
  color c;
  
  Vec2 prev;

  // Constructor
  Box(float x, float y, float s, float d) {
    w = 2;
    h = 5;
    s = s;
    if(mouseX < width/2){
      c = color(random(150,200),map(mouseX,0,width/2,0,50),random(110,210));
    } else {
      c = color(random(150,175),map(mouseX,0,width/2,130,250),random(110,200));
    }
    // Add the box to the box2d world
    makeBody(new Vec2(x,y),w,h,s,d);
    prev = new Vec2(x,y);
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }


  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getScreenPos(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+w*h) {
      killBody();
      return true;
    }
    return false;
  }

  // Drawing the box
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getScreenPos(body);
    // slowly grow the orb
    w+=0.02;
    stroke(c,max(0,255-10*w));
    strokeWeight(w);
    line(pos.x,pos.y,prev.x,prev.y);
    prev = pos;
  }

  // Make the body
  void makeBody(Vec2 center, float w_, float h_, float s_, float d_) {

    PolygonDef cd = new PolygonDef();

    // Parameters that affect physics
    cd.density = d_*1.0f;
    cd.friction = 1f;
    cd.restitution = 1f;

    // Scale to Box2D coordinates
    float w = box2d.scaleScreenToWorld(50);  
    float h = box2d.scaleScreenToWorld(50);
    // Define the Shape as "Box" (rectangle)
    cd.setAsBox(w, h);


    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.screenToWorld(center));

    body = box2d.createBody(bd);
    body.createShape(cd);
    body.setMassFromShapes();

    // Give it some initial random velocity
    body.setLinearVelocity(new Vec2(s_,0));
    body.setAngularVelocity(random(-2,2));
  }

}


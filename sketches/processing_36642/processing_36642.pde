
class Particle {

  Body body;
  int index;

  Particle(Vec2 pos, int _index) {
    index = _index;
    makeBody(pos, 5);
  }

  Vec2 pos() {
   Vec2 pos = box2d.getBodyPixelCoord(body);
   return pos;
  }
  
  void makeBody(Vec2 center, float r) {
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);

    CircleDef cd = new CircleDef();
    cd.radius = box2d.scalarPixelsToWorld(r);  

    cd.density = 1.0;
    cd.friction = 0.01;
    cd.restitution = 0.3;
    
    body.createShape(cd);
    body.setMassFromShapes();
    
   // body.setLinearVelocity(new Vec2(random(-5,5), random(2,5)));
   // body.setAngularVelocity(random(-5, 5)); 
  }
  
  void attract(float x,float y) {
    // From BoxWrap2D example
    Vec2 worldTarget = box2d.coordPixelsToWorld(x,y);   
    Vec2 bodyVec = body.getMemberWorldCenter();
    // First find the vector going from this body to the specified point
    worldTarget.subLocal(bodyVec);
    // Then, scale the vector to the specified force
    worldTarget.normalize();
    worldTarget.mulLocal((float) 1000);
    // Now apply it to the body's center of mass.
    body.applyForce(worldTarget, bodyVec);
  }

}



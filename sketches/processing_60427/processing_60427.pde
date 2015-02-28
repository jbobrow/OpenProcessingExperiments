

class Surface {
  // We'll keep track of all of the surface points
  ArrayList<Vec2> surface;

  Body body;
  
  Surface() {
    surface = new ArrayList<Vec2>();
    // This is what box2d uses to put the surface in its world
    ChainShape chain = new ChainShape();

    RG.setPolygonizer(RG.ADAPTATIVE);
    RG.setPolygonizer(RG.UNIFORMLENGTH);
    points = tree.getPoints();

    // If there are any points
    if (points != null) {

      fill(0);
      noStroke();
      beginShape();
      endShape();

      for (int i=0; i<points.length; i++) {
       surface.add(new Vec2(points[i].x, points[i].y));
      }
    }

    // Build an array of vertices in Box2D coordinates
    // from the ArrayList we made
    Vec2[] vertices = new Vec2[surface.size()];
    for (int i = 0; i < vertices.length; i++) {
      Vec2 edge = box2d.coordPixelsToWorld(surface.get(i));
      vertices[i] = edge;
    }


    // Create the chain!
    chain.createChain(vertices, vertices.length);

    // The edge chain is now attached to a body via a fixture
    BodyDef bd = new BodyDef();
    bd.position.set(0.0f, 0.0f);
    Body body = box2d.createBody(bd);
    // Shortcut, we could define a fixture if we
    // want to specify frictions, restitution, etc.
    body.createFixture(chain, 1);
  }
  
//  Vec2 attract(Box b) {
//    float G = 100; // Strength of force
//    // clone() makes us a copy
//    Vec2 pos = body.getWorldCenter();    
//    Vec2 boxPos = b.body.getWorldCenter();
//    // Vector pointing from mover to attractor
//    Vec2 force = pos.sub(boxPos);
//    float distance = force.length();
//    // Keep force within bounds
//    distance = constrain(distance,1,5);
//    force.normalize();
//    // Note the attractor's mass is 0 because it's fixed so can't use that
//    float strength = (G * 1 * b.body.m_mass) / (distance * distance); // Calculate gravitional force magnitude
//    force.mulLocal(strength);         // Get force vector --> magnitude * direction
//    return force;
//  }

  // A simple function to just draw the edge chain as a series of vertex points
  void display() {
    noStroke();
    noFill();
    translate(0, -200);
    beginShape();
   
    for (Vec2 v: surface) {
      ellipse(v.x, v.y, 5, 5);
 
    }
    endShape();
  }
}



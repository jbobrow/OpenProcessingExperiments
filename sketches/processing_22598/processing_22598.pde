
class Body {
  /*
     O
    /|\
   / | \
    / \
   |   |
  */
  // each pointmass will be a joint to the body.
  PointMass head;
  PointMass shoulder;
  PointMass elbowLeft;
  PointMass elbowRight;
  PointMass handLeft;
  PointMass handRight;
  PointMass pelvis;
  PointMass kneeLeft;
  PointMass kneeRight;
  PointMass footLeft;
  PointMass footRight;
  Circle headCircle;
  
  float headLength;
  Body (PVector position, float bodyHeight) {
    headLength = bodyHeight / 7.5;

    // PointMasses
    // Here, they're initialized with random positions. 
    head = new PointMass(new PVector(position.x + random(-5,5),position.y + random(-5,5)));
    shoulder = new PointMass(new PVector(position.x + random(-5,5),position.y + random(-5,5)));
    elbowLeft = new PointMass(new PVector(position.x + random(-5,5),position.y + random(-5,5)));
    elbowRight = new PointMass(new PVector(position.x + random(-5,5),position.y + random(-5,5)));
    handLeft = new PointMass(new PVector(position.x + random(-5,5),position.y + random(-5,5)));
    handRight = new PointMass(new PVector(position.x + random(-5,5),position.y + random(-5,5)));
    pelvis = new PointMass(new PVector(position.x + random(-5,5),position.y + random(-5,5)));
    kneeLeft = new PointMass(new PVector(position.x + random(-5,5),position.y + random(-5,5)));
    kneeRight = new PointMass(new PVector(position.x + random(-5,5),position.y + random(-5,5)));
    footLeft = new PointMass(new PVector(position.x + random(-5,5),position.y + random(-5,5)));
    footRight = new PointMass(new PVector(position.x + random(-5,5),position.y + random(-5,5)));
    
    // Masses
    // Uses data from http://www.humanics-es.com/ADA304353.pdf
    head.mass = 4;
    shoulder.mass = 26; // shoulder to torso
    elbowLeft.mass = 2; // upper arm mass
    elbowRight.mass = 2; 
    handLeft.mass = 2;
    handRight.mass = 2;
    pelvis.mass = 15; // pelvis to lower torso
    kneeLeft.mass = 10;
    kneeRight.mass = 10;
    footLeft.mass = 5; // calf + foot
    footRight.mass = 5;
    
    // Limbs
    // PointMasses are attached to each other here.
    // Proportions are mainly used from http://www.idrawdigital.com/2009/01/tutorial-anatomy-and-proportion/
    head.attachTo(shoulder, 5/4 * headLength, 1, true);
    elbowLeft.attachTo(shoulder, headLength*3/2, 1, true);
    elbowRight.attachTo(shoulder, headLength*3/2, 1, true);
    handLeft.attachTo(elbowLeft, headLength*2, 1, true);
    handRight.attachTo(elbowRight, headLength*2, 1, true);
    pelvis.attachTo(shoulder,headLength*3.5,0.8,true);
    kneeLeft.attachTo(pelvis, headLength*2, 1, true);
    kneeRight.attachTo(pelvis, headLength*2, 1, true);
    footLeft.attachTo(kneeLeft, headLength*2, 1, true);
    footRight.attachTo(kneeRight, headLength*2, 1, true);
    
    // Head
    headCircle = new Circle(head.position, headLength*0.75);
    headCircle.attachToPointMass(head);
    
    // Invisible Constraints. These add resistance to some limbs from pointing in odd directions.
    // this keeps the head from tilting in extremely uncomfortable positions
    pelvis.attachTo(head, headLength*4.75, 0.02, false);
    // these constraints resist flexing the legs too far up towards the body
    footLeft.attachTo(shoulder, headLength*7.5, 0.001, false);
    footRight.attachTo(shoulder, headLength*7.5, 0.001, false);
    
    // The PointMasses (and circle!) is added to the world
    world.addCircle(headCircle);
    world.addPointMass(head);
    world.addPointMass(shoulder);
    world.addPointMass(pelvis);
    world.addPointMass(elbowLeft);
    world.addPointMass(elbowRight);
    world.addPointMass(handLeft);
    world.addPointMass(handRight);
    world.addPointMass(kneeLeft);
    world.addPointMass(kneeRight);
    world.addPointMass(footLeft);
    world.addPointMass(footRight);
  }
  // This must be used if the body is ever deleted
  void removeFromWorld () {
    world.removeCircle(headCircle);
    world.removePointMass(head);
    world.removePointMass(shoulder);
    world.removePointMass(pelvis);
    world.removePointMass(elbowLeft);
    world.removePointMass(elbowRight);
    world.removePointMass(handLeft);
    world.removePointMass(handRight);
    world.removePointMass(kneeLeft);
    world.removePointMass(kneeRight);
    world.removePointMass(footLeft);
    world.removePointMass(footRight);
  }
}


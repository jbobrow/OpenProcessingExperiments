
class Agent {
  Vec3D loc;
  VerletParticle p;
  VerletSpring spring;
  VerletSpring spring2;

  int idX;
  int idY;

  Agent(Vec3D _loc, int _idX, int _idY) {
    loc= _loc;
    idX= _idX;
    idY= _idY;

    p= new VerletParticle(loc.x, loc.y, loc.z);
    physics. addParticle(p);
    physics. addBehavior(new AttractionBehavior( p, 40, -1.2f, 0.05f));
  }

  void connectSpring() {

    if (idX > 0 ) {
      spring= new VerletSpring (p, agentList[idX-1][idY].p, 10, 0.01);
      physics.addSpring(spring);
    }

    if (idY >0) {
      spring2= new VerletSpring (p, agentList[idX][idY-1].p, 10, 0.01);
      physics.addSpring(spring2);
    }
  }

  void displaySpring() {
    stroke(155);
    strokeWeight(1);

    if (idX > 0) {
      line(spring.a.x, spring.a.y, spring.b.x, spring.b.y);
    }

    if ( idY >0) {
      line(spring2.a.x, spring2.a.y, spring2.b.x, spring2.b.y);
    }
  }

  void display() {

    stroke(50);
    strokeWeight(1);
    fill(#CC6699);
    ellipse(p.x, p.y, 5, 5);
  }
}



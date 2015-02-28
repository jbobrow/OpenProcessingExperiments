
class Edge {
  // GLOBAL VARIABLES
  Particle pnt1;
  Particle pnt2;

  // CONSTRUCTOR
  Edge(Particle _pnt1, Particle _pnt2) {
    pnt1 = _pnt1;
    pnt2 = _pnt2;
  }

  // FUNCTIONS
  void display() {
    stroke(255);
    strokeWeight(1);
    line(pnt1.x, pnt1.y, pnt1.z, pnt2.x, pnt2.y, pnt2.z);

    //Color point 1 turqoise
    strokeWeight(2);
    stroke(28, 189, 232);
    point(pnt1.x, pnt1.y, pnt1.z);
    //Color point 2 light green
    stroke(28, 232, 50);
    point(pnt2.x, pnt2.y, pnt2.z);
  }
}



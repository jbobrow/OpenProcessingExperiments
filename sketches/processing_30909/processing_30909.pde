
class Cote {
  
  int a;
  int b;
  float rest;
  
  Cote(int ain,int bin, float restin) {
    a = ain;
    b = bin;
    rest = restin;
  }
  
  void rest() {
    Point pointa = (Point) forme.points.get(a);
    Point pointb = (Point) forme.points.get(b);
    PVector ab = PVector.sub(pointb.pos,pointa.pos);
    if (ab.mag() != coteRest) {
      float difference = coteRest-ab.mag();
      ab.normalize();
      PVector depa = PVector.mult(ab,-difference/2);
      PVector depb = PVector.mult(ab,difference/2);
      pointa.force.add(depa);
      pointb.force.add(depb);
    }
  }
  
}


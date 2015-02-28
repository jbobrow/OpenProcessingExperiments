
class Connect {
  
  int a;
  int b;
  int[] others;
  PVector distmin;
  
  Connect(int ain, int[] othersin) {
    a = ain;
    others = othersin;
    distmin = new PVector(0,0);
  }
  
  boolean getshortest() {
    Unit unita = (Unit) units.get(a);
    int count = 0;
    for (int i = 0; i < others.length; i++) {
      if (others[i] != -1) {
        Unit unitb = (Unit) units.get(others[i]);
        if (unitb.connectCount < unitb.connectMax) {
          PVector distance = PVector.sub(unitb.pos,unita.pos);
          float d = distance.mag()-unita.rad-unitb.rad;
          distance.normalize();
          distance.mult(d);
          if (count == 0) {
            distmin = distance;
            b = others[i];
          } else if (distance.mag() < distmin.mag()) {
            distmin = distance;
            b = others[i];
          }
          count++;
        }
      }
    }
    if (count > 0) {
      return true;
    } else {
      return false;
    }
  }
  
  void force() {
    Unit unita = (Unit) units.get(a);
    Unit unitb = (Unit) units.get(b);
    PVector forcea = PVector.div(distmin,unita.mass);
    PVector forceb = PVector.div(distmin,unitb.mass);
    forceb.mult(-1);
    unita.acc.add(forcea);
    unitb.acc.add(forceb);
  }
  
  void display() {
    Unit unita = (Unit) units.get(a);
    Unit unitb = (Unit) units.get(b);
    stroke(255,50);
    strokeWeight(1);
    line(unita.pos.x,unita.pos.y,unitb.pos.x,unitb.pos.y);
  }
  
}


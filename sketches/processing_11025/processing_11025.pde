
class Line {
  PVector base, u;
}

class Plane {
  PVector base, h, v;
  /*
  PVector n;

  void calc() {
    n = Geometry.crossProduct(h,v);
    Geometry.makeUnit(n);
  }
  */
}

class LinePlaneIntersection {
  double lineU = 0;
  double planeH = 0;
  double planeV = 0;
}

class Geometry {
  double dotProduct(PVector a, PVector b) {
    return a.x*b.x + a.y*b.y + a.z*b.z;
  }
  
  PVector crossProduct(PVector a, PVector b) {
    return new PVector(
      a.y*b.z-a.z*b.y,
      a.z*b.x-a.x*b.z,
      a.x*b.y-a.y*b.x);
  }

  double getLength(PVector a) {
    return Math.sqrt(a.x*a.x + a.y*a.y + a.z*a.z);
  }

  double getDistance(PVector a, PVector b) {
    return Math.sqrt((a.x-b.x)*(a.x-b.x) + (a.y-b.y)*(a.y-b.y) + (a.z-b.z)*(a.z-b.z));
  }

  void makeUnit(PVector a) {
    double len = getLength(a);
    if(len > 0) {
      a.x /= len;
      a.y /= len;
      a.z /= len;
    }
  }

  boolean intersection(PVector lineBase, PVector lineU,
      PVector planeBase, PVector planeV, PVector planeH,
      LinePlaneIntersection result) {
    // TODO
    return true;
  }
}



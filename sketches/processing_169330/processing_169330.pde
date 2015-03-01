
public static class Aide {
  
  //Epsilon value to perform accurate floating-point arithmetics
  static final float e = 1e-5;
  
  public static float distanceSquared(PVector p, PVector s) {
    float d = (p.x-s.x)*(p.x-s.x)+(p.y-s.y)*(p.y-s.y);
    return d;
  }
  
  public static PVector segmentIntersection(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
    float bx = x2 - x1;
    float by = y2 - y1;
    float dx = x4 - x3;
    float dy = y4 - y3;
    float b_dot_d_perp = bx * dy - by * dx;
    if(b_dot_d_perp == 0) {
      return null;
    }
    float cx = x3 - x1;
    float cy = y3 - y1;
    float t = (cx * dy - cy * dx) / b_dot_d_perp;
    if(t < 0 || t > 1) {
      return null;
    }
    float u = (cx * by - cy * bx) / b_dot_d_perp;
    if(u < 0 || u > 1) { 
      return null;
    }
    return new PVector(x1+t*bx, y1+t*by);
  }
  
  public static PVector projSommetSegment(PVector v, PVector w, PVector p) {
    float longueurSegmentSq = (w.x-v.x)*(w.x-v.x)+(w.y-v.y)*(w.y-v.y);
    if(longueurSegmentSq==0) {
      return v;
    }
    float t = PVector.dot(PVector.sub(p,v),PVector.sub(w,v))/longueurSegmentSq;
    if(Float.isNaN(t)){return null;}
    if(t<0.0) {
      return v;
    } else if(t>1.0) {
      return w;
    } else {
      PVector proj = PVector.add(v,PVector.mult(PVector.sub(w,v),t));
      return proj;
    }
  }
  
  public static float calculerAire(ArrayList<Sommet> sommets) {
    int i,j;
    float area = 0.0;
    for (i=0; i<sommets.size(); i++) {
      j = (i + 1) % sommets.size();
      Sommet sommeti = sommets.get(i);
      Sommet sommetj = sommets.get(j);
      area += sommeti.pos.x * sommetj.pos.y;
      area -= sommeti.pos.y * sommetj.pos.x;
    }
    area *= 0.5;
    return(area);
  }
  
  public static boolean ligneIntersection(PVector a1, PVector a2, PVector b1, PVector b2, PVector p) {
    // compute S1 and S2
    PVector s1 = PVector.sub(a1,a2);
    PVector s2 = PVector.sub(b1,b2);
    // compute the cross product (the determinant if we used matrix solving techniques)
    float det = cross2(s1,s2);
    // make sure the matrix isn't singular (the lines could be parallel)
    if (Math.abs(det) < epsilon) {
      // return false since there is no way that the segments could be intersecting
      return false;
    } else {
      // pre-divide the determinant
      det = 1.0 / det;
      // compute t2
      float t2 = det * (cross2(a1,s1) - cross2(b1,s1));
      // compute the intersection point
      // P = B1(1.0 - t2) + B2(t2)
      p.x = b1.x * (1.0 - t2) + b2.x * t2;
      p.y = b1.y * (1.0 - t2) + b2.y * t2;
      // return that they intersect
      return true;
    }
  }
  
  public static float cross2(PVector a,PVector b) {
    return a.x * b.y - a.y * b.x;
  }
  
  private static float epsilon = calculerEpsilon();
  
  private static float calculerEpsilon() {
    float e = 0.5;
    while(1.0+e > 1.0) {
      e*=0.5;
    }
    return e;
  }  
  
}


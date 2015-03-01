
public static class Aide {
  
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
  
}


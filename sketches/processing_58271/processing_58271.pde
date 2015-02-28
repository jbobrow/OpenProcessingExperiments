

//==========================================================
// class:   PCircle - by Gerd Platl
// descr.:  define class PCircle to handle 3d circles
// version: v1.02  2012-04-09
//==========================================================
class PCircle 
{
  PVector center;         // center point of circle
  PVector normal;         // normalized circle plane normal
  float radius;           // circle radius

  //---------------------------------------------------------
  // set circle data given by center, normal and radius
  // input: M         center point of circle
  //        n         circle plane normal
  //        radius    circle radius
  //---------------------------------------------------------
  public PCircle (PVector M, PVector n, float radius) 
  { 
    this.center = new PVector(M.x, M.y, M.z);
    this.normal = new PVector(n.x, n.y, n.z);
    this.radius = radius;
  }
  
  //---------------------------------------------------------
  // set circle data given by 3 points and a plane normal
  // input: A,B,C   3 points of the circle
  //        n       circle plane normal
  //---------------------------------------------------------
  public PCircle (PVector A, PVector B, PVector C, PVector n) 
  { 
    center = new PVector (A.x, A.y, A.z);
    normal = new PVector (n.x, n.y, n.z);
    normal.normalize();            // set normal length = 1.0
    PVector u = new PVector (B.x, B.y, B.z);
    PVector v = new PVector (C.x, C.y, C.z);
    u.sub(A);                      // u = A->B
    v.sub(A);                      // v = A->C
    if (normal.mag() > 0.999)      // |nn| > 0 ?
    {                              // A,B,C not on a line
      float u2 = u.dot(u);         // u2 = u^2
      float v2 = v.dot(v);         // v2 = v^2
      float uv = u.dot(v);         // uv = u.v
      float d = 0.5/(u2*v2-uv*uv); // get determinant
      u.mult(v2 * (u2-uv) * d);    // u = u*k
      v.mult(u2 * (v2-uv) * d);    // v = v*l
      u.add(v);                    // w = k*u + l*v}
      center.add (u);              // M = A + w
      radius = u.mag();            // r = |w|
    }
  }
  //---------------------------------------------------------
  // return object data as string
  //---------------------------------------------------------
  String toString()
  { 
    return "m="+center + " r=" + radius;
  }
  //---------------------------------------------------------
  // move circle in space
  // input: 3d delta step
  //---------------------------------------------------------
  void move (PVector delta) 
  { 
    center.add(delta);
  }
  //---------------------------------------------------------
  // draw circle in 2d
  //---------------------------------------------------------
  void draw2d () 
  { 
    ellipse(center.x, center.y, 2*radius, 2*radius);
  }
  //---------------------------------------------------------
  // draw circle in 3d (needs to be improved)
  //---------------------------------------------------------
  void draw3d () 
  { 
    beginShape();
    for (int ni=0; ni<=72; ni++)
      vertex(center.x + radius*sin(ni*0.0872664626)
            ,center.y + radius*cos(ni*0.0872664626));
    endShape();
  }
}



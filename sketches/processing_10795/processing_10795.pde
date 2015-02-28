
// Basic quadtree demo.
// Click inside a quad to subdivide it.

// AA is off for speed reasons and framerate is limited to 10fps, but these
// are easily changed.
// This isn't optimized particularly well. The entire quadtree is drawn in full
// on every single frame, when I only need to be drawing new divisions as they're
// created.

Box b;
QuadTree q;

void setup() {
  size(600, 600);
  frameRate(10);
  b = new Box(1, 1, width, height);
  q = new QuadTree(b);
  //smooth();
}

void draw() {
  q.drawMe();
  if (mousePressed) {
    if (mouseButton == LEFT) {
      QuadTree isect = q.getSmallestIntersect(mouseX, mouseY);
      if (isect != null) {
        isect.divide();
      }
    }
    else if (mouseButton == RIGHT) {
      q = new QuadTree(b);
    }
  }
  stroke(0);
}

class Box {
  float Xl, Yl;
  float Xh, Yh;
  final static float zero = 1e-20;
  Box(float X_1, float Y_1, float X_2, float Y_2) {
    // Orient so (Xl,Yl) and (Xh,Yh) are min/max extent, respectively
    Xl = min(X_1, X_2);
    Xh = max(X_1, X_2);
    Yl = min(Y_1, Y_2);
    Yh = max(Y_1, Y_2);
  }
  
  boolean pointInside(float x, float y) {
    return x > Xl && x < Xh && y > Yl && y < Yh;
  }
  
  // Compute the intersection of the given ray (where x=R0x+Rdx*t and
  //   y=R0y+Rdy*t) with this box; return two t values, Tnear and Tfar,
  //   which give the entry and exit values of t (> 0)
  float[] intersectRay(float R0x, float R0y, float Rdx, float Rdy) {
    float Tnear = -1e30;
    float Tfar = 1e30;
    
    // First, check slab in X.
    if (abs(Rdx) < zero) {
      // Ray is parallel to X, but starts outside. Fail.
      if (R0x < Xl || R0x > Xh) {
        return null;
      }
    } else {
      float Ta = (Xl-R0x)/Rdx, Tb = (Xh-R0x)/Rdx;
      float T1 = min(Ta,Tb);
      float T2 = max(Ta,Tb);
      if (T1 > Tnear) Tnear = T1;
      if (T2 < Tfar) Tfar = T2;
      if (Tnear > Tfar) return null;
      if (Tfar < 0) return null;
    }
    
    // Then check slab in Y.
    if (abs(Rdy) < zero) {
      // Ray is parallel to X, but starts outside. Fail.
      if (R0y < Yl || R0y > Yh) {
        return null;
      }
    } else {
      float Ta = (Yl-R0y)/Rdy, Tb = (Yh-R0y)/Rdy;
      float T1 = min(Ta,Tb);
      float T2 = max(Ta,Tb);
      if (T1 > Tnear) Tnear = T1;
      if (T2 < Tfar) Tfar = T2;
      if (Tnear > Tfar) return null;
      if (Tfar < 0) return null;
    }
    
    // If we have survived this far, the test passed.
    return new float[] {Tnear, Tfar};
  }
  
  // Divide this box down into 4 quadrants
  Box[] quarter() {
    return quarter(0);
  }
  
  // d = boundary "fuzziness" size
  Box[] quarter(float d) {
    float Xm = 0.5*(Xl+Xh);
    float Ym = 0.5*(Yl+Yh);
    Box[] quads = new Box[4];
    quads[0] = new Box(Xm-d,Yh+d,Xh+d,Ym-d);
    quads[1] = new Box(Xl-d,Yh+d,Xm+d,Ym-d);
    quads[2] = new Box(Xl-d,Ym+d,Xm+d,Yl-d);
    quads[3] = new Box(Xm-d,Ym+d,Xh+d,Yl-d);
    return quads;
  }
  
  void drawMe() {
    rect(Xl, Yl, Xh-Xl, Yh-Yl);
  }
}


// QuadTree class. Subdivide it at will.
class QuadTree {
  Box b;
  QuadTree[] children;
  int level;
  static final int maxLevel = 8;
  
  QuadTree(Box b) {
    this.b = b;
    children = null;
    level = 0;
  }

  QuadTree(Box b, int level) {
    this.b = b;
    children = null;
    this.level = level;
  }

  // Divide into 4 smaller quadtrees.
  // If this exceeds the recursion limit, it will just return null.
  QuadTree[] divide() {
    if (children == null && level < maxLevel) {
      children = new QuadTree[4];
      Box[] b2 = b.quarter();
      for(int i = 0; i < 4; ++i) {
        children[i] = new QuadTree(b2[i], level + 1);
      }
    }
    return children;
  }
  
  // Draw - recursively - the entire quadtree.
  void drawMe() {
    b.drawMe();
    if (children == null) return;
    for(int i = 0; i < 4; ++i) {
      children[i].drawMe();
    }
  }
  
  // Find the smallest of the child quadtrees which contains the given point.
  // If none are found, return null. This won't subdivide any further.
  QuadTree getSmallestIntersect(float x, float y) {
    if (children == null) {
      if (b.pointInside(x,y)) {
        return this;
      }
      else {
        return null;
      }
    }
    for(int i = 0; i < 4; ++i) {
      QuadTree q = children[i].getSmallestIntersect(x, y);
      if (q != null) {
        return q;
      }
    }
    return null;
  }
}

// Basically QuadTree class, but with fuzzy boundaries.
class FuzzyQuadTree extends QuadTree {
  float delta;
  
  FuzzyQuadTree(Box b, float delta) {
    super(b);
    this.delta = delta;
  }

  FuzzyQuadTree(Box b, int level, float delta) {
    super(b, level);
    this.delta = delta;
  }

  // Divide into 4 smaller quadtrees.
  // If this exceeds the recursion limit, it will just return null.
  QuadTree[] divide() {
    if (children == null && level < maxLevel) {
      children = new QuadTree[4];
      Box[] b2 = b.quarter();
      for(int i = 0; i < 4; ++i) {
        children[i] = (QuadTree) new FuzzyQuadTree(b2[i], level + 1, delta);
      }
    }
    return children;
  }

}


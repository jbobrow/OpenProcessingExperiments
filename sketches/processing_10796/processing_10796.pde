
// Quadtree containers demo
// Click to make a point. As soon as more than binSize points are
// inside of a quad, it subdivides.
// Right-click to reset

final static float dotSize = 2;
final static int binSize = 5;
final static color[] colors = new color[4];
Box b;
FuzzyBin q;
DLA dla1;

void setup() {
  size(600, 600);
  frameRate(30);
  //smooth();
  colors[0] = color(127,0,0);
  colors[1] = color(0,127,0);
  colors[2] = color(0,0,127);
  colors[3] = color(127,127,0);
  b = new Box(1, 1, width, height);
  q = new FuzzyBin(b, dotSize);
  dla1 = new DLA(q, binSize);
  dla1.addPoint(width/2, height/2);
}

void draw() {
  q.drawMe();
  fill(0,0,0,0);
  if (mousePressed) {
    if (mouseButton == LEFT) {
      dla1.addPoint(mouseX, mouseY);
      ellipse(mouseX, mouseY, 4*dotSize, 4*dotSize);
    } else if (mouseButton == RIGHT) {
      q = new FuzzyBin(b, dotSize);
      dla1 = new DLA(q, binSize);
      background(255);
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
    quads[0] = new Box(Xm-d, Yh, Xh, Ym-d);
    quads[1] = new Box(Xl, Yh, Xm+d, Ym-d);
    quads[2] = new Box(Xl, Yl, Xm+d, Ym+d);
    quads[3] = new Box(Xm-d, Ym+d, Xh, Yl);
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
      stroke(colors[i]);
      children[i].drawMe();
    }
  }
  
  boolean isDivided() {
    return children != null;
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
      Box[] b2 = b.quarter(delta);
      for(int i = 0; i < 4; ++i) {
        children[i] = (QuadTree) new FuzzyQuadTree(b2[i], level + 1, delta);
      }
    }
    return children;
  }

}

// A FuzzyQuadTree that can contain points in each quad.
class FuzzyBin extends FuzzyQuadTree {
  ArrayList x_points = new ArrayList();
  ArrayList y_points = new ArrayList();
  
  FuzzyBin(Box b, float delta) {
    super(b, delta);
  }

  FuzzyBin(Box b, int level, float delta) {
    super(b, level, delta);
  }  
  // Add a point to this quad if it's inside, _and_ to any other child
  // quads that contain it. Return the undivided child quads which
  // contains it.
  // If this point is outside of the quad, return null.
  ArrayList addPoint(float x, float y) {
    ArrayList tips = new ArrayList();
    if (b.pointInside(x, y)) {
      x_points.add(x);
      y_points.add(y);
      // We've hit an undivided quad; we're done.
      if (children == null) {
        tips.add(this);
        return tips;
      }
      for(int i = 0; i < children.length; ++i) {
        FuzzyBin c = (FuzzyBin) children[i];
        ArrayList tips_new = c.addPoint(x, y);
        tips.addAll(tips_new);
      }
    }
    return tips;
  }
  
  int countPoints() {
    return x_points.size();
  }

  // Divide into 4 smaller quadtrees.
  // If this exceeds the recursion limit, it will just return null.
  // Any points contained are passed on.
  QuadTree[] divide() {
    if (children == null && level < maxLevel) {
      children = new QuadTree[4];
      Box[] b2 = b.quarter(delta);
      for(int i = 0; i < 4; ++i) {
        children[i] = (QuadTree) new FuzzyBin(b2[i], level + 1, delta);
        for(int j = 0; j < x_points.size(); ++j) {
          FuzzyBin f = (FuzzyBin) children[i];
          // Note that addPoint will only add it if it actually belongs.
          f.addPoint((Float)x_points.get(j), (Float)y_points.get(j));
        }
      }
    }
    return children;
  }
  
  // Return an ArrayList of undivided quads (they'll be FuzzyBin objects)
  // which the given ray passes through and which are not empty (that is,
  // they contain some points inside that this ray could conceivably hit).
  ArrayList intersectRay(float r0x, float r0y, float rdx, float rdy) {
    ArrayList bins = new ArrayList();
    // If this quad is empty, we're done.
    if (countPoints() == 0) return bins;
    // This quad has stuff in it. Do we intersect it?
    float[] hit = b.intersectRay(r0x, r0y, rdx, rdy);
    // If we don't hit it, we're done.
    if (hit == null) return bins;
    // Does it have children we can hit?
    // (That doesn't sound right, does it.)
    if (children == null) {
      // If not, we're done _and_ we have a result.
      bins.add(this);
    }
    else {
      // Otherwise, recursively see which children this ray hits.
      for(int i = 0; i < children.length; ++i) {
        FuzzyBin f = (FuzzyBin) children[i];
        ArrayList bins_new = f.intersectRay(r0x, r0y, rdx, rdy);
        bins.addAll(bins_new);
      }
    }
    return bins;
  }
  // This function could be made much more clever be looking at the actual
  // entry and exit points (which Box.intersectRay returns) since there are
  // a lot of cases where it's obvious that it is impossible for an intersection
  // to occur, but I don't feel like applying this.
}

class DLA {
  FuzzyBin bin;
  int binSize;
  
  DLA(FuzzyBin bin) {
    this.bin = bin;
    binSize = 10;
  }
  
  DLA(FuzzyBin bin, int binSize) {
    this.bin = bin;
    this.binSize = binSize;
  }
  
  void addPoint(float x, float y) {
    // Two things happen here:
    // (1) We add the point to the bin.
    // (2) We make sure that every undivided quad contains at most
    // binSize points inside (i.e. we divide some if needed).
    ArrayList f = bin.addPoint(x, y);
    for(int i = 0; i < f.size(); ++i) {
      FuzzyBin bin = (FuzzyBin) f.get(i);
      if (bin.countPoints() > binSize) {
        bin.divide();
        // Uncomment this to see them as they are added.
        //bin.drawMe();
      }
    }
  }
  

}


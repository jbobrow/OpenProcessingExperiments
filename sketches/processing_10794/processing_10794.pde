

// Simple ray-box intersection test.
// Click to change start point of ray.

// This is an implementation of the method described in:
// http://www.siggraph.org/education/materials/HyperGraph/raytrace/rtinter3.htm

final int Xres = 600;
final int Yres = 600;
// Initial starting point of ray
int rayX = 0;
int rayY = 0;
// Box to intersect with
int x0 = Xres/4;
int y0 = Yres/4;
int x1 = 3*Xres/4;
int y1 = 3*Yres/4;

void setup() {
  size(Xres, Yres);
  //smooth();
}

void draw() {
  Box b = new Box(x0, y0, x1, y1);
  background(255);
  rect(x0, y0, x1-x0, y1-y0);
  if (mousePressed) {
    rayX = mouseX;
    rayY = mouseY;
  }
  float mx = mouseX - rayX;
  float my = mouseY - rayY;
  float[] t = b.intersectRay(rayX, rayY, mx, my);
  if (t != null) {
    int x0 = int(rayX + mx*t[0]);
    int y0 = int(rayY + my*t[0]);
    int x1 = int(rayX + mx*t[1]);
    int y1 = int(rayY + my*t[1]);
    fill(25);
    stroke(255,100,100);
    line(x0, y0, x1, y1);
  } else {
    fill(0);
  }
  stroke(0);
  line(rayX, rayY, mouseX, mouseY);

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
}


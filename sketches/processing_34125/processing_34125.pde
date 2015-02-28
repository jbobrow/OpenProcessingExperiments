
class BezierLookup {
  //composite Smiley Class
  Smiley face = new Smiley(width/10, height/2, 100);

  // variables for findroot function.
  float SMALL = 0.0000000001;
  int b;
  float [] OPL = new float[32];
  float[]x = new float[4];
  float[]y = new float[4];
  float yLookup;
  PVector xy;
  PVector stuff;
  BezierLookup(float t, PVector A, PVector B, PVector C, PVector D) {
    // fill coordinate arrays
    // fill coordinate arrays
    x[0] = A.x;//75;
    x[1] = B.x;//75;
    x[2] = C.x;//width-75;
    x[3] = D.x;//width-75;
    y[1] = B.y;//height/2-150;
    y[2] = C.y;//height/2-150; //Top Left
    y[0] = A.y;//height/2;
    y[3] = D.y;//height/2;
  };

  void update(float xMarkerPos, float x0, float y0, float x1, float y1, float x2, float y2, float x3, float y3) {
    // all these ifs are just to anchor the lookup when it is not on the curve
    if (xMarkerPos<=x0) {
      ellipse(xMarkerPos, y0, 10, 10 );
      face.display(width-(width/10), y0);
    }
    if (xMarkerPos>=x3) {
      ellipse(xMarkerPos, y3, 10, 10 );
      face.display(width-(width/10), y3);
    }
    if (xMarkerPos<x3 && xMarkerPos>x0) {
      ellipse(xMarkerPos, getYPos(xMarkerPos, x0, y0, x1, y1, x2, y2, x3, y3), 10, 10 );
      face.display(width-(width/10), getYPos(xMarkerPos, x0, y0, x1, y1, x2, y2, x3, y3));
    }
  }

  int findroot(float x, float q0, float q1, float q2, float q3, float[] o) {
    // ripped straight from blenkernel/intern/fcurve.c : findzero()
    int nr = 0;
    float phi, a, b, c, p, q, d, c0, c1, c2, c3, t; // I've added this to the original function

    c0= q0 - x;
    c1= 3 * (q1 - q0);
    c2= 3 * (q0 - 2 * q1 + q2);
    c3= q3 - q0 + 3.0 * (q1 - q2);

    if (c3 != 0) {
      a= c2/c3;
      b= c1/c3;
      c= c0/c3;
      a= a/3;

      p= b/3 - a*a;
      q= (2*a*a*a - a*b + c) / 2;
      d= q*q + p*p*p;

      if (d > 0) {
        t= sqrt(d);
        o[0]= (sqrt3d(-q+t) + sqrt3d(-q-t) - a);

        if (o[0] >= SMALL && o[0] <= 1.000001) {
          return 1;
        }
        else {
          return 0;
        }
      }

      else if (d == 0) {
        t= sqrt3d(-q);
        o[0]= 2*t - a;

        if (o[0] >= SMALL && o[0] <= 1.000001) {
          nr = nr+1;
        }
        o[nr]= -t-a;

        if (o[nr] >= SMALL && o[nr] <= 1.000001) {
          return nr+1;
        }
        else {
          return nr;
        }
      }	
      else {
        phi= acos(-q / sqrt(-(p*p*p)));
        t= sqrt(-p);
        p= cos(phi/3);
        q= sqrt(3 - 3*p*p);
        o[0]= 2*t*p - a;

        if (o[0] >= SMALL && o[0] <= 1.000001) {
          nr=nr+1;
        }
        o[nr]= -t * (p + q) - a;

        if (o[nr] >= SMALL && o[nr] <= 1.000001) {
          nr=nr+1;
        }
        o[nr]= -t * (p - q) - a;

        if (o[nr] >= SMALL && o[nr] <= 1.000001) {
          return nr+1;
        }
        else { 
          return nr;
        }
      }
    }

    else {
      a=c2;
      b=c1;
      c=c0;

      if (a != 0) {
        // discriminant
        p= b*b - 4*a*c;

        if (p > 0) {
          p= sqrt(p);
          o[0]= (-b-p) / (2 * a);

          if (o[0] >= SMALL && o[0] <= 1.000001) { 
            nr = nr+1;
          }
          o[nr]= (-b+p)/(2*a);

          if (o[nr] >= SMALL && o[nr] <= 1.000001) {
            return nr+1;
          }
          else { 
            return nr;
          }
        }

        else if (p == 0) {
          o[0]= -b / (2 * a);
          if (o[0] >= SMALL && o[0] <= 1.000001) {
            return 1;
          }
          else { 
            return 0;
          }
        }
      }

      else if (b != 0.0) {
        o[0]= -c/b;
        if (o[0] >= SMALL && o[0] <= 1.000001) { 
          return 1;
        }
        else { 
          return 0;
        }
      }

      else if (c == 0) {
        o[0]= 0;
        return 1;
      }	
      return 0;
    }
  }

  float sqrt3d(float d) {
    // ripped straight from blenlib/intern/math_base_inline.c
    if (d==0) {
      return 0;
    }
    if (d<0) {
      return -exp(log(-d)/3);
    }
    else {
      return exp(log(d)/3);
    }
  }


  PVector bezier2(float t, PVector A, PVector B, PVector C, PVector D) {
    float x = pow((1-t), 3)*A.x+3*pow((1-t), 2)*t*B.x+3*(1-t)*pow((t), 2)*C.x+pow((t), 3)*D.x;
    float y = pow((1-t), 3)*A.y+3*pow((1-t), 2)*t*B.y+3*(1-t)*pow((t), 2)*C.y+pow((t), 3)*D.y;
    PVector xy = new PVector(x, y);

    return xy;
  }


  float getYPos(float xSlider, float x0, float y0, float x1, float y1, float x2, float y2, float x3, float y3) {
    b = findroot(xSlider, x0, x1, x2, x3, OPL);
    if (b==1) {
      PVector xy = bezier2(OPL[0], new PVector(x0, y0), new PVector(x1, y1), new PVector(x2, y2), new PVector(x3, y3)); 
      yLookup = xy.y;
    }
    return yLookup;
  }
}



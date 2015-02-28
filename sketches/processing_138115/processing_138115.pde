
class Spline { 
  public Spline(double pos, double tdx, double tdx2) {
    this.tdx = tdx;
    this.tdx2 = tdx2;
    for (int i = 0; i < polysz; ++i) coefficients[i] = 0;
    coefficients[0] = pos;
  }
  
  public void reposition(double t, double dst) {
    double src = interpolate(t);
    double dx = deriv(t);
    double dx2 = deriv2(t);
    
    coefficients[0] = src;
    coefficients[1] = dx;
    coefficients[2] = dx2 / 2.;
    coefficients[3] = (99 * dst - 48 * dx - 9 * dx2 - 99 * src - 22 * tdx + 15 * tdx2) / 4.;
    coefficients[4] = (-1083 * dst + 468 * dx + 66 * dx2 + 1083 * src + 162 * tdx - 208 * tdx2) / 16.;
    coefficients[5] = 3 * (411 * dst - 167 * dx - 3 * (7 * dx2 + 137 * src + 5 * tdx - 31 * tdx2)) / 16.;
    coefficients[6] = (-713 * dst + 279 * dx + 33 * dx2 + 713 * src - 69 * tdx - 181 * tdx2) / 16.;
    coefficients[7] = (207 * dst - 79 * dx - 9 * dx2 - 207 * src + 49 * tdx + 57 * tdx2) / 16.;
    coefficients[8] = (-24 * dst + 9 * dx + dx2 + 24 * src - 9 * tdx - 7 * tdx2) / 16.;
  }

  public double interpolate(double t) {
    double s = 0.0;
    for (int i = 0; i < polysz; ++i) s += coefficients[i] * Math.pow(t,i);
    return(s);
  }
  public double deriv(double t) {
    double s = 0.0;
    for (int i = 1; i < polysz; ++i) s += i * coefficients[i] * Math.pow(t,(i-1));
    return(s);
  } 
  public double deriv2(double t) {
    double s = 0.0;
    for (int i = 2; i < polysz; ++i) s += (i*(i-1)) * coefficients[i] * Math.pow(t,(i-2));
    return(s);
  } 
  
  int polysz = 9;
  double coefficients[] = new double[polysz];
  double tdx, tdx2;
}

float fly_zlo = 0.2;
float fly_zhi = 2.0;
class Fly {
  public Fly(double x, double y, double z, float speed, float orientation) {
    this.t = 0;
    this.speed = speed;
    this.wingphase = 0;
    this.orientation = orientation;
    this.xspline = new Spline(x,0,0);
    this.yspline = new Spline(y,0,0);
    this.zspline = new Spline(z,0,0);
  }

  void reorient(double mx, double my) {
    reorient(mx, my, zspline.interpolate(t));
  }

  void reorient(double mx, double my, double mz) {
    this.xspline.reposition(t, mx);
    this.yspline.reposition(t, my);
    this.zspline.reposition(t, mz);
    t = 0;
  }
  
  void draw() {
    /* 100 means fly right to the destination. */
    t = t + speed/100.;
    if ((!auto) && (t > 1.0)) t = 1.0;
    else if ((auto) && (t > 0.5)) {
      float xtarg = random(0,width);
      float ytarg = random(0,height);
      float ztarg = random(fly_zlo, fly_zhi);
      this.reorient(xtarg, ytarg, ztarg);
    }
    
    float x = (float)xspline.interpolate(t);
    float y = (float)yspline.interpolate(t);
    float z = (float)zspline.interpolate(t);
    
    if (track) {
      double ss = 0.01;
      float tracklength = 2.0;
      for (double tt = ss; tt < tracklength; tt += ss) {
         float sx = (float)xspline.interpolate(tt-ss);
         float sy = (float)yspline.interpolate(tt-ss);
         float dx = (float)xspline.interpolate(tt);
         float dy = (float)yspline.interpolate(tt);
         strokeWeight(1);
         stroke(#ffffff);
         fill(#ffffff);
         line(sx, sy, dx, dy);

/*         
         line(
           map((float)(tt-ss),0,tracklength,0,width), map(sx, 0, width, 0, height/3),
           map((float)(tt   ),0,tracklength,0,width), map(dx, 0, width, 0, height/3)
         );

         line(
           map((float)(tt-ss),0,tracklength,0,width), map(sy, 0, height, height*2/3, height),
           map((float)(tt   ),0,tracklength,0,width), map(dy, 0, height, height*2/3, height)
         );
*/
      }
/*
      strokeWeight(5);
      stroke(#ff0000);
      fill(#ff0000);
      point(map(t   ,0,tracklength,0,width), map(x, 0, width, 0, height/3));
      point(map(t   ,0,tracklength,0,width), map(y, 0, height, height*2/3, height));
 */
    }
    
    float dxdt = (float)xspline.deriv(t);
    float dydt = (float)yspline.deriv(t);
    double epsilon = 0.01; 
    if ((!
      ((-epsilon <= dxdt) && (dxdt <= epsilon) && (-epsilon <= dydt) && (dydt <= epsilon)) 
    )) {
      orientation = atan2(-dxdt, dydt);
    }
    wingphase += 10;
    float wingtheta = 45.0 * sin(radians(wingphase));
    pushMatrix();
    translate(x, y);
    rotate(orientation);
    scale(1/z);
    
    strokeWeight(3);
    stroke(#0000ff);
    fill(#ffff00);
    int bodysz = 5;
    ellipse(0,-sin(radians(wingphase)),bodysz*2,bodysz*2);
    stroke(#ff0000);
    line(0,-2,0,2);
    line(1,1,0,2);
    line(0,2,-1,1);
    stroke(#0000ff);
    pushMatrix();
    fill(#80ff80);
    int wingsz = 15;
    rotate(radians(wingtheta));
    ellipse(wingsz+bodysz,0,2*wingsz, 2*bodysz);
    popMatrix();
    pushMatrix();
    fill(#ff8000);
    rotate(radians(180-wingtheta));
    ellipse(wingsz+bodysz,0,2*wingsz, 2*bodysz);
    popMatrix();
    
    popMatrix();
  }

  float orientation;  
  float wingphase;
  float t;
  float speed;
  Spline xspline;
  Spline yspline;
  Spline zspline;
  boolean track = false;
  boolean auto = true;
}


int num_flies = 4;
Fly flies[] = null;
Float lastx = null;
Float lasty = null;
void setup() {
  size(800,600);
  flies = new Fly[num_flies];
  for (int i = 0; i < num_flies; ++i) {
    flies[i] = new Fly(random(0,width),random(0,height),random(fly_zlo, fly_zhi),1,random(0,TWO_PI));
  }
}

void draw() {
  background(#000000);
  textAlign(LEFT, BOTTOM);
  stroke(#ffffff);
  fill(#ffffff);
  text("Click the mouse to feed them; type 't' to see their planned path; type 'a' to make them fly by themselves.", 0, height);
  for (Fly f : flies) f.draw();
}

void mouseDragged() {
  for (Fly f : flies) f.reorient(mouseX + random(-10,10), mouseY + random(-10,10), random(fly_zlo, fly_zhi));
}

void mousePressed() {
  for (Fly f : flies) f.reorient(mouseX + random(-10,10), mouseY + random(-10,10), random(fly_zlo, fly_zhi));
}

void keyPressed() {
  if (key == 't') { for (Fly f: flies) f.track = !f.track; }
  if (key == 'a') { for (Fly f: flies) f.auto = !f.auto; }
}



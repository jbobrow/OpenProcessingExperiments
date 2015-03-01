


class Particle {

  float x;
  float y;
  int type;
  float phi;
  float ohm;
  PVector v;
  PVector F;
  float sinang;
  
  static final float c = 1;

  static final int FOTON    = 0;
  static final int PROTON   = 1;
  static final int ELECTRON = 2;

  boolean moving;

  Particle(float x, float y, int type, boolean moving) {
    this.x      = x;
    this.y      = y;
    this.type   = type;
    this.moving = moving;
    this.phi    = random(TWO_PI);
    this.ohm    = 0.1;
    this.v      = new PVector();
    this.v      = PVector.fromAngle(random(TWO_PI));
    this.v.mult(c);
    this.F      = new PVector();
//    this.F      = PVector.fromAngle(random(TWO_PI));
    this.sinang = 0;
  }

  void draw() {
    pushStyle();
    ellipseMode(CENTER);
    noStroke();
    switch(type) {
    case FOTON:
      if(sinang>0) {fill(255,100,0);} else {fill(0,200,255);}
      ellipse(x, y, 0.5*sinang*ex, 0.5*sinang*ex);
      break;
    case PROTON:
      fill(255, 0, 0);
      ellipse(x, y, 2*ex, 2*ex);
      break;
    case ELECTRON:
      fill(0, 0, 255);
      ellipse(x, y, 1*ex, 1*ex);
      break;
    }
    popStyle();
  }

  void update() {
    switch(type) {
    case FOTON:
//      sinang = abs(sin(ohm*frameCount+phi));
      sinang = (sin(ohm*frameCount+phi));
      F.mult(0);
      for(int i=protons.size()-1; i>=0; i--) {
        Particle pr = protons.get(i);
        PVector f = new PVector( pr.x-x, pr.y-y );
        f.normalize();
        f.mult(sign(sinang));
        f.mult(1000/pow(dist(x,y,pr.x,pr.y),2));
        stroke(255,50);
//        line(x, y, x+30*f.x, y+30*f.y);
        F.add(f);
      }
      v.add(PVector.mult(F, 0.01));
        v.normalize();
        v.mult(c);
      break;
    }
    if (moving) {
      x+=v.x;
      y+=v.y;
    }
  }
  
  int sign(float q) {
    if(q>0) return 1;
    if(q<0) return -1;
    return 0;
  }
}


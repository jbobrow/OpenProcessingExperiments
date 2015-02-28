
class Galaxy {
  float xorigin;
  float yorigin;
  int cH;
  int cS;
  int cB;
  float xpos;
  float ypos;
  float csize;
  float oradius;
  float vr;
  float theta;
  String name;
  int sollimit = int(random(320,480)); // Number of Solar Systems by Galaxy
  SolarSystem[]sol = new SolarSystem[sollimit];

  Galaxy(int _cH, int _cS, int _cB, float temporadius, float tempsize, float xo, float yo) {
    cH = getTemp(_cH);
    cS = _cS;
    cB = _cB;
    oradius = temporadius;
    vr = sqrt(2*12800/sq(oradius));
    xpos = xo;
    ypos = yo-oradius;
    csize = tempsize;
    theta = 0;
    xorigin = xo;
    yorigin = yo;
    for (int i=0;i<sollimit;i++) {
      sol[i] = new SolarSystem(int(random(0,90)), // Hue
                               int(random(0,180)), // Saturation
                               int(random(270,270)), // Brightness
                               random(150,6400),
                               random(40,80),
                               xpos,
                               ypos,
                               random(2)<0.25);
    }
    snum+=sollimit;
  }
  
  int getTemp(int col) {
    if (col > 60) return col+180;
    else return col;
  }
  
  void orbit() {
    theta = (theta + vr/oradius * gaSpeed * 25);
    xpos = xorigin-oradius*sin(theta);
    ypos = yorigin-oradius*cos(theta);
    for (int i=0;i<sollimit;i++) {
      sol[i].orbit();
    }
  }
  
  void light() {
    if (keepOnScreen()) {
      if (scaleUp < 0.1 && scaleUp > 0.01) {
        float[] cscale = {1.05, 1.3, 1.4, 1.5, 1.7, 1.9, 2.3, 2.6};
        for (int n=0;n<cscale.length;n++) {
          noStroke();
          ellipseMode(CENTER);
          fill(color(cH, cS, 360, cscale[n]/(scaleUp*40)));
          ellipse(xpos,ypos,(csize/cscale[n])/(scaleUp*8),(csize/cscale[n])/(scaleUp*8));
        }
      } else {
        float[] cscale = {1.05, 1.3, 1.4, 1.5, 1.7, 1.9, 2.3, 2.6};
        for (int n=0;n<cscale.length;n++) {
          noStroke();
          ellipseMode(CENTER);
          fill(color(cH, cS*(scaleUp*100), 360, cscale[n]/(scaleUp*40)));
          ellipse(xpos,ypos,(csize/cscale[n])/(0.01*8),(csize/cscale[n])/(0.01*8));
        }
      }
    }
  }
  
  boolean inRange() {
    boolean range = true;
    if (scaleUp < 0.005) {
      range = false;
    }
    return range;
  }
  
  boolean keepOnScreen() { 
    boolean onScreen = true;
    if (xpos + csize*3 < screenOrigX
     || xpos - csize*3 > screenWidth
     || ypos + csize*3 < screenOrigY
     || ypos - csize*3 > screenHeight) {
      onScreen = false;
    }
    return onScreen;
  }
  
  void display() {
    for (int i=0;i<sollimit;i++) {
      sol[i].update(xpos,ypos);
      if (inRange()) {
        if (traceenabled==3||traceenabled==4||traceenabled==5||traceenabled==6) { // Only if trace is toggled on
          sol[i].trace();
        }
      }
    }
    for (int i=0;i<sollimit;i++) {
      if (lighting) {
        sol[i].light();
      }
      if (inRange()) {
        sol[i].display();
      }
    }
  }
}


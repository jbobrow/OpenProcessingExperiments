
class Sweep {
  // feet
  float ox, oy;
  float x, y;
  float xinc;

  float ogage;
  float gage;

  color myc;

  float time;
  float sg;

  Sweep(float X, float Y, float Gage) {
    // init
    // set origins
    ox = X;
    oy = Y;
    ogage = Gage;

    // initialize starting conditions
    selfinit();
  }

  void selfinit() {
    // init color sweeps
    myc = somecolor();
    sg = random(0.01,0.1);
    x = ox;
    y = oy;
    oy = oy + random(20) + 3;
    if (oy > dimension) oy = 1;
    gage = ogage;
    xinc = 1.0;
  }

  void render() {
    // move through time
    x+=xinc;
    if (x>dimension) selfinit();

    tpoint(int(x),int(y),myc,0.007);

    sg += random(-0.042, 0.042);

    if (sg < -0.3) {
      sg = -0.3;
    } else if (sg > 0.3) {
      sg = 0.3;
    } else if ((sg > -0.05) && (sg < 0.05)) {
      sg = 0.05;
      if (random(10000)>9500) myc = somecolor();
    }

    float wd = 100.0;
    float w = sg/wd;
    
    for (int i=0;i<wd;i++) {
      tpoint(int(x),int(y + gage*sin(i*w)),myc,0.1-i/(200.0*10+10));
      tpoint(int(x),int(y - gage*sin(i*w)),myc,0.1-i/(200.0*10+10));
    }
  }
}



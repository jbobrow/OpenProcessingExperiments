
class Curva {
  float lcgros[], lccol[], lcpix[], lcpiy[], lcvel[], lclong[], ang[], radio[];

  Curva() {
    lcgros = new float[qlc];
    lcpix = new float[qlc];
    lcpiy = new float[qlc];
    lcvel = new float[qlc];
    lccol = new float[qlc];
    lclong = new float[qlc];
    ang = new float[qlc];
    radio = new float[qlc];

    for (int i=0; i<qlc; i++) {
      ang[i] = random(radians(360));
      lclong[i] = ang[i]*2;
      radio[i] = random(5, 200);
      lcpix[i] = random(width);
      lcpiy[i] = random(height);
      lccol[i] = random(100, 255);
      lcgros[i] = random(0.75, 2);
      lcvel[i] = random(0.005, 0.03);
    }
  }

  void draw() {


    for (int i=0; i<qlc; i++) {
      stroke(lccol[i], lccol[i]);
      strokeWeight(lcgros[i]);
      pushMatrix();
      translate(lcpix[i], lcpiy[i]);
      point(cos(ang[i])*radio[i], sin(ang[i])*radio[i]);
      popMatrix();
      ang[i]+=lcvel[i];
      if (ang[i]>lclong[i]) {
        ang[i]=0;
        lcpix[i] = random(width);
        lcpiy[i] = random(height);
        ang[i] = random(radians(360));
        lclong[i] = ang[i]*2;
        radio[i] = random(5, 200);
      }
    }
  }
}



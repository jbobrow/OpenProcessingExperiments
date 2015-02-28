
class Cloud {
  float cX, cY;
  float cWidth, cHeight;
  int cDensity; // Number of cloud particles
  float cSpeed;
  
  // each cloud is made up of particles with the following attributes
  float[] cPartX;
  float[] cPartY;
  float[] cOffX;
  float[] cOffY;
  float[] cPartRad; // Particle Radius
  
  Cloud(float _cX, float _cY, int _cDensity) {
    cX = _cX; cY = _cY;
    cWidth = random(80,140);
    cHeight = random(60,120);
    cDensity = _cDensity;
    cSpeed = 0.01;
    
    cPartX = new float[cDensity];
    cPartY = new float[cDensity];
    cOffX = new float[cDensity];
    cOffY = new float[cDensity];
    cPartRad = new float[cDensity];
    
    for (int i=0; i<cDensity; i++) {
      cOffX[i] = (random(-cWidth,cWidth)/2.0);
      cOffY[i] = (random(-cHeight,cHeight)/2.0);
      cPartX[i] = cX + cOffX[i];
      cPartY[i] = cY + cOffY[i];
      cPartRad[i] = random(10,30);
    }
  }
  
  void update() {
    for (int i=0; i<cDensity; i++) {
      cX -= cSpeed;
      if (cX < -cWidth) {
        cX = width + cWidth*2;
      }
      
      cPartX[i] = cX + cOffX[i];
    }
  }
}


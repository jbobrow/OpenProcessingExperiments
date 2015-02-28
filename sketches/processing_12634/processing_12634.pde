
class Sphere {


  int         radius, uDetail, vDetail;
  float[]     uGrid, vGrid;
  float[][][] allPoints;

  ////////////////////////////////////////////////////////////////////////
  Sphere(int radius, int uDetail, int vDetail) {

    this.radius  = radius;
    this.uDetail = uDetail;
    this.vDetail = vDetail;

    uGrid = new float[uDetail+1];
    vGrid = new float[vDetail+1];
    allPoints = new float[uDetail+1][vDetail+1][3];


    for(int i = 0; i <= uDetail; i++) {
      uGrid[i] = i / (float) uDetail;
    }

    for (int i = 0; i <= vDetail; i++) {
      vGrid[i] = i / (float) vDetail;
    }

    for(int i = 0; i <= uDetail; i++) {
      for(int j = 0; j <= vDetail; j++) {
        allPoints[i][j] = mercatorPoint(radius, uGrid[i], vGrid[j]);
      }
    }
  }

  ////////////////////////////////////////////////////////////////////////
  float[] mercatorPoint(int radius, float x, float y) {
    

    float[] thisPoint = new float[3];
    float phi = x*2*PI;
    float theta = PI - y*PI;
    float radius2 = random((radius-(radius/12)), (radius+(radius/12)));

    thisPoint[0] = radius2*sin(theta)*cos(phi);
    thisPoint[1] = radius2*sin(theta)*sin(phi);
    thisPoint[2] = radius2*cos(theta);

    return thisPoint;
  }

  ////////////////////////////////////////////////////////////////////////
  void drawSphere() {

    for(int j = 0; j < vDetail; j++) {
      beginShape(TRIANGLE_STRIP);
      for(int i = 0; i <= uDetail; i++) {
        vertex(allPoints[i][j+1][0],   allPoints[i][j+1][1],   allPoints[i][j+1][2]);//,   xGrid[i],   yGrid[j+1]);
        vertex(allPoints[i][j][0],     allPoints[i][j][1],     allPoints[i][j][2]);//,     xGrid[i],   yGrid[j]);
      }
      endShape(CLOSE);
    }
  }
}



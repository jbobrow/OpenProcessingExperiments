
class brokenLine {
  
  private float[][] pts;
  private float[] offset;
  
  public brokenLine() {
    pts = new float[ptsnum][6];
    for (int i=0; i<ptsnum; i++) {
      pts[i] = new float[]{-1,-1,-1};
    }
    offset = new float[]{0,0,0};
  }
  
  public void update() {
    for (int i = ptsnum-1; i >=0 ; i--) {
      if (i == 0) {
        pts[i][0] += random(-range,range);
        pts[i][1] += random(-range,range);
        pts[i][2] = 0;
        if (pts[i][0] > width/2)
          pts[i][0] = width/2;
        if (pts[i][0] < -width/2)
          pts[i][0] = -width/2;
        if (pts[i][1] > height/2)
          pts[i][1] = height/2;
        if (pts[i][1] < -height/2)
          pts[i][1] = -height/2;
      } else {
        pts[i][0] = pts[i-1][0];
        pts[i][1] = pts[i-1][1];
        pts[i][2] = -i * range;
      }
    }
  }
  
  public void doDraw() {
    noFill();
    stroke(255, linealpha);
    
    /*
    for (int i = 1; i < ptsnum; i++) {
      if (pts[i][0] == -1 && pts[i][1] == -1)
        continue;
      line(
        pts[i-1][0],pts[i-1][1],pts[i-1][2],
        pts[i][0],pts[i][1],pts[i][2]);    
    }
    */
    
    int firsti = -1;
    int lasti = -1;
    beginShape();
    for (int i = 1; i < ptsnum; i++) {
      if (pts[i][0] == -1 && pts[i][1] == -1)
        continue;
      if (firsti == -1) {
        curveVertex(pts[i][0],pts[i][1],pts[i][2]);
        firsti = i;
      }
      curveVertex(pts[i][0],pts[i][1],pts[i][2]);
      lasti = i;
    }
    if (lasti != -1) {
      curveVertex(pts[lasti][0],pts[lasti][1],pts[lasti][2]);
    }
    endShape();
    
    // if (pts[0][0] != -1 && pts[0][1] != -1) {
    //   fill(255, linealpha);
    //   noStroke();
    //   ellipse(pts[0][0], pts[0][1], 1, 1);
    // }
  }
  
}


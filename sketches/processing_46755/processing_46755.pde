
class Branch {
  int level;
  int num;
  Punto[] pts;
  Punto[] midPts= {
  };
  Punto[] projdPts= {
  };
  Branch[] branches = {
  };

  Branch(int level, int num, Punto[] pts) {
    this.level = level;
    this.num = num;
    this.pts = pts;
    midPts = calcMids();
    projdPts = calcStruct();

    if (level + 1 < maxLevels) {
      for (int k =0; k < pts.length; k++) {
        int nxt = k -1;
        if ( nxt < 0)
          nxt += pts.length;
        Punto[] nPunto = { 
          projdPts[k], midPts[k], pts[k], midPts[nxt], projdPts[nxt]
        };
        Branch children = new Branch(level +1, k+1, nPunto);
        branches = (Branch[])append(branches, children);
      }
    }
  }

  void draw() {
    strokeWeight(abs(maxLevels - level));
    for (int i =0; i < pts.length; i++) {
      int nxt = i+1;
      if (nxt ==  pts.length)
        nxt = 0;
     stroke(0 + level*i, frameCount%10 + 50);
      line(pts[i].x, pts[i].y + random(-12, 12), pts[nxt].x, pts[nxt].y + random(-12, 12));
     // noFill();
     // stroke(0, 40);
     // point(pts[i].x, pts[i].y);
    }

    for (int i =0; i < branches.length; i++) {
      branches[i].draw();
    }
  }

  Punto[] calcMids() {
    Punto[] pta = new Punto[pts.length];
    for (int i =0; i < pts.length; i++) {
      int nxt =i +1;
      if (nxt ==  pts.length)
        nxt = 0;
      Punto ptmp = calcMid( pts[i], pts[nxt] );
      pta[i] =  ptmp;
    }
    return pta;
  }

  Punto calcMid(Punto pt1, Punto pt2) {
    float midX;
    float midY;

    if (pt1.x > pt2.x) {
      midX = pt2.x + ((pt1.x - pt2.x)/2);
    }
    else {
      midX = pt1.x + ((pt2.x - pt1.x)/2);
    }

    if (pt1.y > pt2.y) {
      midY = pt2.y + ((pt1.y - pt2.y)/2);
    }
    else {
      midY = pt1.y + ((pt2.y - pt1.y)/2);
    }
    return new Punto(midX, midY);
  }

  Punto[] calcStruct() {
    Punto[] strcta = new Punto[midPts.length];
    for (int i =0; i < midPts.length; i++) {
      int nxt = i + 2;
      if (nxt >=  midPts.length)
        nxt -= midPts.length;
      Punto ptmp = calcProj( midPts[i], pts[nxt] );
      strcta[i] =  ptmp;
    }
    return strcta;
  }

  Punto calcProj(Punto mpt, Punto opt) {
    float px;
    float py;

    float adj;
    float adjO;

    if (opt.x > mpt.x) {
      adjO = opt.x - mpt.x;
    }
    else {
      adjO = mpt.x - opt.x;
    }

    if (opt.y > mpt.y) {
      adj = opt.y - mpt.y;
    }
    else {
      adj = mpt.y - opt.y;
    }

    if (opt.x > mpt.x) {
      px =  mpt.x + (adjO * factor);
    }
    else {
      px =  mpt.x - (adjO * factor);
    }

    if (opt.y > mpt.y) {
      py =  mpt.y + (adj * factor);
    }
    else {
      py =  mpt.y - (adj * factor);
    }
    return new Punto(px, py);
  }
}



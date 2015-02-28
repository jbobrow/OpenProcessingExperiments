
class  Cell {
  PVector loc;
  float s;
  color c;
  int nSides;
  float[] nVals;
  float[] mVals;
  float[] oVals;
  boolean isDead;
  boolean isDragged = false;
  boolean shake;
  int shakeCounter;
  
  Cell(float x_, float y_, float s_, color c_) {
    loc = new PVector(x_, y_);
    s = s_;
    c = color(c_);
    nSides = 24;
    nVals = new float[nSides];
    mVals = new float[nSides];
    oVals = new float[nSides];
    for (int i=0; i<(int)nSides; i++) {
      nVals[i] = random(255);
      mVals[i] = random(255);
      oVals[i] = random(255);
    }
    isDead = false;
    shake = false;
    shakeCounter = 0;
  }
  
  Cell[] divide() {
    Cell[] cs = new Cell[2];
    float ta = random(TWO_PI);
    cs[0] = new Cell(loc.x+(cos(ta)*(s/2)), loc.y+(sin(ta)*(s/2)), s/4*3, color(constrain(random(red(c)-32, red(c)+32), 0, 192), 
                                                                                constrain(random(green(c)+32, green(c)-32), 0, 192),
                                                                                constrain(random(blue(c)-32, blue(c)+32), 0, 192)));
    cs[1] = new Cell(loc.x+(-cos(ta)*(s/2)), loc.y+(-sin(ta)*(s/2)), s/4*3, color(constrain(random(red(c)-32, red(c)+32), 0, 192), 
                                                                                constrain(random(green(c)+32, green(c)-32), 0, 192),
                                                                                constrain(random(blue(c)-32, blue(c)+32), 0, 192)));
    isDead = true;
    return cs;
  }
  
  void update() {
    if (isDragged) {
      loc.x += mouseX-pmouseX;
      loc.y += mouseY-pmouseY;
    }
    
    if (shake)
    {
      shakeCounter++;
      if (shakeCounter>128) {
        doSplit();
      }
    }
  }
  
  void render() {
    noStroke();
    fill(c, 12);
    
    float n = nSides;
    beginShape();
    curveTightness(0);
    for (int i=0; i<n; i++) {
      curveVertex(loc.x+cos(TWO_PI*(i/n))*(s-(s/4)+(s/4)*noise(nVals[i])), loc.y+sin(TWO_PI*(i/n))*(s-(s/4)+(s/4)*noise(nVals[i])));
      if (shake) {
        nVals[i] += random(0, 0.2);
      } else {
        nVals[i] += random(0, 0.025);
      }
    }
    for (int i=0; i<n-1; i++) {
      curveVertex(loc.x+cos(TWO_PI*(i/n))*(s-(s/4)+(s/4)*noise(nVals[i])), loc.y+sin(TWO_PI*(i/n))*(s-(s/4)+(s/4)*noise(nVals[i])));
    }
    endShape();
    
    fill(c, 6);
    beginShape();
    for (int i=0; i<n; i++) {
      curveVertex(loc.x+cos(TWO_PI*(i/n))*(s-(s/4)+(s/4)*noise(mVals[i])), loc.y+sin(TWO_PI*(i/n))*(s-(s/4)+(s/4)*noise(mVals[i])));
      if (shake) {
        mVals[i] += random(0, 0.2);
      } else {
        mVals[i] += random(0, 0.025);
      }
    }
    for (int i=0; i<n-1; i++) {
      curveVertex(loc.x+cos(TWO_PI*(i/n))*(s-(s/4)+(s/4)*noise(mVals[i])), loc.y+sin(TWO_PI*(i/n))*(s-(s/4)+(s/4)*noise(mVals[i])));
    }
    endShape();
    
    fill(c, 2);
    beginShape();
    for (int i=0; i<n; i++) {
      curveVertex(loc.x+cos(TWO_PI*(i/n))*(s-(s/4)+(s/4)*noise(oVals[i])), loc.y+sin(TWO_PI*(i/n))*(s-(s/4)+(s/4)*noise(oVals[i])));
      if (shake) {
        oVals[i] += random(0, 0.2);
      } else {
        oVals[i] += random(0, 0.025);
      }
    }
    for (int i=0; i<n-1; i++) {
      curveVertex(loc.x+cos(TWO_PI*(i/n))*(s-(s/4)+(s/4)*noise(oVals[i])), loc.y+sin(TWO_PI*(i/n))*(s-(s/4)+(s/4)*noise(oVals[i])));
    }
    endShape();
  }
  
  void doSplit()
  {
    Cell[] cs = divide();
    cells.add(cs[0]);
    cells.add(cs[1]);
  }
  
  boolean mouseOver() {
    float d = dist(mouseX-(width/2), mouseY-(height/2), loc.x, loc.y);
    if (d<s) {
      return true;
    }
    return false;
  }
}


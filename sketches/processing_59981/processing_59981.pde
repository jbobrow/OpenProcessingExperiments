
class  Cell {
  PVector loc;
  float s;
  color c;
  int nSides;
  float[] nVals;
  
  Cell(float x_, float y_, float s_, color c_) {
    loc = new PVector(x_, y_);
    s = s_;
    c = color(c_);
    nSides = 24;
    nVals = new float[nSides];
    for (int i=0; i<(int)nSides; i++) {
      nVals[i] = random(0, 5);
    }
  }
  
  void render() {    
    float n = nSides;
    stroke(c, 64);
    strokeWeight(0.5);
    beginShape();
    for (int i=0; i<n; i++) {
      vertex(loc.x+cos(TWO_PI*(i/n))*(s-(s/4)+(s/4)*noise(i, nVals[i])), loc.y+sin(TWO_PI*(i/n))*(s-(s/4)+(s/4)*noise(i, nVals[i])));  
      nVals[i] += random(0, 0.025);
    }
    endShape(CLOSE);    
  }
}


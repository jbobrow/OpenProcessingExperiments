

class moire {
  PVector center;
  PVector domain;
  float theta;


  moire(PVector c, int diameter, float begin) {
    center = c;
    diameter = diameter;
    theta = begin;
  }

  void checkMoire (int i, int j) {
    domain = new PVector(i, j);
    float d = PVector.dist(center, domain);

    if(d < moireSize) {
      calcMoire(domain);
    }
  }


  void calcMoire (PVector domain) {
    float x, y;

    x = domain.x - center.x;
    y = domain.y - center.y;

    pushMatrix();
    translate(center.x, center.y);    
    rotate(radians(theta));
    dispMoire(x, y);
    popMatrix();

  }

  void dispMoire(float x, float y) {

    noStroke();
    fill(moireColor);
    ellipse(x, y, diameter, diameter);

  }

  float rotateMoire() { 
    return theta++;  

  }

}









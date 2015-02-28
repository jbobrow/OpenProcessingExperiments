
class Ring {

  float or, ir;     //outer and inner radius
  int n;            // number of segments
  float x, y;
  float theta=0;
  float dtheta=0;
  boolean[] doDraw; // stores whether a segment is drawn or not
  float mainHue;
  float sat = 1;

  Ring(float x, float y, float or, float ir, int n) {
    this.x=x;
    this.y=y;
    this.or=or;
    this.ir=ir;
    this.n=n;
    doDraw = new boolean[n];
    generatePattern();
    pickHue();
  }

  void pickHue() {
    mainHue = (360-10 + int(random(40)))%360;
  }

  void generatePattern() {
    int start = 0;
    int end = int(random(n/7, n/4));
    while (true) {
      if (end >= n) {
        end = n-1;
        pickPattern(start, end);
        break;
      }
      pickPattern(start, end);
      start = end+1;
      end = start + int(random(n/7, n/4));
    }
  }
  
  // pick a pattern for an interval
  // the interval becomes solid, invisible or alternating
  void pickPattern(int start, int end) {
    float pattern = random(1);
    int altWidth = int(random(1, 6));
    for (int i = start; i <=end; i++) {
      if (pattern < 0.2) {
        doDraw[i] = true;
      } 
      else if (pattern < 0.5) {
        doDraw[i] = false;
      } 
      else {
        doDraw[i] = (i/altWidth%2==0);
      }
    }
  }

  void clearPattern() {
    for (int i = 0; i < doDraw.length; i++) {
      doDraw[i] = false;
    }
  }

  void draw() {
    pushMatrix();
    translate(x, y);
    rotate(theta);
    for (int i = 0; i < n; i++) {
      if (!doDraw[i]) {
        continue;
      }
      beginShape(QUAD);
      stroke(mainHue, sat, 1);      
      fill(mainHue, sat, 0.8, 100);
      vertex(ir*cos(2*PI*i/n), 
      ir*sin(2*PI*i/n));

      vertex(or*cos(2*PI*i/n), 
      or*sin(2*PI*i/n));

      vertex(or*cos(2*PI*(i+1)/(n)), 
      or*sin(2*PI*(i+1)/(n)));

      vertex(ir*cos(2*PI*(i+1)/(n)), 
      ir*sin(2*PI*(i+1)/(n)));
      endShape();
    }

    popMatrix();
  }

  void update() {
    theta +=dtheta;
  }
}




// vector rotation. Ch1 and Ch6  'Nature of Code'  Daniel Shiffman.

VectorManager vM;

void setup() {
  size(600, 600);
  vM = new VectorManager();
  vM.makeVectors();
}

void draw() {
  background(0);
  stroke(#11F2F0);
  strokeWeight(.8);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);

  vM.update();
  vM.display();
}


// for use in Js mode
static class Vec2D {
  // polar implementation, angle and magnitude
  static PVector degDist(float angDeg, float distance) {
    float theta = radians(angDeg);
    float dx = distance * cos(theta);
    float dy = distance * sin(theta);
    PVector v = new PVector(dx, dy);
    return v;
  }
  
  void rotateDeg(PVector v, float angDeg) {
    float theta = radians(angDeg);
    float xTemp = v.x;
    v.x = v.x*cos(theta) - v.y*sin(theta);
    v.y = xTemp*sin(theta) + v.y*cos(theta);
  }
}

class VisualVector {
  PVector startPt, finishPt, copy; 
  color col;
  float size, mag;

  VisualVector() {
    startPt  = new PVector(width/2, height/2);
    size = 20;
    copy = new PVector();
  }

  void display(PVector f, color c) {
    pushMatrix();
    finishPt = f;
    col = c;
    translate(startPt.x, startPt.y);

    stroke(col);
    strokeWeight(1.5);
    line(0, 0, finishPt.x, finishPt.y); // the vector

    stroke(#11F2F0);
    strokeWeight(.8);
    line(0, finishPt.y, finishPt.x, finishPt.y); // dx
    line(finishPt.x, 0, finishPt.x, finishPt.y); // dy

    // turn a copy of the finishPt into the 'end of the wide line pt' 
    copy = finishPt.get();
    mag = copy.mag(); 
    copy.normalize();
    copy.mult(mag-size);
    stroke(#F2ED53); //randCol()
    strokeWeight(10);
    line(finishPt.x, finishPt.y, copy.x, copy.y);
    popMatrix();
  }

  color randCol() {
    float r = random(255);
    float g = random(255);
    float b = random(255);
    color c =  color(r, g, b);
    return c;
  }
}

class VectorManager { 
  Vec2D vec2D;
  VisualVector  visualVector;
  PVector[] vectors;
  color col;
  int num;
  float mag, incr;

  VectorManager() {
    visualVector = new VisualVector();
    vec2D = new Vec2D();
    num = 13;
    vectors = new PVector[num]; 
    col = #FAFFFA;
    
  }

  void makeVectors() {
    mag = 40;
    for (int i = 0; i < num; i++) {
      vectors[i] = vec2D.degDist(-90, mag);
      mag += 20;
    }
  }

  void update() {
    incr = 1.4;
    for (PVector v : vectors) {
      vec2D.rotateDeg(v, incr);
      incr -= 0.1;
    }
  }

  void display() {
    for (PVector v : vectors) {
      visualVector.display(v, col);
    }
  }
}




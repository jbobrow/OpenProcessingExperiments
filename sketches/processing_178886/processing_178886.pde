
float nFrames = 60;
float phase = 0.0;
ArrayList<AsymRing> aRings;

class AsymRing {
  class Slice {
    float a1, a2;
    
    Slice (float a1, float a2) {
      this.a1 = a1;
      this.a2 = a2;
    }
  }
  
  float startDistance;
  float endDistance;
  float offset = 0;
  float dWidth = PI / 2.0;
  private ArrayList<Slice> slices;
  float spacer = 0;
  int arcResolution = 6;
  
  AsymRing(float startDistance, float endDistance) {
    this.startDistance = startDistance;
    this.endDistance = endDistance;
    offset = random(TWO_PI);
    generateSlices();
  }

  private void generateSlices() {
    slices = new ArrayList<Slice>();
    float angleCount = 0;
    
    while (angleCount < TWO_PI) {
      float a1 = angleCount + offset;
      float a2 = a1 + dWidth;
      if (a2 > offset + TWO_PI - spacer) {
        a2 = offset + TWO_PI - spacer;  
      }
      Slice s = new Slice(a1, a2);
      slices.add(s);      
      angleCount += dWidth + spacer;
    }
  }
  
  void update() {
    generateSlices();
  }

  void draw() {
    float wd2t1414 = width / 2.0 * 1.414;
    float arcMinus1 = 1.0 / (arcResolution - 1);
    
    for (Slice s : slices) {
      float d = norm(endDistance, 0, wd2t1414);
      beginShape(TRIANGLE_STRIP);
      float depth = endDistance - startDistance;
      for (int i = 0; i < arcResolution; i++) {
        float interp = i * arcMinus1;        
        float angle = lerp(s.a1, s.a2, interp);
        float xa = sin(angle);
        float ya = cos(angle);
        vertex(xa * startDistance, ya * startDistance);
        vertex(xa * endDistance, ya * endDistance);
      }
      endShape();
    }
  }  
}

void setup() {
  size(500, 500, P2D);
  aRings = new ArrayList<AsymRing>();

  float d = 0.1;
  float offset = 0;
  while (d < (width / 2.0 * sqrt(2))) {
    AsymRing ar = new AsymRing(d, d * 1.05);
    ar.spacer = PI / 12.0;
    ar.dWidth = PI / 5.0 - ar.spacer;
    ar.offset = offset;
    offset += PI / 5.0;    
    ar.update();
    aRings.add(ar);
    d *= 1.05;
  }

  noStroke();
  fill(245, 0, 0);  
}

float inc = 1.0 / nFrames;
float fourthPI = TWO_PI / 8.0;
float inv45 = 1.0 / 45.0;

void draw() {
  background(255);
  translate(width / 2.0, height / 2.0);
  
  int counter = 0;
  float reversePhase = 1 - phase; 
  for (AsymRing ar : aRings) {
    float thisPhase = sin((reversePhase + (float(counter++) * inv45)) * TWO_PI);
    pushMatrix();
    rotate(thisPhase * fourthPI);
    ar.draw();
    popMatrix();
  }
  
  phase += inc;
  if (phase >= 1.0) {
    phase -= 1.0;   
  }
}

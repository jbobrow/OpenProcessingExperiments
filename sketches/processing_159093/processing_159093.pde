
float factor, inc; 
Rope seil;
float laenge; 

void setup() {
  size(400, 400); 
  background(255); 
  frameRate(200); 

  factor = 0.01; 
  inc = 0.02;

  laenge = 100;
  seil = new Rope(laenge, 0);
}

void draw() {
  fill(255, 25); 
  noStroke(); 
  rect(0, 0, width, height); 
  stroke(0); 
  strokeWeight(2); 
  noFill();  

  seil.updateRope(factor);
 
  float xStart = 0; int counter = 0; 
  for (float y = laenge; y < height; y += laenge) {
    xStart = (counter%2 == 0) ? laenge : 2*laenge;  
    for (float x = xStart; x < width; x += 2*laenge) {
      pushMatrix();
      translate(x, y);  
      for (int i = 0; i < 4; i++) {        
        seil.drawRope();  
        rotate(HALF_PI);
      }
      popMatrix() ;
    }
    counter++; 
  } 
  
  factor += inc; 
  if (factor < 0 || factor >= 1.1) {
    inc *= -1;
  }
  resetMatrix(); 
}

class Rope {
  float l;        // length 
  float r;        // radius
  float f;  
  float rAngle;   // rotation angle degrees
  float lRope, angle; 

  Rope(float _length, float _rotAngle) {    
    l = _length; 
    r = l / TWO_PI;  
    f = 1; 
    rAngle = _rotAngle;
  }

  void updateRope(float _factor) {
    f = constrain(_factor, 0.1, 1);
    
    lRope = l  - (1 - f) * 2*PI*r;
    angle = map(TWO_PI * f, 0, TWO_PI, -PI, PI);
  }

  void drawRope() {
    line(0, 0, 0, lRope); 
    arc(r, lRope, 2*r, 2*r, angle, PI);    
  }
}





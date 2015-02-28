
color palette[] = new color[] {
  color(105,210,231),
  color(167,219,216),
  color(224,228,204),
  color(243,134,48),
  color(250,105,0)};

Wheel wheels[];

void setup() {
  size(400,200);
  frameRate(30);
  smooth();
  strokeCap(SQUARE);
  ellipseMode(CENTER);
  
  wheels = new Wheel[3];
  int xInc = width / wheels.length, xOffset = xInc / 2; 
  for(int i=0; i<wheels.length; i++, xOffset+=xInc) {
      wheels[i] = new Wheel(xOffset,height/2,60,75,palette.length);
  }
}

void draw() {
  background(255);
  for(int i=0; i<wheels.length; i++)
    wheels[i].draw();
}

class Wheel {
  Segment segments[];
  int x, y;
  int innerRadius, outerRadius;
 
  public Wheel(int x, int y, int innerRadius, int outerRadius, int nSegments) {
    this.x = x;
    this.y = y;
    this.innerRadius = innerRadius * 2;
    this.outerRadius = outerRadius * 2;
    segments = new Segment[nSegments];
    
    float maxLength = TWO_PI;
    for(int i=0; i<nSegments; i++) {
      maxLength = random(maxLength / 2, maxLength);
      segments[i] = new Segment(random(TWO_PI),maxLength,random(-0.2,0.2),innerRadius,outerRadius,i%palette.length);
    }
  }
  
  void draw() {
    pushMatrix();
    translate(x,y);
    for(int i=0; i<segments.length; i++)
      segments[i].draw();
      
/*  // external stroke if drawing the wheels "manually"
    stroke(0);
    noFill();
    ellipse(0,0,innerRadius,innerRadius);
    ellipse(0,0,outerRadius,outerRadius); */
    popMatrix();  
  }
 
  class Segment {
    float phase, length, phaseInc;
    int innerRadius, outerRadius;
    int colorIndex;
    
    public Segment(float phase, float length, float phaseInc, int innerRadius, int outerRadius, int colorIndex) {
      this.phase = phase;
      this.length = length;
      this.phaseInc = phaseInc;
      this.innerRadius = innerRadius;
      this.outerRadius = outerRadius;
      this.colorIndex = colorIndex;
    }
    
    void draw() {
      phase += phaseInc;
      
/*    // I wish I had read the reference before wasting time on doing this manually
      pushMatrix();
      rotate(phase);
      
      stroke(palette[colorIndex]);
      float phaseInc = PI / 360;
      int nSteps = int(length / phaseInc);
      for(int i=0; i<nSteps; i++) {
        line(0,innerRadius,0,outerRadius);
        rotate(phaseInc);  
      }
      popMatrix(); */
      
      int mid = (innerRadius + outerRadius) / 2;
      stroke(palette[colorIndex]);
      strokeWeight(outerRadius - innerRadius);
      noFill();
      arc(0,0,mid,mid,phase, phase + length);
    }
  }  
}


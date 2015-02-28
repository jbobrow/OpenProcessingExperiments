
void setup() {
  size(600,600);
}

void draw() {
  background(255,255,255);
  strokeWeight(0.5); 
  stroke(0,0,0, 192);
  noFill();
  smooth();


  float R = width-10;
  float dPeriod = 0.00033;
  float amp = 30.0;
  float ySep = 5.75;

  for (int i=0; i<90; i++) {
    float period = 0.1;
    beginShape();
    for (float x=0; x<R; x++) {
      float t = TWO_PI*(x/R);
      float y = amp * (1.0-sin(t/period));
      vertex(x+5,y + ySep*i+15); 
      period += dPeriod;
    }
    endShape();
  }
}




int n = 10;
int d = 80;

void setup() {
    size(800, 800);
    noStroke();
    smooth();
}

void draw() {
    background(#E80C63);
    fill(0);
    
    float t = millis()/1000;
    
    int off = 0;
    
    for(int i = 0; i < n*1.5; i++) {
        float tCur = sin(t+off*HALF_PI);
    
        fill(((1+tCur)/2)*127);
        for(int j = 0; j < n; j++) {
            pushMatrix();
            translate(-200+j*3*d+(off*d*1.5), i*d*(7/8));
            polygon(0, 0, d*(3/4)+tCur*d*(1/4), 6); 
            popMatrix();
    
        }
        off = (off + 1)%4;
    }
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

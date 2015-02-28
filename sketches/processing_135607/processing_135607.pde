
float x, y, orgX, orgY, sz, angle;
float scal = 0.85; 
int num =12;

void setup() {
  size(500, 500);
  stroke(#704D50);
  fill(#FAE7C5);

  orgX = height/2;
  orgY = width/2;
  sz = width*.8;
}

void draw() {
  background(#704D50);
  for (int i=0; i<num; i++) {
    float diam = sz*pow(scal, i);
    float diff = sz/2-diam/2;
    float offSet = i*(TWO_PI/num);
    float s = map(sin(angle), -1, 1, .4, 1);
    float sw = map(sin(angle), -1, 1, 15, 25);
    strokeWeight(sw);
    x = orgX + sin(offSet+angle)*diff;
    y = orgY + cos(offSet+angle)*diff;
    ellipse(x, y, diam*s, diam*s);
  }
  angle += TWO_PI/180;

}


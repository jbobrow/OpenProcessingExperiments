
float x, y, orgX, orgY, sz, angle;
float scal = 0.85; 
int num =12;

void setup() {
  size(500, 500);
  stroke(#490A3D);
  fill(#BD1550);

  orgX = height/2;
  orgY = width/2;
  sz = width*.8;
}

void draw() {
  background(#490A3D);
  for (int i=0; i<num; i++) {
    float diam = sz*pow(scal, i);
    float offSet = sz/2-diam/2;
    float s = map(sin(angle), -1, 1, .4, 1.2);
    float sw = map(sin(angle), -1, 1, 15, 25);
    strokeWeight(sw);
    x = orgX + sin(angle)*offSet;
    y = orgY + cos(angle)*offSet;
    ellipse(x, y, diam*s, diam*s);
  }
  angle += TWO_PI/180;
}


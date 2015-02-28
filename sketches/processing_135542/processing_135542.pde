
float x, y, orgX, orgY, sz, angle;
float scal = 0.9; 
int num =14;

void setup() {
  size(500, 500);
  background(255);
  stroke(255);
  fill(0);
  strokeWeight(10);

  orgX = height/2;
  orgY = width/2;
  sz = width*.8;
}


void draw() {
  background(255);
  ellipse(orgX, orgY, sz, sz);
  for (int i=0; i<num; i++) {
    float diam = sz*pow(scal, i);
    float offSet = sz/2-diam/2;
    x = orgX + sin(angle)*offSet;
    y = orgY + cos(angle)*offSet;
    ellipse(x, y, diam, diam);
  }
  angle += TWO_PI/180;
}


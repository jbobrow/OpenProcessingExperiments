
int m = 0;
float scale = 100;
float offset = 0; 
int offsetRandom = 0;
float strokeweight = 0;
float speed = 0;
PVector[] superformular;


void setup() {
  size(500, 500);
  frameRate(30);
  noFill();
  stroke(0);
  strokeWeight(strokeweight);
  smooth();
  background(0, 0, 0);
  colorMode(HSB, 255);
  offsetRandom = (int)random(100);
}

void draw() {
  
  background(0, 0, 0);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(offset/900*360));
    
  m = int(random(8));
  if ( offset == 0) stroke( random(255), 150, 220);
  
  beginShape();
  float scaleCurrent = scale;
  scaleCurrent = scaleCurrent - 100 + offset;
  strokeWeight(strokeweight);
  if ( offset == 0 ) {
    createSuperformula(m);
  }
  curveVertex(superformular[superformular.length-1].x * scaleCurrent, superformular[superformular.length-1].y * scaleCurrent);
  for (int i = 0;i < superformular.length; i++) {
    curveVertex(superformular[i].x * scaleCurrent, superformular[i].y * scaleCurrent);
  }
  curveVertex(superformular[0].x * scaleCurrent, superformular[0].y * scaleCurrent);
  endShape();

  offset = offset+0.05+speed;
  speed = speed+0.10;
  strokeweight+=0.75;
  if ( offset >= 450+offsetRandom ) {
    offset = 0; 
    strokeweight = 0.75; 
    speed = 0;
    offsetRandom = (int)random(100);
  }

  popMatrix();
}


void createSuperformula(float m) {
  int steps = 360;
  float phi = TWO_PI / steps;
  superformular = new PVector[steps+1];
  for (int i = 0; i <= steps; i++) {
    superformular[i] = getPoint(m, phi*i);
  }
}

PVector getPoint(float m, float phi) {
  float radius;
  float a = 1.0; 
  float b = 1.0;
  float x = 0;
  float y = 0;
  float n1 = 5;
  float n2 = 5;
  float n3 = 5;
  
  radius = pow( pow(abs(cos(m * phi / 4.0) / a), n2) + pow(abs(sin(m * phi / 4.0) / b), n3), 1.0/n1);

  if (abs(radius) == 0) {
    x = 0;
    y = 0;
  }  
  else {
    radius = 1 / radius;
    x = radius * cos(phi);
    y = radius * sin(phi);
  }

  return new PVector(x, y);
}





float  xA, yA, xB, yB, x1,y1,x2,y2;

float sx, sy;

float angle;
float speed;
float radi;

float c,s;

void setup() {
  size(750,450);
  background(255);
  smooth();

  sx = random(5.0);
  sy=random(5.0);

  angle=0.0;
  speed=0.01;
  radi=300.0;
  xA = 20;
  yA = height/2;
  xB = width-20;
  yB = height/2;
}

void draw() {
  
  // dues corbes de lissajus serveixen de punts de control
  c = cos(angle);
  s = sin(angle/sy);
  // c=0;s=0;

  x1 = width/3+c*radi;
  y1 = height/2+s*radi;

  x2 = 2*width/3 + cos(angle/sx)*radi;
  y2 = height/2 + sin(angle)*radi;
//  y2 = y1 + tan(angle*sy)*radi;

  // pintem la corba de bezier
  noFill();
  stroke(0,10);
  bezier(xA,yA,x1,y1,x2,y2,xB,yB);
  
  // fem un pas
  angle+=speed;
}

void neteja() {
  background(255);
}

void keyPressed() {
  switch(key) {
    case('1'):
    neteja();
    sx=5.0;
    sy=random(1);
    break;
    case('2'):
    neteja();
    sx=random(1);
    sy=2.0;
    break;
    default:
    neteja();
      sx = random(5.0);
  sy=random(5.0);

  }
}

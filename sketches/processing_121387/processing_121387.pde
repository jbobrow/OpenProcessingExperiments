
float _angnoise, _radiusnoise;
float _xnoise, _ynoise;
float _angle = -PI/2;
float _radius;
float _strokeCol = random(220,254);
int _strokeChange = -1;
void setup() {
  size(800, 800);
  smooth();
  frameRate(800);
  background(0);
  noFill();
  _angnoise = random(10);
  _radiusnoise = random(10);
  _xnoise = random(10);
  _ynoise = random(10);
}
void draw() {
  _radiusnoise += 0.005;
  _radius = (noise(_radiusnoise) * 550) +1;
  _angnoise += 0.005;
  _angle += (noise(_angnoise) * 6) - 3;
  if (_angle > 360) { _angle -= 360; }
  if (_angle < 0) { _angle += 360; }
  _xnoise += 0.01;
  _ynoise += 0.01;
  float centerx = width/2 /*+ (noise(_xnoise) * 100) - 50*/;
  float centery = height/2 /*+ (noise(_ynoise) * 100) - 50*/;
float rad = radians(_angle);
float x1 = centerx + (_radius * cos(rad)) ;
float y1 = centery + (_radius * sin(rad)) ; 
float opprad = rad + PI;
     float x2 = centerx + (_radius * cos(opprad));
     float y2 = centery + (_radius * sin(opprad));
     _strokeCol += _strokeChange;
     if (_strokeCol > 254) { _strokeChange = -1; }
     if (_strokeCol < 0) { _strokeChange = 1; }
     stroke(_strokeCol,-1*_strokeCol,140, 20);
     strokeWeight(1);
     line( centerx, centery, x2, y2);
}




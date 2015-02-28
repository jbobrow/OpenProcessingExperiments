
float _a, _b, _centx, _centy, _x, _y;
int _num = 12;
color _col;
float _noiseoff;
int _angle;

void setup()
{
  size(800, 800);
  smooth(); 
  frameRate(9);
  background(0);
  
  _centx = (height/2);
  _centy = (width/2);
  _noiseoff = random(1);
  
  _col = color(random(255), random(255), random(255));
  _angle = 1;
  
  restart();
}

void restart() {
   _noiseoff = _noiseoff + .001;
   _a = 3.5;
   _b = _a + (noise(_noiseoff) * 1) - 0.5;
   
   _angle++;
   if (_angle == 360) { _angle = 0; }
}


void clearBackground() {
  noStroke();
  fill(0, 5);
  
}

void draw() {
  clearBackground();
  
  translate(_centx, _centy);
  noFill();
  stroke(_col, 50);
  strokeWeight(0.05);
  beginShape();
  for (int i=0;i < 30; i++) {    
    _x = sin(_a * i + radians(_angle) + PI / 2) * _centx;  
    _y = sin(_b * i + radians(_angle)) * _centy;  
    curveVertex(_x, _y);
  }
  endShape();   
  
  restart();
}

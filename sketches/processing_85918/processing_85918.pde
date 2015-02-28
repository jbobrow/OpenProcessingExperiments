
float _angnoise, _radiusnoise;
float _xnoise, _ynoise;
float _angle = -PI/2;
float _radius;
float _strokeCol = 254;
int _strokeChange = -2;
float centery;
float centerx;
float xstep = 10;
float ystep = 10;
float lastx = 20;
float lasty = 50;
float y3 = 50;


void setup(){
  
  size(750,450);
  smooth();
  frameRate(30);
  background(0);
  noFill();
  
  _angnoise = random(10);
  _radiusnoise = random(10);
  _xnoise = random(10);
  _ynoise = random(10);
  
 
  

}

void draw() {
  _radiusnoise += 0.005;
  _radius = (noise(_radiusnoise)*550) +1;
  
  _angnoise += 0.005;
  _angle += (noise(_angnoise)*6) - 3;
  if (_angle > 360) { _angle -= 360;}
  if (_angle < 0){ _angle += 360;}
  
  _xnoise += 0.01;
  _ynoise += 0.01;
  centerx = width/2 + (noise(_xnoise) * 100) - 50;
  centery = height/2 + (noise(_ynoise) * 100) - 50;
  
  float rad = radians(_angle);
  float x1 = centerx + (_radius * cos(rad));
  float y1 = centery + (_radius * sin(rad));
  
  float opprad = rad + PI;
  float x2 = centerx + (_radius * cos(opprad));
  float y2 = centery + (_radius * sin(opprad));
  
  _strokeCol += _strokeChange;
  if (_strokeCol > 254) { _strokeCol = -1; }
  if (_strokeCol < 0) { _strokeCol = 1; }
  stroke(0,150,100,60);
  strokeWeight(1);
  line(x1,y1,x2,y2);
  

  
}





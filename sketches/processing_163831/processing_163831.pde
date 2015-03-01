
float _angnoise, _radiusnoise;
float _xnoise, _ynoise;
float _radius;
float _angle = -PI/2;
float _hue = 200;
float _saturation = 100;
float _brightness = 100;
int _strokeChange = -1;
float _s = random(5);

void setup() {
  size(700, 400);
  colorMode(HSB, 360, 100, 100);
  smooth();
  frameRate(60);
  background(0, 0, 100);
  noFill();
  
  _angnoise = random(10);
  _radiusnoise = random(10);
  _xnoise = random(50);
  _ynoise = random(50);
}

void draw() {
  drawShape(_s);
  if (_s < 15) { _s++; }
}

void drawShape(float sz) {
  float s = sz;
  
  _radiusnoise += 0.05;
  _radius = (noise(_radiusnoise) * 150) + 1;
  
  _angnoise += 0.005;
  _angle += (noise(_angnoise) * 6) - 3;
  if (_angle > 360) { _angle -= 360; }
  if (_angle < 0) { _angle += 360; }
  
  _xnoise += 0.01;
  _ynoise += 0.01;
  float centerX = width/2;
  float centerY = height/2;
  
  float rad = radians(_angle);
  float x1 = centerX + (_radius * cos(rad));
  float y1 = centerY + (_radius * sin(rad));
  
  float rad2 = rad + PI;
  float x2 = centerX + (_radius * cos(rad2));
  float y2 = centerY + (_radius * sin(rad2));
  
  float rad3 = rad + PI/2;
  float x3 = centerX + (_radius * cos(rad3));
  float y3 = centerY + (_radius * sin(rad3));
  
  float rad4 = rad + PI/-2;
  float x4 = centerX + (_radius * cos(rad4));
  float y4 = centerY + (_radius * sin(rad4));
  
  _saturation += _strokeChange;
  if (_saturation > 100) { _strokeChange = -1; }
  if (_saturation < 0) { _strokeChange = 1; }
  stroke(_hue, _saturation, _brightness);
  strokeWeight(1);
  ellipse(x1, y1, s, s);
  ellipse(x1, y2, s, s);
  ellipse(x1, y3, s, s);
  ellipse(x1, y4, s, s);
  ellipse(x2, y1, s, s);
  ellipse(x2, y2, s, s);
  ellipse(x2, y3, s, s);
  ellipse(x2, y4, s, s);
  ellipse(x3, y1, s, s);
  ellipse(x3, y2, s, s);
  ellipse(x3, y3, s, s);
  ellipse(x3, y4, s, s);
  ellipse(x4, y1, s, s);
  ellipse(x4, y2, s, s);
  ellipse(x4, y3, s, s);
  ellipse(x4, y4, s, s);
}

void keyPressed() {
  if(keyCode == ENTER) {
    saveFrame("screen-####.jpg");
  }
}




float _angnoise, _radiusnoise;
float _xnoise, _ynoise;
float _angle = -PI/2;
float _radius;
float _intRadius = 600;
float _strokeRotateSpeed = 6.0;
int _strokeWeight = 1;
color _strokeColor;
float _strokeColorAlpha = 100;
int _strokeColorAlphaChange = -1;
float _motionDepth = 250;
color _bgColor;
float _colorH = 350;
float _bgColorS = 100;
float _bgColorB = 20;
int _bgColorChange = 1;
float _colorTransSpeed = 0.45;
float _bgFadeAlpha = 4;

void setup() {
  size(640, 640);
  colorMode(HSB,360,100,100,255);
  smooth();
  frameRate(30);
  
  _bgColor = color(_colorH,_bgColorS,_bgColorB,255);
  background(_bgColor);

  _angnoise = random(10);
  _radiusnoise = random(10);
  _xnoise = random(10);
  _ynoise = random(10);
}

void draw() {
  _radiusnoise += 0.005;
  _radius = _intRadius*noise(_radiusnoise)+1;

  _angnoise +=0.005;
  _angle += _strokeRotateSpeed*(noise(_angnoise)-0.5);
  if (_angle>360) {
    _angle -= 360;
  }
  if (_angle < 0) {
    _angle += 360;
  }

  _xnoise += 0.01;
  _ynoise += 0.01;
  float centerx = width/2 + (_motionDepth * (noise(_xnoise)-0.5));
  float centery = width/2 + (_motionDepth * (noise(_ynoise)-0.5));
  float rad = radians(_angle);
  float x1 = centerx + (_radius*cos(rad));
  float y1 = centery + (_radius*sin(rad));
  float x2 = centerx + (_radius*cos(rad+PI));
  float y2 = centery + (_radius*sin(rad+PI));

  //line stroke
  _strokeColor = color(_colorH,100,100);
  _strokeColorAlpha += _strokeColorAlphaChange;
  if (_strokeColorAlpha>254) {
    _strokeColorAlphaChange = -1;
  }
  if (_strokeColorAlpha<50) {
    _strokeColorAlphaChange = 1;
  }
  lineDraw(_strokeWeight,x1,y1,x2,y2);

 //key color change 
  if (_colorH>359) {
    _bgColorChange = -1;
  }
  if (_colorH<1) {
    _bgColorChange = 1;
  }
  _colorH += _bgColorChange*_colorTransSpeed;

  //backgroud color change 
  _bgColor = color(_colorH,_bgColorS,_bgColorB,255);
  refreshScr();
}

void lineDraw(int weight,float x1f,float y1f,float x2f,float y2f){
  stroke(_strokeColor,_strokeColorAlpha*0.3);
  strokeWeight(weight+3);
  line(x1f, y1f, x2f, y2f);
  stroke(_strokeColor,_strokeColorAlpha*0.6);
  strokeWeight(weight+1);
  line(x1f, y1f, x2f, y2f);
  stroke(_strokeColor,_strokeColorAlpha);
  strokeWeight(weight);
  line(x1f, y1f, x2f, y2f);
}

void refreshScr(){
  fill(_bgColor,_bgFadeAlpha);
  noStroke();
  rect(0,0,width,height);
}  




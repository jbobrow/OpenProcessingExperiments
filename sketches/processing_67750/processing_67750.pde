
// first ball
float x = 20;
float y = 50;
float mvX = 0; 
float mvY = 0;
float speedX = 1.4;
float speedY = 0.8;
float w = 23;
float greyValue = 255;
// second ball
float _x = 130;
float _y = 30;
float _mvX = 0;
float _mvY = 0;
float _speedX = 0.7;
float _speedY = 1.5;
float _w = 17;
float _greyValue = 255;

void setup() {
  size(300, 300);
  smooth();
  noStroke();
}

void draw() {
  background(0);
  chooseColor();
  bouncingBalls(x, y, _x, _y);
}

// a complex method
void bouncingBalls(float a, float b, float _a, float _b) {
  // I put argument 'a' into a new variable
  // called posX
  float posX  = a;
  float posY  = b;
  // seconde ball
  float _posX = _a;
  float _posY = _b;

  // change the position by adding a variable starting from 0
  // first ball
  posX   += mvX;
  posY   += mvY;
  // second ball
  _posX  += _mvX;
  _posY  += _mvY;

  // add a speed value to this variable
  // first ball
  mvX    += speedX;
  _mvX   += _speedX;
  // second ball

  mvY    += speedY;
  _mvY   += _speedY;

  // first ball
  if (posX > width - w/2)  speedX    = -1.4;
  if (posY > height - w/2) speedY    = -0.8;
  if (posX < 0 + w/2)      speedX    = 1.4;
  if (posY < 0 + w/2)      speedY    = 0.8;

  // second ball
  if (_posX > width - _w/2)   _speedX   = -0.7;
  if (_posY > height - _w/2)  _speedY   = -1.5;
  if (_posX < 0 + _w/2)       _speedX   = 0.7;
  if (_posY < 0 + _w/2)       _speedY   = 1.5;

  fill(greyValue);
  ellipse(posX, posY, w, w);
  fill(_greyValue);
  ellipse(_posX, _posX, _w, _w);
}

void chooseColor() {
  greyValue  = map(mouseX, 0, width, 100, 255);
  _greyValue = map(mouseY, 0, height, 100, 255);
}



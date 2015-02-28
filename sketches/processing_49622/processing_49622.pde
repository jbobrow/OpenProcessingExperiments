
float _A = 3.0;
float _B = 2.0;
int _xsin1 = 0;
int _xsin2 = 0;
int _xsin3 = 0;
int _ysin1 = 0;
int _ysin2 = 0;
int _ysin3 = 0;
int _pointcount = 0;
float _x = 0;
float _y = 0;

//================================= init

void setup() {
  size(900, 450);
  frameRate(60);
  smooth();
  restart();
}

void restart() {
  clearBackground();
  stroke(random(155), random(155),255);
  _A = int(random(8)) + 1;
  _B = int(random(8)) + 1;
  _xsin1 = int(random(5));
  _xsin2 = int(random(5));
  _xsin3 = int(random(5));
  _ysin1 = int(random(5));
  _ysin2 = int(random(5));
  _ysin3 = int(random(5));
  //println(_A + " : " + _B);
  //println(_xsin1 + " : " + _xsin2 + " : " + _xsin3);
  //println(_ysin1 + " : " + _ysin2 + " : " + _ysin3);
  _pointcount = 0;
}

void clearBackground() {
  background(200);
}


//================================= frame loop


void draw() {
  for (int i = 0; i < 400; i++) {
    nextPoint();
    line(_x, _y, _x, _y);
    _pointcount++;
  }
  if (_pointcount > 300000) {
    restart();
  }
}

void nextPoint() {
  float sinAx = sin(_A * _x);
  float sinAy = sin(_A * _y);
  float sinBx = sin(_B * _x);
  float sinBy = sin(_B * _y);
  
  float newx = 0;
  float newy = 0; 
  
  if (_xsin1 == 1) {
    newx += sinAx;
  } else if (_xsin1 == 2) {
    newx += sinAy;
  } else if (_xsin1 == 3) {
    newx += sinBx;
  } else if (_xsin1 == 4) {
    newx += sinBy;
  }
  if (_ysin1 == 1) {
    newy += sinAx;
  } else if (_ysin1 == 2) {
    newy += sinAy;
  } else if (_ysin1 == 3) {
    newy += sinBx;
  } else if (_ysin1 == 4) {
    newy += sinBy;
  }
  
  if (_xsin2 == 1) {
    newx += (sinAx * sinAx);
  } else if (_xsin2 == 2) {
    newx += (sinAy * sinAy);
  } else if (_xsin2 == 3) {
    newx += (sinBx * sinBx);
  } else if (_xsin2 == 4) {
    newx += (sinBy * sinBy);
  }
  if (_ysin2 == 1) {
    newy += (sinAx * sinAx);
  } else if (_ysin2 == 2) {
    newy += (sinAy * sinAy);
  } else if (_ysin2 == 3) {
    newy += (sinBx * sinBx);
  } else if (_ysin2 == 4) {
    newy += (sinBy * sinBy);
  }
  
  if (_xsin3 == 1) {
    newx += (sinAx * sinAx * sinAx);
  } else if (_xsin3 == 2) {
    newx += (sinAy * sinAy * sinAy);
  } else if (_xsin3 == 3) {
    newx += (sinBx * sinBx * sinBx);
  } else if (_xsin3 == 4) {
    newx += (sinBy * sinBy * sinBy);
  }
  if (_ysin3 == 1) {
    newy += (sinAx * sinAx * sinAx);
  } else if (_ysin3 == 2) {
    newy += (sinAy * sinAy * sinAy);
  } else if (_ysin3 == 3) {
    newy += (sinBx * sinBx * sinBx);
  } else if (_ysin3 == 4) {
    newy += (sinBy * sinBy * sinBy);
  }
  
  _x = 285 + (newx * 130);
  _y = 200 + (newy * 85);
}


//================================= interaction

void mousePressed() { 
  restart();
}




int _num = 10;    
float _angnoise, _radiusnoise, _widnoise, _heinoise;
float _angle = -PI/2;
float _radius = 100;
float _strokeCol = 254;

//================================= init

void setup() {
  size(900, 450);
  smooth(); 
  frameRate(30);
  
  clearBackground();
  
  _angnoise = random(10);
  _radiusnoise = random(10);
  _widnoise = random(10);
  _heinoise = random(10);
}

void clearBackground() {
  background(255);
}

//================================= frame loop

void draw() {
  
  _radiusnoise += 0.005;
  _radius = (noise(_radiusnoise) * 250) +5;
  
  _angnoise += 0.005;
  _angle += (noise(_angnoise) * 6) - 3;
  if (_angle > 360) { _angle -= 360; }
  if (_angle < 0) { _angle += 360; }
  
  float centreX = width/2;
  float centreY = height/2;
  
  //tube size
  _widnoise += 0.05;
  _heinoise += 0.05;
  float wid = (noise(_widnoise) * 25) +10;
  float hei = (noise(_heinoise) * 25) +10;
  
  float rad = radians(_angle);
  float x1 = centreX + (_radius * cos(rad));
  float y1 = centreY + (_radius * sin(rad));
  
  noFill();
  if (_strokeCol > 0) { _strokeCol -=2; } // fade in
  stroke(_strokeCol, 50);
  ellipse(x1, y1, 15*wid, 5*hei);
}


//================================= interaction

void mousePressed() { 
  clearBackground();
}


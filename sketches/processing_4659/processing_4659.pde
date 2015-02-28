
/**
  
  Drag and throw the circle around the scene.
  
*/

ArrayList _positions = new ArrayList();

float _dragTime;
float _dragThreshold;
float _timerSpeed = 5;

boolean _isPressedState = false;
boolean _isReleasedState = false;

float _friction = 0.05;	
float _averageVelX, _averageVelY;
float posX, posY;

int _directionX = 1;
int _directionY = 1;

int _timer = 0;
int _endPointCalcTimer;

void setup()
{
  size(600, 600);
  frameRate(50);
  noStroke();
  smooth();
  rectMode(CENTER);
  
  posX = width/2;
  posY = height/2;
}


void draw()
{
  fill(0, 12);
  rect(width/2, height/2, width, height);
  fill(255);
  
  if (_isPressedState)
  {
    PVector p = new PVector(mouseX, mouseY);
    _positions.add(p);
    
    _dragTime += _timerSpeed;
  }
  
  if (_isReleasedState)
  {
    if (posX > width || posX < 0) _directionX *= -1;
    if (posY > width || posY < 0) _directionY *= -1;
    
    _averageVelX = (_averageVelX - _averageVelX * _friction);
    _averageVelY = (_averageVelY - _averageVelY * _friction);
    				
    posX += frameRate * _averageVelX * _directionX;
    posY += frameRate * _averageVelY * _directionY;
    
    if(abs(_averageVelX) < 0.002 || abs(_averageVelY) < 0.002)
    {
      _endPointCalcTimer = 0;
      _isReleasedState = false;
    }
  }
  
  fill(255);
  float radius = max(_averageVelX, _averageVelY) * 100 + 20;
  ellipse(posX, posY, radius, radius);
}

void mousePressed()
{
  _isPressedState = true;
  _positions = new ArrayList();
  
  _directionX = 1;
  _directionY = 1;
  
  _dragTime = 0.0;
  _timer = 0;
}

void mouseReleased()
{
  _isPressedState = false;
  _isReleasedState = true;
  
  _timer = 0;
  
  _averageVelX = 0.0;
  _averageVelY = 0.0;
  
  for (int i=0; i<5; i++)
  {
    PVector p1 = (PVector)(_positions.get(_positions.size() - 1 - i));
    PVector p2 = (PVector)(_positions.get(_positions.size() - 2 - i));
    
    _averageVelX += (p1.x - p2.x) / _dragTime;
    _averageVelY += (p1.y - p2.y) / _dragTime;
  }
  
  _endPointCalcTimer = 0;
}




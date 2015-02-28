
// "Schrodinger's Circle"
// Run MyCircle first!
import processing.opengl.*;

int frameCounter = 0;
int currentSample = 0;
int time = 0;
int currentClick = 0;
int currentBounce = 0;
int currentVerts = 0;
MouseData mouseData;
ArrayList starList;
PVector[] verts = new PVector[4];
Circle myCircle;
float r, g, b;

void setup()
{
  size(600, 600, OPENGL);
  frameRate(60);
  smooth();
  background(0);
  
  r = random(255);
  g = random(255);
  b = random(255);
  
  starList = new ArrayList();
  
  mouseData = new MouseData();
  mouseData.LoadFromFile();
  
  myCircle = new Circle(width / 2, height / 2, 40);
  
  // Create stars
  for(int i = 0; i < 500; i++)
  {
    Star s = new Star(random(width), random(height), random(5));
    starList.add(s);
  }
}

void draw()
{
  time++;
  frameCounter++;
  if(frameCounter > mouseData._sampleRate && currentSample < mouseData._sampleCount)
  {
    frameCounter = 0;
    currentSample++;
  }
  
  myCircle.Update();
  
  if(currentClick < mouseData._clickX.length && time == mouseData._clickTime[currentClick])
  {
    currentClick++;
  }
  
  if(currentBounce < mouseData._bounceX.length && time == mouseData._bounceTime[currentBounce])
  {
    AddVertex(new PVector(mouseData._bounceX[currentBounce], mouseData._bounceY[currentBounce]));
    currentBounce++;
    
    r = random(255);
    g = random(255);
    b = random(255);
  }
  
  //background(255);
  noStroke();
  fill(255, 255, 230, 2);
  quad(0, 0, 0, height, width, height, width, 0);
  
  // Draw stars
  strokeWeight(2);
  for(int i = 0; i < starList.size(); i++)
  {
    Star s = (Star)starList.get(i);
    stroke(0, s._a);
    point(s._x, s._y);
  }
  
  // Draw bounce quad
  stroke(0, g, b, 50);
  strokeWeight(1);
  fill(0, g, b, 3);
  if(currentVerts > 3)
  {
    quad(verts[0].x, verts[0].y, verts[1].x, verts[1].y, verts[2].x, verts[2].y, verts[3].x, verts[3].y);
  }
  else if(currentVerts == 1)
  {
    point(verts[3].x, verts[3].y);
  }
  else if(currentVerts == 2)
  {
    line(verts[3].x, verts[3].y, verts[2].x, verts[2].y);
  }
  else if(currentVerts == 3)
  {
    triangle(verts[1].x, verts[1].y, verts[2].x, verts[2].y, verts[3].x, verts[3].y);
  }
  
  myCircle.Render();
  
  // Draw mouse coord lines
  stroke(0, 3);
  strokeWeight(2);
  noFill();
  
  beginShape();
  for(int i = 0; i < currentSample; i += 20)
  {
    curveVertex(mouseData._x[i], mouseData._y[i]);
  }
  endShape();
  /*if(currentSample > 0 && currentSample < mouseData._sampleCount)
  {
    point(mouseData._x[currentSample], mouseData._y[currentSample]);
    line(mouseData._x[currentSample], mouseData._y[currentSample], mouseData._x[currentSample - 1], mouseData._y[currentSample - 1]);
  }*/
  
  // Draw click squares
  noStroke();
  fill(0, 2);
  for(int i = 0; i < currentClick; i++)
  {
    quad(mouseData._clickX[i] - 4, mouseData._clickY[i] - 4, mouseData._clickX[i] - 4, mouseData._clickY[i] + 4,
         mouseData._clickX[i] + 4, mouseData._clickY[i] + 4, mouseData._clickX[i] + 4, mouseData._clickY[i] - 4);
  }
}

void AddVertex(PVector v)
{
  verts[0] = verts[1];
  verts[1] = verts[2];
  verts[2] = verts[3];
  verts[3] = v;
  currentVerts++;
}

class Star {
  float _x, _y, _a;
  
  Star(float x, float y, float a)
  {
    _x = x;
    _y = y;
    _a = a;
  }
}

class MouseData {
  // Mouse coord data
  int _sampleRate = 0;
  int _sampleCount = 0;
  int[] _x = new int[0];
  int[] _y = new int[0];
  
  // Mouse click data
  int[] _clickX = new int[0];
  int[] _clickY = new int[0];
  int[] _clickTime = new int[0];
  
  // Bounce data
  int[] _bounceX = new int[0];
  int[] _bounceY = new int[0];
  int[] _bounceTime = new int[0];
  
  MouseData()
  {
  }
  
  void LoadFromFile()
  {
    // Mouse coord data
    String[] lines = loadStrings("../MyCircle/mouseData.txt");
    
    _sampleRate = int(lines[0]);
    _sampleCount = int(lines[1]);
    
    for(int i = 0; i < _sampleCount; i++)
    {
      String[] coords = split(lines[i + 2], ",");
      _x = append(_x, int(coords[0]));
      _y = append(_y, int(coords[1]));
    }
    
    // Mouse click data
    String[] clickLines = loadStrings("../MyCircle/clickData.txt");
    
    for(int i = 0; i < clickLines.length; i++)
    {
      String[] clickData = split(clickLines[i], ",");
      _clickX = append(_clickX, int(clickData[0]));
      _clickY = append(_clickY, int(clickData[1]));
      _clickTime = append(_clickTime, int(clickData[2]));
    }
    
    // Bounce data
    String[] bounceLines = loadStrings("../MyCircle/bounceData.txt");
    
    for(int i = 0; i < bounceLines.length; i++)
    {
      String[] bounceData = split(bounceLines[i], ",");
      _bounceX = append(_bounceX, int(bounceData[0]));
      _bounceY = append(_bounceY, int(bounceData[1]));
      _bounceTime = append(_bounceTime, int(bounceData[2]));
    }
  }
}

class Circle {
  PVector _pos, _v;
  float _size, _halfSize;
  float _gravity, _restitution, _friction;
  boolean _onGround;
  float _sensorSize;
  
  Circle(float posx, float posy, float newSize)
  {
    _pos = new PVector(posx, posy);
    _v = new PVector(0, 0);
    _size = newSize;
    _halfSize = _size * 0.5;
    _gravity = 0.3;
    _restitution = 0.7;
    _friction = 0.99;
    _onGround = false;
    _sensorSize = 400;
  }
  
  void Update()
  {
    Input();
    
    _pos.y += _gravity;
    _pos.add(_v);
    
    Collide();
  }
  
  void Input()
  {
    if(currentSample > 0 && currentSample < mouseData._sampleCount)
    {
      if(dist(mouseData._x[currentSample], mouseData._y[currentSample], _pos.x, _pos.y) <= _sensorSize)
      {
        PVector dir = new PVector();
        dir.x = mouseData._x[currentSample] - _pos.x;
        dir.y = mouseData._y[currentSample] - _pos.y;
        dir.normalize();
        
        _v.x += dir.x * 0.5;
        _v.y += dir.y * 0.5;
      }
    }
  }
  
  void Collide()
  {
    boolean hit = false;
    
    // Bottom
    if(_pos.y > height - _halfSize)
    {
      _pos.y = height - _halfSize;
      _v.y = -_v.y * _restitution;
      _v.x *= _friction;
      hit = true;
    }
    // Top
    if(_pos.y < _halfSize)
    {
      _pos.y = _halfSize;
      _v.y = -_v.y * _restitution;
      _v.x *= _friction;
      hit = true;
    }
    
    // Left
    if(_pos.x < _halfSize)
    {
      _pos.x = _halfSize;
      _v.x = -_v.x * _restitution;
      _v.y *= _friction;
      hit = true;
    }
    // Right
    if(_pos.x > width - _halfSize)
    {
      _pos.x = width - _halfSize;
      _v.x = -_v.x * _restitution;
      _v.y *= _friction;
      hit = true;
    }
    
    /*if(hit)
    {
    }*/
  }
  
  void Render()
  {
    stroke(0, 100);
    noFill();
    strokeWeight(1.0);
    //ellipse(_pos.x, _pos.y, _size, _size);
    quad(_pos.x - _halfSize - currentBounce, _pos.y - _halfSize - currentBounce, _pos.x - _halfSize - currentBounce, _pos.y + _halfSize + currentBounce,
         _pos.x + _halfSize + currentBounce, _pos.y + _halfSize + currentBounce, _pos.x + _halfSize + currentBounce, _pos.y - _halfSize - currentBounce);
  }
}


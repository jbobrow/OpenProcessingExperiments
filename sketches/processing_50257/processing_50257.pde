
// "This Is Your Mess, Clean It Up!"
// Run MyCircle first!
import processing.opengl.*;

int frameCounter = 0;
int currentSample = 0;
int time = 0;
int currentClick = 0;
int currentBounce = 0;
int currentVerts = 0;
MouseData mouseData;
ArrayList vertList;
float r, g, b;
int firstIndex = 0;
int samplesShown = 200;

void setup()
{
  size(600, 600, OPENGL);
  frameRate(15);
  smooth();
  background(127, 200, 127);
  
  r = random(255);
  g = random(255);
  b = random(255);
  
  vertList = new ArrayList();
  
  mouseData = new MouseData();
  mouseData.LoadFromFile();
}

void draw()
{
  time += 3;
  frameCounter += 3;
  if(frameCounter > mouseData._sampleRate && currentSample < mouseData._sampleCount)
  {
    frameCounter = 0;
    currentSample++;
    if(currentSample > samplesShown)
    {
      firstIndex = currentSample - samplesShown;
    }
  }
  
  if(currentClick < mouseData._clickX.length && time >= mouseData._clickTime[currentClick])
  {
    currentClick++;
  }
  
  if(currentBounce < mouseData._bounceX.length && time >= mouseData._bounceTime[currentBounce])
  {
    AddVertex(new PVector(mouseData._bounceX[currentBounce], mouseData._bounceY[currentBounce]));
    currentBounce++;
    
    r = random(255);
    g = random(255);
    b = random(255);
  }
  
  //background(255);
  noStroke();
  fill(127 + random(-4, 4), 200 + random(-4, 4), 127 + random(-4, 4), 150);
  quad(0, 0, 0, height, width, height, width, 0);
  
  // Draw click lines
  stroke(255, 70);
  strokeWeight(0.5);
  noFill();
  beginShape();
  for(int i = 0; i < currentClick; i++)
  {
    vertex(mouseData._clickX[i] + random(-7, 7), mouseData._clickY[i] + random(-7, 7));
  }
  endShape();
  
  // Draw mouse coord lines
  stroke(0, 20);
  strokeWeight(2);
  fill(r, g, b, 3);
  
  beginShape();
  for(int i = firstIndex; i < currentSample; i += 1)
  {
    vertex(mouseData._x[i] + random(-15, 15), mouseData._y[i] + random(-15, 15));
  }
  endShape();
  
  PVector mouseDir = new PVector(mouseX - pmouseX, mouseY - pmouseY);
  float amount = mouseDir.mag();
  PVector perpDir = new PVector(-mouseDir.x, mouseDir.y);
  
  noStroke();
  fill(77, 150, 77, 20);
  quad(mouseX + mouseDir.x + 3, mouseY + mouseDir.y + 3, mouseX + perpDir.x + 3, mouseY + 3, pmouseX + 3, pmouseY + 3, mouseX - perpDir.x + 3, mouseY + 3);
  fill(127, 200, 127, 255);
  quad(mouseX + mouseDir.x, mouseY + mouseDir.y, mouseX + perpDir.x, mouseY, pmouseX, pmouseY, mouseX - perpDir.x, mouseY);
}

void AddVertex(PVector v)
{
  vertList.add(v);
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


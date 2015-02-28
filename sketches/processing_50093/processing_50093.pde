
// "The Circle Experience"
// Run this first!
import processing.opengl.*;

Circle myCircle;
MouseData mouseData;
int time = 0;
int frameCounter = 0;
int rTimer = 0;

void setup()
{
  size(600, 600, OPENGL);
  frameRate(60);
  smooth();
  background(200);
  
  myCircle = new Circle(width / 2, height / 2, 40);
  mouseData = new MouseData(1);
}

void draw()
{
  if(!mouseData._recording)
  {
    if(mouseX != 0 || mouseY != 0 || mousePressed)
    {
      mouseData.StartRecording();
      rTimer = 100;
    }
  }
  else
  {
    frameCounter++;
    time++;
    if(frameCounter > mouseData._sampleRate)
    {
      mouseData.AddCoord(mouseX, mouseY);
      frameCounter = 0;
    }
    
    rTimer++;
    
    if(rTimer >= 100)
    {
      noStroke();
      fill(255, 0, 0, 100);
      ellipse(width - 30, 30, 35, 35);
      text("REC", width - 42, 63);
      rTimer = 0;
    }
  }
  
  // Update
  myCircle.Update();
  
  // Render
  //background(255);
  noStroke();
  fill(255, 5);
  quad(0, 0, 0, height, width, height, width, 0);
  
  myCircle.Render();
  
  strokeWeight(random(5));
  stroke(0, 10);
  noFill();
  float size1 = random(10, 300);
  float size2 = random(10, 300);
  float size3 = random(10, 300);
  ellipse(random(width), random(height), size1, size1);
  ellipse(random(width), random(height), size2, size2);
  ellipse(random(width), random(height), size3, size3);
}

void mousePressed()
{
  myCircle.CreateRipple(new PVector(mouseX, mouseY));
  mouseData.AddClick(mouseX, mouseY, time);
}

void dispose()
{
  mouseData.WriteToFile();
}

class Circle {
  ArrayList _rippleList;
  PVector _pos, _v;
  float _size, _halfSize;
  float _gravity, _restitution, _friction;
  boolean _onGround;
  float _sensorSize;
  
  Circle(float posx, float posy, float newSize)
  {
    _rippleList = new ArrayList();
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
    
    //_pos.y += _gravity;
    _pos.add(_v);
    
    Collide();
  }
  
  void Input()
  {
    if(dist(mouseX, mouseY, _pos.x, _pos.y) <= _sensorSize)
    {
      PVector dir = new PVector();
      dir.x = mouseX - _pos.x;
      dir.y = mouseY - _pos.y;
      dir.normalize();
      
      _v.x += dir.x * 0.5;
      _v.y += dir.y * 0.5;
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
    
    if(hit)
    {
      CreateRipple();
      mouseData.AddBounce(int(_pos.x), int(_pos.y), time);
    }
  }
  
  void CreateRipple()
  {
    Ripple newRipple = new Ripple(500.0, _pos.x, _pos.y, _size, 1200);
    _rippleList.add(newRipple);
  }
  
  void CreateRipple(PVector pos)
  {
    Ripple newRipple = new Ripple(20.0, pos.x, pos.y, _size, 300);
    _rippleList.add(newRipple);
  }
  
  void Render()
  {
    stroke(0);
    noFill();
    strokeWeight(1.0);
    ellipse(_pos.x, _pos.y, _size, _size);
    
    // Render ripples
    for(int i = 0; i < _rippleList.size(); i++)
    {
      Ripple r = (Ripple)_rippleList.get(i);
      
      if(r.Deleted())
      {
        _rippleList.remove(i);
      }
      else
      {
        r.Update();
        r.Render();
      }
    }
  }
}

class Ripple {
  float _timer, _maxTime, t;
  PVector _pos;
  float _size, _minSize, _maxSize;
  float _strokeWidth, _minStrokeWidth, _maxStrokeWidth;
  float _alpha;
  boolean _delete = false;
  
  Ripple(float maxTime, float posx, float posy, float minSize, float maxSize)
  {
    _timer = 0.0;
    _maxTime = maxTime;
    _pos = new PVector(posx, posy);
    _minSize = minSize;
    _maxSize = maxSize;
    _minStrokeWidth = 0.001;
    _maxStrokeWidth = 5.0;
  }
  
  void Update()
  {
    _timer += 1.0;
    
    if(_timer >= _maxTime)
    {
      _timer = _maxTime;
      _delete = true;
    }
    
    t = _timer / _maxTime;
    
    _size = lerp(_minSize, _maxSize, t);
    _alpha = lerp(255, 0, t);
    _strokeWidth = lerp(_maxStrokeWidth, _minStrokeWidth, t);
  }
  
  void Render()
  {
    stroke(0, 0, 0, 255);
    noFill();
    strokeWeight(_strokeWidth);
    ellipse(_pos.x, _pos.y, _size, _size);
  }
  
  boolean Deleted()
  {
    return _delete;
  }
}

class MouseData {
  boolean _recording = false;
  
  // Mouse coord data
  int _sampleRate;
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
  
  MouseData(int sampleRate)
  {
    _sampleRate = sampleRate;
  }
  
  void StartRecording()
  {
    _recording = true;
  }
  
  void AddCoord(int x, int y)
  {
    _x = append(_x, x);
    _y = append(_y, y);
  }
  
  void AddClick(int x, int y, int time)
  {
    _clickX = append(_clickX, x);
    _clickY = append(_clickY, y);
    _clickTime = append(_clickTime, time);
  }
  
  void AddBounce(int x, int y, int time)
  {
    _bounceX = append(_bounceX, x);
    _bounceY = append(_bounceY, y);
    _bounceTime = append(_bounceTime, time);
  }
  
  void WriteToFile()
  {
    // Mouse position data
    String lines[] =  new String[_x.length + 2];
    
    lines[0] = str(_sampleRate); // Sample rate 
    lines[1] = str(_x.length);  // Total samples
    
    for(int i = 0; i < _x.length; i++)
    {
      lines[i + 2] = _x[i] + "," + _y[i];
    }
    
    saveStrings("mouseData.txt", lines);
    
    // Mouse click data
    String clickLines[] = new String[_clickX.length];
    for(int i = 0; i < _clickX.length; i++)
    {
      clickLines[i] = _clickX[i] + "," + _clickY[i] + "," + _clickTime[i];
    }
    
    saveStrings("clickData.txt", clickLines);
    
    // Bounce data
    String bounceLines[] = new String[_bounceX.length];
    for(int i = 0; i < _bounceX.length; i++)
    {
      bounceLines[i] = _bounceX[i] + "," + _bounceY[i] + "," + _bounceTime[i];
    }
    
    saveStrings("bounceData.txt", bounceLines);
  }
}


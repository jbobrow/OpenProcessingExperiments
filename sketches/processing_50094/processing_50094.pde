
// "Double-Click Festival"
// Run MyCircle first!
import processing.opengl.*;

int frameCounter = 0;
int currentSample = 0;
int time = 0;
int currentClick = 0;
MouseData mouseData;
ArrayList starburstList;
ArrayList starList;

void setup()
{
  size(600, 600, OPENGL);
  frameRate(60);
  smooth();
  background(0);
  
  starburstList = new ArrayList();
  starList = new ArrayList();
  
  mouseData = new MouseData();
  mouseData.LoadFromFile();
  
  // Create stars
  for(int i = 0; i < 500; i++)
  {
    Star s = new Star(random(width), random(height), random(60));
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
  
  if(currentClick < mouseData._clickX.length && time == mouseData._clickTime[currentClick])
  {
    CreateStarburst(new PVector(mouseData._clickX[currentClick], mouseData._clickY[currentClick]));
    currentClick++;
  }
  
  //background(255);
  noStroke();
  fill(0, 20);
  quad(0, 0, 0, height, width, height, width, 0);
  
  // Draw stars
  strokeWeight(2);
  for(int i = 0; i < starList.size(); i++)
  {
    Star s = (Star)starList.get(i);
    stroke(255, s._a);
    point(s._x, s._y);
  }
  
  // Draw click starbursts
  for(int i = 0; i < starburstList.size(); i++)
  {
    Starburst r = (Starburst)starburstList.get(i);
    
    if(r.Deleted())
    {
      starburstList.remove(i);
    }
    else
    {
      r.Update();
      r.Render();
    }
  }
  
  // Draw mouse coord lines
  stroke(255, 255);
  strokeWeight(5);
  
  /*beginShape();
  for(int i = 0; i < currentSample; i++)
  {
    vertex(mouseData._x[i], mouseData._y[i]);
  }
  endShape();*/
  if(currentSample > 0 && currentSample < mouseData._sampleCount)
  {
    point(mouseData._x[currentSample], mouseData._y[currentSample]);
    line(mouseData._x[currentSample], mouseData._y[currentSample], mouseData._x[currentSample - 1], mouseData._y[currentSample - 1]);
  }
}

void CreateStarburst(PVector pos)
{
  Starburst newStarburst = new Starburst(300.0, pos.x, pos.y, 0, 600, random(200), random(200), random(200));
  starburstList.add(newStarburst);
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
  }
}

class Starburst {
  float _timer, _maxTime, t;
  float _size, _minSize, _maxSize;
  float _strokeWidth, _minStrokeWidth, _maxStrokeWidth;
  PVector _pos;
  boolean _delete = false;
  int _r, _g, _b, _a;
  boolean _burst = false;
  
  Starburst(float maxTime, float posx, float posy, float minSize, float maxSize, float r, float g, float b)
  {
    _timer = 0.0;
    _maxTime = maxTime;
    _pos = new PVector(posx, posy);
    _minSize = minSize;
    _maxSize = maxSize;
    _minStrokeWidth = 0.001;
    _maxStrokeWidth = 2.0;
    _r = int(r);
    _g = int(g);
    _b = int(b);
    _a = 255;
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
    
    _a = int(lerp(255, 0, t));
    _size = lerp(_minSize, _maxSize, t);
    _strokeWidth = lerp(_maxStrokeWidth, _minStrokeWidth, t);
  }
  
  void Render()
  {
    if(!_burst)
    {
      _burst = true;
      for(int i = 0; i < 20; i++)
      {
        noStroke();
        fill(_r, _g, _b, 255 - (float(i) / 20) * 255);
        ellipse(_pos.x, _pos.y, float(i) / 20.0 * 100.0, float(i) / 20.0 * 100.0);
      }
    }
    
    float numLines = 16;
    float angle = 360.0 / numLines;
    float initAngle = 0.0;
    float curAngle = _timer;
    
    stroke(_r, _g, _b, _a);
    noFill();
    
    for(int i = 0; i < numLines; i++)
    {
      float x = _pos.x + cos(radians(curAngle)) * _size * 0.5;
      float y = _pos.y + sin(radians(curAngle)) * _size * 0.5;
      float x2 = _pos.x + cos(radians(initAngle)) * _size;
      float y2 = _pos.y + sin(radians(initAngle)) * _size;
      
      strokeWeight(3);
      point(x2, y2);
      
      strokeWeight(_strokeWidth);
      line(_pos.x, _pos.y, x, y);
      //line(x2, y2, x, y);
      
      curAngle += angle;
      initAngle += angle;
    }
  }
  
  boolean Deleted()
  {
    return _delete;
  }
}


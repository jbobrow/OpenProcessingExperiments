
Emitter emitter;
String tinkle;
String waterStr; 
ArrayList splashList; 
Water water; 
int prevTime = 0;
int curTime = 0;
float deltaTime = 0.0; 
PVector mouseV;
float gravity = 9.8;
 
void setup()
{
  size(640, 480); 
  background(0);
  smooth();
  textSize(38); 
  tinkle = "fountain";
  waterStr = "Fountain"; 
  emitter = new Emitter();
  mouseV = new PVector(0, 0);  
  water = new Water(); 
  splashList = new ArrayList();   
}
 
void draw()
{
  background(0);  
  Update();
  Render();
}
 
void Update()
{
  prevTime = curTime;
  curTime = millis();
  deltaTime = (curTime - prevTime) / 1000.0f;   
  mouseV = new PVector(mouseX - pmouseX, mouseY - pmouseY);   
  water.Update();
  emitter.Update();   
  SplashEmitter e = null;
  // Update splash emitters
  for(int i = 0; i < splashList.size(); i++)
  {
    e = (SplashEmitter)splashList.get(i);
    e.Update();
    if(e._baleted)
    {
      splashList.remove(i);
      e = null;
      i--;
    }
  }   
}
 
void mousePressed()
{
  emitter._active = !emitter._active;
}
 
void Render()
{ 
  water.Render();
  emitter.Render();   
  SplashEmitter e = null;
  // Update splash emitters
  for(int i = 0; i < splashList.size(); i++)
  {
    e = (SplashEmitter)splashList.get(i);
    e.Render();
  }
}
 

 


 

 


//for spraying letters

class Emitter {
  PVector _p;
  PVector _dir;
  float _speed;
  float _freq; // 1 particle emitted per this time
  float _variance;
  ArrayList _particleList;
  int _maxParticles;
  float _timer;
  int _currentChar;
  Boolean _active;
   
  Emitter()
  {
    _particleList = new ArrayList();
    _p = new PVector(100, 100);
    _dir = new PVector(0.5, -0.5);
    _speed =350;
    _freq = 0.08;
    _variance = 0.1;
    _maxParticles = 100;
    _timer = 0.0;
    _currentChar = 0;
    _active = false;
  }
   
  Emitter(PVector pos, PVector dir, float speed, float freq, int maxParticles)
  {
    _particleList = new ArrayList();
    _p = pos;
    _dir = dir;
    _speed = speed;
    _freq = freq;
    _variance = 0.1;
    _maxParticles = maxParticles;
    _timer = 0.0;
    _active = false;
  }
   
  void Update()
  {
    _p = new PVector(mouseX, mouseY);
    _timer += deltaTime;
    while(_timer >= _freq)
    {
      if(_active)
      {
        EmitParticle();
      }      
      _timer -= _freq;
    }     
    // Update all particles
    for(int i = 0; i < _particleList.size(); i++)
    {
      Letter l = (Letter)_particleList.get(i);
      l.Update();      
      if(l._baleted)
      {
        _particleList.remove(i);
        l = null;
        i--;
      }
    }
  }
   
  void Render()
  {
     fill(water._r, water._g, water._b);
    for(int i = 0; i < _particleList.size(); i++)
    {
      Letter l = GetLetter(i);
      pushMatrix();
      translate(l._p.x, l._p.y);
      rotate(l._angle);
      text(l._letter, 0, 0);
      popMatrix();
      pushMatrix();
      translate(2*mouseX-l._p.x,l._p.y);
      rotate(-l._angle);
      text(l._letter, 0, 0);
      popMatrix();
    }
  }
   
  void EmitParticle()
  {
    if(tinkle.charAt(_currentChar) != ' ')
    {
      Letter l = new Letter();
      l._p = new PVector(_p.x, _p.y);
      l._v = new PVector((_dir.x + random(-_variance, _variance)) * _speed, (_dir.y) * _speed + mouseV.y);
      l._a = new PVector(0, gravity);
      l._angleV = random(-0.05, 0.05);
      l._width = textWidth(tinkle.charAt(_currentChar));     
      l._letter = tinkle.charAt(_currentChar);       
      _particleList.add(l);
    }     
    _currentChar++;
    if(_currentChar >= tinkle.length())
    {
      _currentChar = 0;
    }
  }
   

   
  Letter GetLetter(int i)
  {
    return (Letter)_particleList.get(i);
  }
}

//get letters for Emitter
class Letter {
  PVector _p;
  PVector _v;
  PVector _a;
  PVector _prevP;
  float _width;
  float _angle;
  float _angleV;
  char _letter;
  float _friction;
  float _impactFriction;
  float _splashFactor;
  Boolean _baleted;  
  final int STATE_OUT = 0;
  final int STATE_IN = 1;
  int _state;
   
  Letter()
  {
    _p = new PVector(width / 2, height / 2);
    _prevP = _p;
    _v = new PVector(0, 0);
    _a = new PVector(0, 0);
    _width = 0;
    _angle = 0;
    _angleV = 0;
    _letter = 'a';
    _friction = 0.98;
    _impactFriction = 0.35;
    // 
    _baleted = false;
    _state = STATE_OUT;
  }
   
  Letter(PVector pos, PVector vel, PVector acc, float a, float av, float lWidth, char letter)
  {
    _p = pos;
    _prevP = _p;
    _v = vel;
    _a = acc;
    _width = lWidth;
    _angle = a;
    _angleV = av;
    _letter = letter;
    _friction = 0.98;
    _impactFriction = 0.35;
    // 
    _baleted = false;
    _state = STATE_OUT;
  }
   
  void Update()
  {
    _prevP = new PVector(_p.x, _p.y);     
    _v.x += _a.x;
    _v.y += _a.y;
    _p.x += _v.x * deltaTime;
    _p.y += _v.y * deltaTime;     
    _angle += _angleV;     
    if(_p.x < -_width || _p.x > width + _width)
    {
      _baleted = true;
    }
    else if(_p.y < -100 + textDescent())
    {
      _baleted = true;
    }
     
    // Below water level and out of water
   if(_p.y > water._height && _state == STATE_OUT)
    {
      _state = STATE_IN;
      _v.x *= _friction;
      _v.y *= _impactFriction;
      _angleV *= 0.98;      
      if(water._height < height/2){
        water._height = height/2;
      }else{
        water._height -= 0.2; 
      }     
      if(_prevP.y < water._height)
      {
        SplashEmitter e = new SplashEmitter(new PVector(_p.x, water._height - 20),
          new PVector(0, -1), _v.y * 0.65, 30);
        splashList.add(e);
      }
    }
  }
}
 
//get particles for splashemitter
class Particle {
  PVector _p;
  PVector _v;
  PVector _a;
  char _letter;
  Boolean _baleted;
   
  Particle(PVector pos, PVector vel, PVector acc, char letter)
  {
    _p = pos;
    _v = vel;
    _a = acc;  
    _baleted = false;
  }
   
  void Update()
  {
    _v.x += _a.x;
    _v.y += _a.y;
    _p.x += _v.x * deltaTime;
    _p.y += _v.y * deltaTime;       
    if(_p.y < -100 + textDescent())
    {
      _baleted = true;
    }     
    // Entering water
    if(_p.y > water._height)
    {
      _baleted = true;
    }
  }
}


class SplashEmitter {
  PVector _p;
  PVector _dir;
  float _speed;
  float _variance;
  float _posVariance;
  ArrayList _particleList;
  int _numParticles;
  Boolean _baleted;
   
  SplashEmitter()
  {
    _particleList = new ArrayList();
    _p = new PVector(100, 100);
    _dir = new PVector(0, -1);
    _speed = 400;
    _variance = 1;
    _posVariance = 10;
    _numParticles = 50;
    _baleted = false;     
    for(int i = 0; i < _numParticles; i++)
    {
      EmitParticle();
    }
  }
   
  SplashEmitter(PVector pos, PVector dir, float speed, int numParticles)
  {
    _particleList = new ArrayList();
    _p = pos;
    _dir = dir;
    _speed = speed;
    _variance = 1;
    _posVariance = 10;
    _numParticles = numParticles;
    _baleted = false;     
    for(int i = 0; i < _numParticles; i++)
    {
      EmitParticle();
    }
  }
   
  void Update()
  {
    // Update all particles
    for(int i = 0; i < _particleList.size(); i++)
    {
      Particle l = (Particle)_particleList.get(i);
      l.Update();    
      if(l._baleted)
      {
        _particleList.remove(i);
        l = null;
        i--;
      }
    }
          
    if(_particleList.size() == 0)
    {
      _baleted = true;
    }
  }
   
  void Render()
  {
    fill(water._r, water._g, water._b);
    for(int i = 0; i < _particleList.size(); i++)
    {
      noStroke();
      Particle l = GetParticle(i);
      pushMatrix();
      translate(l._p.x, l._p.y);
      ellipse(0,0,5,5);
      popMatrix();
      pushMatrix();
      translate(2*mouseX-l._p.x, l._p.y);
      ellipse(0,0,5,5);
      popMatrix();
    }
  }
   
  void EmitParticle()
  {
    Particle p = new Particle(new PVector(_p.x + random(-_posVariance, _posVariance), _p.y),
      new PVector((_dir.x + random(-_variance, _variance)) * _speed, (_dir.y +  random(-_variance, _variance)) * _speed + mouseV.y),
      new PVector(0, gravity),'.');   
    _particleList.add(p);
  }
   
   
  Particle GetParticle(int i)
  {
    return (Particle)_particleList.get(i);
  }
}
class Water {
  float _height;
  int _r;
  int _g;
  int _b;
   
  Water()
  { 
    _height= height - 50;
    _r = 0;
    _g = 170;
    _b = 240;
  }
   
  void Update()
  {
    if(_height < 0)
    {
      _height = 0;
    }
  }
   
  void Render()
  {
    fill(_r, _g, _b);     
    int modx = 0;
    int mody = 0;     
    pushMatrix();
    translate(0, _height);   
    for(int y = 0; y < 20; y++)
    {
      for(int x = 0; x < 8; x++)
      {
        text(waterStr, modx, mody);
        modx += textWidth(waterStr);
      }
      modx = 0;
      mody += textAscent() + textDescent();
    }    
    popMatrix();
  }
}



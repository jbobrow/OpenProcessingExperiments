
Schneeflocke [] _schnee; 
Santa _bob;

ArrayList <float[]> _deadSnow = new ArrayList<float[]>();
int _floor;


void setup()
{
  size(1000, 700);
  _schnee = new Schneeflocke[1000];

  int j = 1;
  
  for (int i = 0; i < _schnee.length; i+=2)
  { 
    //kleine Flocken
    _schnee[i] = new Schneeflocke(random(width), random(height), random(1, 5));
    
    //große Flocken
    _schnee[j] = new Schneeflocke(random(width), random(height), random(5, 11));
    
    j+=2;
  }
  
  _bob = new Santa();
}



void draw()
{
  background(0);

  schneefall(0);

  _bob.zeichne();

  schneefall(1);


  for (float[] werte : _deadSnow)
  {
    noStroke();
    fill(255);
    ellipse(werte[0], werte[1], werte[2], werte[2]);
  }
}

void schneefall(int i)
{
  for ( ; i < _schnee.length; i+=2)
  { 
    _schnee[i].update();  

    if (_schnee[i].checkCollision())
    {  
      //ab 200 toten Flocken wird die Schneegrenze angehoben
      if (_deadSnow.size() % 200 == 0)
      {
        _floor += 2;
      }

      _deadSnow.add(new float[] {_schnee[i]._posX, _schnee[i]._posY-_floor, _schnee[i]._radius});
      _schnee[i].reset();
    }

    _schnee[i].zeichne();
  }
}



class Santa
{
  PImage _rechtsPic;
  PImage _linksPic;
  int _posX;
  int _posY = height - 180;
  int _skalierung = 25;
  boolean _rechtsrum;

  Santa()
  {
    _rechtsPic = loadImage("wmRechts.png");
    _linksPic = loadImage("wmLinks.png");
    _posX = width/2;
  }

  void update()
  {
    if (_rechtsrum) {
      _posX += 2;
    }
    else
    {
      _posX -= 2;
    }

    if (_rechtsrum && _posX > width - 200) {
      _rechtsrum = false;
    }
    else if (!_rechtsrum && _posX < 100)
    {
      _rechtsrum = true;
    }
  }

  void zeichne() {
    update();

    if (_rechtsrum) {
      image(_rechtsPic, _posX, _posY, 5 * _skalierung, 7 * _skalierung);
    } 
    else
    {
      image(_linksPic, _posX, _posY, 5 * _skalierung, 7 * _skalierung);
    }
  }
}

class Schneeflocke
{
  float _posX, _posY;
  float _radius;

  Schneeflocke(float posX, float posY, float radius)
  {
    _posX = posX;
    _posY = posY;
    _radius = radius;
  }

  void zeichne()
  {
    noStroke();
    fill(255);
    ellipse(_posX, _posY, _radius, _radius);
  }

  boolean checkCollision()
  {
  
    return _posY > height;

  }

  void reset()
  {
    _posY = 0;
    _posX = random(width);
    _radius = random(1, 11);
  }

  void update()
  {
    int speed;

    if (_radius < 11 && _radius >= 6)
    {
      speed = 3;
    } else if (_radius < 6 || _radius >= 3)
    {
      speed = 2;
    } else
    {
      speed = 1;
    }

    _posY += speed;
  }
}



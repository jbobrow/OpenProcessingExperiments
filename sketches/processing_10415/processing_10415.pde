
class Particle extends Simulated
{
  float life, decay;
  
  Particle() { super(); life = 1.0; decay = 1.0;}
  
  void update() {
    integrate();
    life -= dt*decay;
  }
  
  void display() {}
}

class Emitter
{
  float rate, surplus;
  private ArrayList _particles;
  
  Emitter() {
    rate = 0;
    surplus = 0;
    _particles = new ArrayList();
  }
  
  void clear() { _particles.clear(); }
  
  Particle createParticle() { return new Particle(); }
  
  void update() {
    // Removing dead particles
    for(int i=_particles.size()-1; i>=0; i--) {
      Particle p = (Particle)_particles.get(i);
      p.update();
      if(p.life<=0) _particles.remove(i);
    }
    
    // Calculating nb of particles to create (allowing for slow rate of creation)
    surplus += rate*dt;
    int nb = floor(surplus);
    surplus -= nb;
    
    // Creation
    for(int i=0; i<nb; i++) _particles.add(createParticle());
  }
  
  void display() { 
    for(int i=0; i<_particles.size(); i++) 
      ((Particle)_particles.get(i)).display();
  }
}

class ThrusterParticle extends Particle
{
  ThrusterParticle() { super(); decay=3; }
  void display()
  {
    color c = thrustersColors[ceil(thrustersColors.length*life)-1];
    stroke(c); fill(c);
  //  circle(pos,2);
    point(pos);
    point(pos.x+1,pos.y);
    point(pos.x,pos.y+1);
    point(pos.x+1,pos.y+1);
  }
}

// lookupTable for the colors
color thrustersColors[];

class ThrusterEmitter extends Emitter
{
  private Ship _ship;
  private int _side;
  private Vect _pos;
  private float _rot, _vel;
  
  ThrusterEmitter(Ship ship, int side)
  {
    _ship = ship;
    _side = side;
    _pos = new Vect();
    _rot = _vel = 0;
    switch(_side) {
      case 0: _pos.set(-4,0);  _vel=50; _rot=PI;    break; 
      case 1: _pos.set( 8,0);  _vel=30; _rot=0;     break; 
      case 2: _pos.set(5, 2);  _vel=30; _rot= PI/4; break; 
      case 3: _pos.set(5, -2); _vel=30; _rot=-PI/4; break; 
    }
    
    if(thrustersColors == null)
    {
      thrustersColors = new color[30];
      createColors();
    }
  }
  
  void createColors()
  {
    for(int i=0; i<thrustersColors.length; i++)
    {
      float f = (float)i/thrustersColors.length;
      int r,g,b,a;
      r = g = b = 255;
      a = 128;
      
      if(f < 0.4)
        a = floor(map(f, 0.4, 0.0, 128, 0));
      
      if(f > 0.8)
        b = floor(map(f, 1.0, 0.8, 255, 0));
      else if(f > 0.3) {
        g = floor(map(f, 0.8, 0.3, 255, 0));
        b = 0;
      }
      else
        g = b = 0;
      
      thrustersColors[i] = color(r,g,b,a);
    }
  }
  
  Particle createParticle()
  {
    ThrusterParticle p = new ThrusterParticle();
    p.pos = getScreenPos(_ship.pos).add(_pos.rotate(_ship.orientation));
    Vect v = new Vect(_vel*random(.7,1.3), 0);
    v = v.rotate(_ship.orientation+_rot+random(-.3,.3));
    p.vel = _ship.vel.mult(scale).add(v);
    return p;
  }
  
  void update()
  {
    rate = 0;
    switch(_side) {
      case 0: if(_ship.forward)  rate = 150; break; 
      case 1: if(_ship.backward) rate = 30; break; 
      case 2: if(_ship.left)     rate = 30; break; 
      case 3: if(_ship.right)    rate = 30; break; 
    }
    super.update();
  }
}

class DoorParticle extends Particle
{
  color c;
  void display() { 
    int a=life>.5?255:floor(life*2*255);
    a = constrain(a,1,255);
    color tc = c&0x00FFFFFF + (a<<24);
    stroke(tc); noFill(); point(pos); 
  };
}

class DoorEmitter extends Emitter
{
  private color _c;
  private Vect _pos;
  private float _size;
  private int _count, _nb;
  
  DoorEmitter(Door d, color c)
  {
    _c = c;
    _pos = getScreenPos(d.pos);
    _size = d.size * scale;
  }
  
  Particle createParticle()
  { 
    DoorParticle p = new DoorParticle();
    float f = (float)_count / _nb;
    Vect tp = new Vect(_size, 0);
    p.pos = _pos.add(tp.rotate(f*2*PI));
    Vect tv = new Vect(random(5,10),0);
    p.vel = tv.rotate(random(-PI, PI));
    p.c = _c;
    p.decay = 0.75;
    
    _count++;
    return p;
  }
  
  void explode()
  {
    _nb = floor(2*PI*_size);
    surplus = _nb;
    _count = 0;
  }
}


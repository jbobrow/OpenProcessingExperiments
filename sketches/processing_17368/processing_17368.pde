
//GenParticle[] p = new GenParticle[200];
LimitedParticle[] p = new LimitedParticle[80];


void setup(){
  size(100, 100);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-2, 2);
    float velY = -i;
    //p[i] = new GenParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
    p[i] = new LimitedParticle(width/2, height/2, velX, velY, 2.5);
    
  }
  
}

void draw(){
  fill(0, 36);
  rect(0, 0, width, height);
  fill(255);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    //p[i].regenerate();
    p[i].display();
  }
}


class Particle {
  float x, y;
  float vx, vy;
  float radius;
  float gravity = 0.1;
  
  public Particle (float _x, float _y, float _vx, float _vy, float _radius) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    radius = _radius;
  }
  
  void update() {
    vy += gravity;
    y += vy;
    x += vx;
  }
  
  void display() {
    ellipse(x, y, radius*2, radius*2);
  }
  
}

class GenParticle extends Particle {
  float originX, originY;
  
  GenParticle (float _x, float _y, float _vx, float _vy, float _radius, float _originX, float _originY) {
    super(_x, _y, _vx, _vy, _radius);
    originX = _originX;
    originY = _originY;
  }
  
  void regenerate() {
    if ((x > width + radius) || (x < -radius) || (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-1, 1);
      vy = random(-4, -2);
    }
  }
}

class LimitedParticle extends Particle {
  float friction = 0.99;
  
  LimitedParticle (float _x, float _y, float _vx, float _vy, float _radius) {
    super(_x, _y, _vx, _vy, _radius);
  }
  
  void update() {
    vx *= friction;
    vy *= friction;
    super.update();
    limit();
  }
  
  void limit() {
    if (y > height - radius) {
      vy = -vy;
      y = constrain(y, -height*height, height-radius);
    }
    if ((x > width + radius) || (x < -radius)) {
      vx = -vx;
      x = constrain(x, radius, width-radius);
    }
  }
}
                                
